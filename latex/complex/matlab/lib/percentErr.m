function err = percentErr(exp, actual)
%PERCENTER Calculates the percent error
err = (exp - actual) ./ actual;
end