function [h, data, fitresult, gof] = calcLEDH(data)
%CALCLEDH Fits a line to E = hf to determine h
data.Freq = Constants.C ./ (data.Wavelength * 1e-9);
data.Energy = Constants.E .* data.VF;
ft = fittype(@(c,x) c .* x);
[fitresult,gof] = fit(data.Freq, data.Energy, ft, 'StartPoint', 1e-34);
h = fitresult.c;
end