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
    , growth=~true...
    , assign=struct("segments", ["hh"]) ...
);



%% Calibrate parameters for world and macro modules

% Collect all baseline parameter values in the p struct; list the values
% afterwards; assign all the values to the model object

p = struct();

p = calibrate.macroLocal(p);
p = calibrate.macroWorld(p);
p = calibrate.macroAssets(p);

p = calibrate.connectCreditCreation(p);
p = calibrate.connectCreditRisk(p);
p = calibrate.connectInterestRates(p);

p = calibrate.bankLoanPerformance(p);
p = calibrate.bankProvisioning(p);
p = calibrate.bankCapital(p);

p = calibrate.stress(p);

p.ss_roc_cpiw = 1;
p.ss_roc_cpi = 1;
p.ss_roc_y = 1;
p.ss_roc_re = 1;

m = assign(m, p);

%% Calculate steady state

m = steady(m);
checkSteady(m);

folder = "~/iris-pie/examples/gimm/parameters";

p = access(m, "parameter-values");
iris.utils.json.write(p, fullfile(folder, "parameters.json"));

s = access(m, "steady-levels");
s = rmfield(s, fieldnames(p));
s = rmfield(s, "ttrend");
f = fieldnames(s);
s = rmfield(s, f(startsWith(f, "shock_")));
s = rmfield(s, f(startsWith(f, "tune_")));
iris.utils.json.write(s, fullfile(folder, "steady.json"));

return


%% Print steady state table for nonlinear model

table( ...
    m, ["steady-level", "steady-change", "form", "description"] ...
    , "writeTable", "steady-state.xlsx" ...
)

m = solve(m);


%% Save model objects to MAT File

save mat/createModel.mat m


