%% Create model object 


%% Clear workspace 

close all
clear


%% Read source files and create model object 

% Create a model object based on a subset of modules

modelFiles = [...
    "model-source/macroWorld.model"
    "model-source/macroLocal.model"
    "model-source/macroAssets.model"
    "model-source/__macro__.model"
];

n = Model.fromFile( ...
    modelFiles ...
    , growth=true...
);



%% Calibrate parameters for world and macro modules

% Collect all baseline parameter values in the p struct; list the values
% afterwards; assign all the values to the model object

p = struct();

p = colombia.macroLocal(p);
p = colombia.macroWorld(p);
p = colombia.macroAssets(p);

p = colombia.stress(p);

n = assign(n, p);

%% Calculate steady state

n = steady(n);
checkSteady(n);


%% Print steady state table for nonlinear model

table( ...
    n, ["steady-level", "steady-change", "form", "description"] ...
    , "writeTable", "steady-state.xlsx" ...
)

n = solve(n);


%% Save model objects to MAT File

save mat/createMacro.mat n


