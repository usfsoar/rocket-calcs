% Calculates ballast plates if stacked perfectly in a Haack-profile nose cone, from the tip
% Not meant to be perfectly accurate, just a rough approximation of the volume and cost
% Does not account for the aluminum tip or nose cone wall thickness

% -- Settings
base_diameter = 15; % cm
ratio = 5/1;

ballast_density = 8.96; % g/cm^3
ballast_mass = 2.25; % kg

ballast_plate_thickness = 0.3175; %cm

% -- Calculations
length = ratio * base_diameter;

% Equations from https://en.wikipedia.org/wiki/Nose_cone_design#Haack_series
C = 0;
syms x;
theta = acos(1 - (2*x)/length);
y = (base_diameter / (2 * sqrt(pi))) * sqrt(theta - sin(2 * theta)/2 + C * sin(theta)^3);

% Plot the profile for sanity check
fplot(y, [0 length])
title('Nose Cone Profile')
xlabel('Distance from Tip (cm)')
ylabel('Radius (cm)')

cross_area = pi*y^2;
volume = x*cross_area;

ballast_density_kilo = ballast_density / 1000;
ballast_volume = ballast_mass / ballast_density_kilo;

ballast_length = vpasolve(volume == ballast_volume, x, [0 length]);

num_plates = ballast_length / ballast_plate_thickness;

plates_x = [ballast_plate_thickness:ballast_plate_thickness:ballast_plate_thickness*(num_plates + 1)];
y_fun = matlabFunction(y);
plates_radii = feval(y_fun, plates_x);
plates_as_squares_area = [(plates_radii.*2).^2];
total_area = sum(plates_as_squares_area);

fprintf('If ballast perfectly fills nose cone volume starting with the tip,\nit must be %.2f cm long. This would take %i plates and would require\na total sheet metal area of at least %.2f cm^2.', ballast_length, num_plates, total_area);
