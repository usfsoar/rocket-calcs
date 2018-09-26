%% Rocket Flutter Velocity Equation
clear all
clc

% Dimensions given are input dimensions
% G = shear modulus (lb/in^2)
% S = Wing Area (in^2)
% Cr = Root Chord Length (in)
% Ct = Tip Chord Length (in)
% b = semispan (height) (in)
% AR = Aspect Ratio
% t = thickness (in)
% a = speed of sound (ft/s)
% T = Temp (F)
% h = height above sea level (ft)

CrInput = 17;
CtInput = 7.9;
bInput = 6;
tInput = .125;
GInput = 725189; % This G was quickly googled value, validation would be nice
h = 0;

a = 1120;
Cr = CrInput/12;
Ct = CtInput/12;
b = bInput/12;
t = tInput/12;
G = (GInput)*144;

T = 59-.00356*h;
P = 2116*((T+459.7)/518.6)^5.256
S = (1/2)*(Cr+Ct)*b
AR = (b^2)/S;
Lambda = Ct/Cr;

Numerator = 1.337*(AR^3)*P*(Lambda+1);
Denominator = 2*(AR+2)*(t/Cr)^3;

Vf = a*sqrt(G/(Numerator/Denominator))

SafeVf = 0.8*Vf 


















