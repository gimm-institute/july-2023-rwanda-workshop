%% Create model object 


%% Clear workspace 

close all
clear
% #ok<*CLARRSTR>
 
if ~exist("mat", "dir")
    mkdir mat
end

if ~exist("printout", "dir")
    mkdir printout
end


%% Read source files and create model object 

% Create a model object based on a subset of modules

modelFiles = [...
  "model-source/macroWorld.model"
  "model-source/macroLocal.model"
  "model-source/macroAssets.model"

  "model-source/connectCreditCreation.model"
  "model-source/connectCreditRisk.model"
  "model-source/connectInterestRates.model"

  "model-source/bankLoanPerformance.model"
  "model-source/bankProvisioning.model"
  "model-source/bankCapital.model"
];

m = Model.fromFile( ...
    modelFiles ...
    , growth=true...
    , assign=struct("segments", ["hh"]) ...
);



%% Calibrate parameters for world and macro modules

% Collect all baseline parameter values in the p struct; list the values
% afterwards; assign all the values to the model object

p = struct();

p = rwanda.macroLocal(p);
p = rwanda.macroWorld(p);
p = rwanda.macroAssets(p);

p = rwanda.connectCreditCreation(p);
p = rwanda.connectCreditRisk(p);
p = rwanda.connectInterestRates(p);

p = rwanda.bankLoanPerformance(p);
p = rwanda.bankProvisioning(p);
p = rwanda.bankCapital(p);

p = rwanda.stress(p);


m = assign(m, p);

%% Calculate steady state

m = steady(m);
checkSteady(m);


%% Finalize calibration

m.ln_to_l_hh = 4.5/100;
m.new_rl_hh = m.r + 11/400;
m.rbk = 15/400;

m = steady( ...
    m ...
    , "exogenize", ["ln_to_l_hh", "new_rl_hh", "rbk"] ...
    , "endogenize", ["ss_q_hh", "ss_rl_apm_hh", "c1_rbk_other"] ...
);


%% Print steady state table for nonlinear model

table( ...
    m, ["steady-level", "steady-change", "form", "description"] ...
    , "writeTable", "steady-state.xlsx" ...
)

m = solve(m);


%% Save model objects to MAT File

save mat/createRwanda.mat m


