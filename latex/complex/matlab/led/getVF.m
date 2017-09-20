function vf = getVF(trial)
%GETVF Calculate the stopping voltage by fitting to two exponentials
options = optimset('Display', 'off');
fitfunc = @(c,t) c(1) .* exp(-t./c(2)) + c(3)*exp(-t./c(4));
startpoints = [7 10 1 1e4];
[coeffs,~,~] = lsqcurvefit(fitfunc, startpoints,    ...
                           trial.Time, trial.Voltage, ...
                           [], [], options);
vf = coeffs(3);
end