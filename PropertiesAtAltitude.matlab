% Uses formulas found at https://www.grc.nasa.gov/www/k-12/rocket/atmos.html
% Accurate from sea level to 82345 ft
%% Pressure calculations
x1=0:10:36151.9;
x2=36152:10:82345;
P1=(2116*(((59-0.00356*x1)+459.7)/518.6).^5.256)/144;
P2=(473.1*exp(1.73-0.000048*x2))/144;

figure
plot(x1,P1,x2,P2)
title('Pressure vs Altitude')
xlabel('Altitude (ft)')
ylabel('Pressure (psi)')

%% Temperature Calculations, approx.
T1=59-0.00356*x1;
T2=-70;
for a=1:1:length(x2)
    T2(a)=-70;
end
figure
plot(x1,T1,x2,T2)
title('Temperature vs Altitude')
xlabel('Altitude (ft)')
ylabel('Temperature (F)')

%% Density Calculations
rho1=0;
rho2=0;
for b=1:1:length(x1)
    rho1(b)=((P1(b)*144)/(1718*(T1(b)+459.7)))*32.17;
end
for c=1:1:length(x2)
    rho2(c)=((P2(c)*144)/(1718*(T2(c)+459.7)))*32.17;
end
figure
plot(x1,rho1,x2,rho2)
title('Density vs Altitude')
xlabel('Altitude (ft)')
ylabel('Density (lbm/ft^3)')
