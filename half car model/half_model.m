clc;
clear;
openExample('simulink_automotive/AutomotiveSuspensionExample')
% Student-specific speed
v_mph = 20;
v_ms = v_mph * 0.44704;

% Half-car body parameters
Mb  = 580;       % half-car sprung/body mass, kg
Iyy = 850;       % pitch moment of inertia, kg.m^2

% Geometry
Lf = 1.25;       % CG to front axle, m
Lr = 1.35;       % CG to rear axle, m
L  = Lf + Lr;    % wheelbase, m

% Front suspension
ksf = 16200;     % N/m
csf = 1000;      % Ns/m

% Rear suspension
ksr = 16200;     % N/m
csr = 1000;      % Ns/m

% Road delay from front axle to rear axle
t_delay = L / v_ms;

% Gravity
g = 0;
