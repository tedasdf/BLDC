clc; clear all ;close all;

%%

%Torque = Frorce * radius


%%



N = 2; % number of magnet poles on rotor

theta_elec = N/2 * theta_mech;


%% 
% since Magnts always have two poles 
Np = N/2;

theta_elec = Np * theta_mech;

% differentiate above 
w_elec = Np * w_mech;
f_mech = w_mech/(2 * pi);
f_elec = Np * f_mech;

%% Motor Size

% T = torque 
% k = constant 
% D = rotor diameter
% L = axial rotor length ( the height) 

T = k * (D^2) *L;

%% Magnetic Circuit concepts
% B = flux density
% H = field intensity
% u = permeability 

u = 4 * pi * 1e-7;  % permeability of free space




B = uH;

%% grade to magnet 

grade = 'N52';
data = readtable('Chinese Standard.xlsx');
Magnet_grades = data.Material;

if ~ismember(grade, Magnet_grades)
    fprintf('Invalid grade: %s\n', grade);
else
    

end

%% Modelling Air Gap
% model the permeance or reluactance of an air gap 
%

ag_model = '1';
u = 4*pi*10^-7;
w = % width
A = % input any corss area
g = % air gap length

if ag_model == '1'
    P_ga = u*A/g;
elseif ag_model == '2'
    P_ga = u*(w*(l+2g))/g;
elseif ag_model == '3'
    func = @(x) u*L/(g+pi*x);
    Xmax = ; % no more than 10g
    P_ga = integral(func,0,Xmax);
end

%% Modelling slot
% model the pereance of reluactance of an air gap with slot
%

s_model = '1';
effective_gap_model = '1'
if s_model  == '1'
    Pg = u * A/g;
elseif s_model == '2'
    L =  % this is the depth
    ws =  % slot gap
    Pg = u*(A-ws*L)/g;

elseif s_model == '3'

    ws = 0.01;      % slot width in meters (10 mm)
    ts = 0.02;      % slot pitch in meters (20 mm)
   
    % Carter's coefficient - First approximation
    denom1 = ts * ((5 * g / ws + 1) / ws);
    Kc1 = 1 / (1 - 1 / denom1);  % equivalent to (1 - 1/denom1)^(-1)

    % Carter's coefficient - Second approximation
    term1 = ws / (2 * g);
    term2 = g / ws * log(1 + 0.25 * (ws / g)^2);
    Kc2 = 1 / (1 - (2 * ws / (pi * ts)) * (atan(term1) - term2));

    % Effective air gap lengths
    ge1 = Kc1 * g;
    ge2 = Kc2 * g;

    % Permeance
    Pg1 = mu0 * A / ge1;
    Pg2 = mu0 * A / ge2;
elseif s_model == '4' 
    Pg = u * L * (wt/g + 4/pi * ln(1+ pi* ws/4/g));
end



%% Electrical and Mechanical Relationships


% Assumption :
% copper used is enamel copper winding wirse (329 ohms per 1km)
% resistance of stator 



I = % current flowing through 
N = % winding
R = % reluctance seen by the MMF source

phi = N*I/R;

% Flux linkage denoted by Lambda
lambda = phi * N ; %
% or = N^2 / R * i  subbbing in the Ohms' law equation and flux linkage
% equation


R = P^(-1); % where P is the inductance
3