%% Create model object 


%% Clear workspace 

close all
clear
% #ok<*CLARRSTR>
 

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
    , "growth", true...
    , "assign", struct("segments", ["hh"]) ...
);



%% Calibrate parameters for world and macro modules

% Collect all baseline parameter values in the p struct; list the values
% afterwards; assign all the values to the model object

p = struct();

p = rwanda.calibrate.macroLocal(p);
p = rwanda.calibrate.macroWorld(p);
p = rwanda.calibrate.macroAssets(p);

p = rwanda.calibrate.connectCreditCreation(p);
p = calibrate.connectCreditRisk(p);
p = calibrate.connectInterestRates(p);

p = rwanda.calibrate.bankLoanPerformance(p);
p = rwanda.calibrate.bankProvisioning(p);
p = rwanda.calibrate.bankCapital(p);

p = calibrate.stress(p);

m = assign(m, p);


%% Calculate steady state

m = steady(m);
checkSteady(m);

m.ln_to_l_hh = 0.06;
m.af_to_l_hh = 0.045;
m = steady( ...
    m ...
    , "exogenize", ["ln_to_l_hh", "af_to_l_hh"] ...
    , "endogenize", ["ss_q_hh", "c1_af_hh"] ...
);
checkSteady(m);


%% Print steady state table for nonlinear model

table( ...
    m, ["steady-level", "steady-change", "form", "description"] ...
    , "writeTable", "steady-state.xlsx" ...
)

m = solve(m);


%% Save model objects to MAT File

save +rwanda/mat/createModel.mat m


