%% Settings
% Disable text interpreter, that will be handled by LaTeX
set(groot, 'defaultAxesTickLabelInterpreter','none');
set(groot, 'defaultLegendInterpreter','none');
set(groot, 'defaultTextInterpreter','none');
% Hide figures
visible = 'off';

%% Data Analysis
% Get a list of all the data files
files = dir(fullfile('data', 'leds', '*.txt'));

% For each of the trials...
trials = struct();
for i=1:length(files)
    % Get the path to the file
    path = fullPath(files(i));
    % Parse the file name
    [~,wavelengthStr,~] = fileparts(path);
    
    % Convert file name to a number to get the wavelength
    trials(i).wavelength = str2double(wavelengthStr); 
    % Read the data file and store it
    trials(i).data = readtable(path);
end

% Create a table of wavelength vs stopping voltage
wavelengthVF = vfTable(trials);

% Calculate h by fitting E = hf
[h, wavelengthVF, fitresult, gof] = calcLEDH(wavelengthVF);

% Calculate standard deviation from confidence interval
stdev = diff(confint(fitresult)) ./ 4;

% Compare with accepted value
err = percentErr(h, Constants.H);

%% Figures

figWavelegnth = trials(3).wavelength;
figData = trials(3).data;
t = linspace(min(figData.Time), max(figData.Time), 1000);

% Double Exponential Fit
fig3 = figure('Visible', visible);
hold on
plot(figData.Time, figData.Voltage, 'LineWidth', 2)
fitfunc2 = @(a,b,c,d,x) a .* exp(-x./b) + c .* exp(-x./d);
startpoint = [7 10 1 1e4];
ft = fittype(fitfunc2);
[fitresult, gof] = fit(figData.Time, figData.Voltage, ft, ...
    'StartPoint', startpoint);
coeffs = [fitresult.a fitresult.b fitresult.c fitresult.d];
fitVals = fitfunc2(coeffs(1), coeffs(2), coeffs(3), coeffs(4), t);
plot(t, fitVals, '--', 'LineWidth', 2)
plot(t, coeffs(1) .* exp(-t./coeffs(2)), '--', 'LineWidth', 2)
plot(t, coeffs(3) .* exp(-t./coeffs(4)), '--', 'LineWidth', 2)
xlabel('Time (\si{\second})')
ylabel('Voltage (\si{\volt})')
legend('Experimental Data', 'Fit', '$RC$ Decay', 'Long Decay')
saveFig(fig3, 'complex_fit.tex', '2in', '2in')

% Double Exponential Residual
fig4 = figure('Visible', visible);
resid = figData.Voltage - fitfunc2(coeffs(1), coeffs(2), coeffs(3), coeffs(4), figData.Time);
scatter(figData.Time(1:10:end), resid(1:10:end),1,'x')
xlabel('Time (\si{\second})')
ylabel('Voltage (\si{\volt})')
saveFig(fig4, 'complex_resid.tex', '2in', '2in')

% E = hf
fig5 = figure('Visible', visible);
hold on
scatter(wavelengthVF.Freq, wavelengthVF.Energy)
f = linspace(min(wavelengthVF.Freq), max(wavelengthVF.Freq), 1000);
plot(f, h.*f, 'LineWidth', 2)
xlabel('Frequency (\si{\hertz})')
ylabel('Energy (\si{\joule})')
legend('Experimental Data', 'Fit', 'Location', 'NorthWest')
saveFig(fig5, 'evsf.tex', '2in', '2in')