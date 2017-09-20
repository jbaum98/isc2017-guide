function corrected = correctAtmosphere(data, intensity)
%CORRECTATMOSPHERE Correct for the atmospheric absorption of different
%wavelengths

c1 = data.C1;
alpha = 1.3;
beta  = 0.085;
c2 = beta .* (data.Wavelength*1e3) .^(-alpha);
c3 = data.C3;
m = data.AirMass;

corrected = intensity ./ exp(-(c1 + c2 + c3).*m);
end