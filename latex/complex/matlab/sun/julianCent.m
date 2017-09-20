function jc = julianCent(dt)
%JULIANCENT Calculates the Julian century of a date
jc = (juliandate(dt)-2451545)./36525;
end