function responses = findSpecResponse(specResponse, wavelengths)
%FINDSPECRESPONSE Returns the spectral response factor corresponding to the
%given wavelengths
findingFunc = @(w) find(round(specResponse.Wavelength) == w, 1);
matchingIndices = arrayfun(findingFunc, wavelengths);
responses = specResponse.Responsivity(matchingIndices);
end