%% Settings
% Disable text interpreter, that will be handled by LaTeX
set(groot, 'defaultAxesTickLabelInterpreter','none');
set(groot, 'defaultLegendInterpreter','none');
set(groot, 'defaultTextInterpreter','none');
% Hide figures
visible = 'off';

%% Data Analysis
% Read location coordinates
latlong = readGeoPoint(fullfile('data', 'sun', 'latlong.txt'));
% Read wavelength intensities
data = readtable(fullfile('data', 'sun', 'sun.csv'));
% Read spectral response curve
specResponse = readtable(fullfile('data', 'sun', 'specresponse.csv'));

% Convert to actual datetimes
data.DateTime = parseDateISO(data.DateTime, '-04:00'); 
% Calculate the airmass
data.AirMass = airMass(data.DateTime, latlong);
% Normalize for width of wavelength range passed by filters
data.VoltagePerNM = data.Voltage ./ data.Width;
% Calculate the spectral response factors for the wavelengths
responses = findSpecResponse(specResponse, data.Wavelength);
% Correct for spectral response
data.PhotodiodeCorrected = data.VoltagePerNM ./ responses;

% Calculate coefficients c1 and c3
[c1,c3] = getC13(data.Wavelength);
data.C1 = c1;
data.C3 = c3;
% Correct for atmospheric absorption
data.AtmosphereCorrected = correctAtmosphere(data,data.PhotodiodeCorrected);

% Calculate h from fitting to blackbody radiation
[h, fitresult, gof, stdev] = calcSunH(data);
% Compare with accepted value
err = percentErr(h, Constants.H);

%% Figures
% Atmospheric Correction and Fit
fig = figure('Visible', visible);
hold on
scatter(data.Wavelength, data.AtmosphereCorrected);
w = linspace(0, 1500, 1000);
i = (fitresult.a .*1e-29 ./ (w.*1e-9).^5) .*...
    (1./(exp(fitresult.k./(w.*1e-9)) - 1));
plot(w, i, 'LineWidth', 2)
xlabel('Wavelength (\si{\nano\meter})')
ylabel('Intensity (arb. units)')
legend('Corrected Data', 'Fit', 'Location', 'SouthEast')
saveFig(fig, 'sun.tex', '2in', '2in')