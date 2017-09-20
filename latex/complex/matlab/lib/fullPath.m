function path = fullPath(file)
%FULLPATH Creates the full path from a file
path = fullfile(file.folder, file.name);
end