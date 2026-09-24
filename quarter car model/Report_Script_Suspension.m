%% Hyundai KONA Electric - suspension parameters
% Front quarter-car model, 20 mph
clear; clc;
%% Load case
% Change only this line:
% "empty" = empty vehicle
% "max"   = maximum vehicle weight case
load_case = "empty";
%% Vehicle data
m_veh_empty = 1720;      % kg, Hyundai KONA Electric mass from your ABS report
m_veh_max   = 2220;      % kg, assumed maximum vehicle weight / GVW case

if load_case == "empty"
    m_veh = m_veh_empty;
else
    m_veh = m_veh_max;
end
%% Existing variable names used by your old script/model
m_driver = 0;            % kept only so old model/script names do not break

wbf = 0.55;              % front weight balance assumption
wbl = 0.50;              % left/right balance

m_uf = 45;               % kg, front unsprung mass per wheel
m_ur = 42;               % kg, rear unsprung mass per wheel
m_u  = m_uf;             % front model, so use front unsprung mass
%% Quarter-car sprung mass
m_s = (m_veh*wbf*wbl) - m_u;
%% Suspension parameters for Hyundai KONA Electric
k_s = 28500;             % N/m, front suspension spring stiffness
c_s = 2100;              % Ns/m, front suspension damping coefficient
k_u = 200000;            % N/m, tyre vertical stiffness
%% Required road speed
v_mph = 20;
mph_to_ms = 0.44704;
v_ms = v_mph*mph_to_ms;
Kp_body = 5e4;
Kd_body = 5e3;
F_active_max = 1500;
F_active_min = -1500;
fprintf('\nKONA suspension parameters loaded\n');
fprintf('Load case: %s\n', load_case);
fprintf('m_s = %.2f kg\n', m_s);
fprintf('m_u = %.2f kg\n', m_u);
fprintf('k_s = %.0f N/m\n', k_s);
fprintf('c_s = %.0f Ns/m\n', c_s);
fprintf('k_u = %.0f N/m\n', k_u);
fprintf('Speed = %.2f mph = %.2f m/s\n\n', v_mph, v_ms);
