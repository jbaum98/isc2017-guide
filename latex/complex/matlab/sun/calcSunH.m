function [h, fitresult, gof, stdev] = calcSunH(data)
%CALCSUNH Calculate h by fitting to the shape of a blackbody radiation
%curve at the sun's temperature
wavelength = data.Wavelength .* 1e-9;        % Convert to SI nm
intensity = data.AtmosphereCorrected * 1e29; % Scale up to help fit
[xData, yData] = prepareCurveData(wavelength, intensity);

% Set up fittype and options.
ft = fittype( '(a./x.^5) .* (1./(exp(k./x) - 1))', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions('Method', 'NonlinearLeastSquares');
opts.Display = 'Off';
opts.StartPoint = [2.5 1e-06];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );
h = fitresult.k .* Constants.KB .* Constants.SUNTEMP ./ Constants.C;
% Calculate standard deviation from confidence interval
stdev = diff(confint(fitresult)) ./ 4 * Constants.KB .* Constants.SUNTEMP ./ Constants.C;
end