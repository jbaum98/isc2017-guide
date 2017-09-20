function [c1, c3] = getC13(wavelength)
%GETC13 Calculate c1 and c3 by fitting given data with splines and
%sampling the fit and desired wavelength
data = readtable(fullfile('data', 'sun', 'c13.csv'));

ppc1 = csaps(data.Wavelength, data.C1, 0.31673854109269317); % c1 fit
ppc3 = csaps(data.Wavelength, data.C3, 0.9);                 % c3 fit

% Sample fits at desired wavelength
c1 = fnval(ppc1, wavelength);
c3 = fnval(ppc3, wavelength);
end