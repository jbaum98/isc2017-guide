function data = vfTable(trials)
%VFTABLE Calculates the stopping voltage for each trial and creates a table
% of wavelength vs. stopping voltage
data = table;
data.Wavelength = [trials.wavelength]';
data.VF = cellfun(@(trial) getVF(trial), {trials.data})';
end