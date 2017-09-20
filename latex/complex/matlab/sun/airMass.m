function m = airMass(dt, latlong)
%AIRMASS Calculate the air mass from the date, time, and location

% Calculate the hour angle and solar declination angle
[ha, da] = hourDecAngle(dt, latlong.Longitude);
da = deg2rad(da);
ha = deg2rad(ha);

theta = deg2rad(latlong.Latitude); % Latitude angle

% Calculate the air mass
m = 1 ./ (sin(theta) .* sin(da) + cos(theta) .* cos(da) .* cos(ha));
end