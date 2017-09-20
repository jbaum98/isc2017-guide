function [ha, dc] = hourDecAngle(dt,longitude)
%HOURDECANGLE Calculate the hour angle and solar declination angle from the
%date, time, and location. Uses arcane NOAA formulas.
jc = julianCent(dt);
meanOblEcc = 23+(26+((21.448-jc.*(46.815+jc.*(0.00059-jc.*0.001813))))./60)./60;
oblCorr = meanOblEcc+0.00256.*cos(deg2rad(125.04-1934.136.*jc));
vary = tan(deg2rad(oblCorr ./ 2)).^2;
geoMeanLong = mod(280.46646+jc.*(36000.76983 + jc.*0.0003032),360);
geoMeanAnom = 357.52911+jc.*(35999.05029 - 0.0001537.*jc);
eccent = 0.016708634-jc.*(0.000042037+0.0000001267.*jc);
eqTime = 4.*rad2deg(vary.*sin(2.*deg2rad(geoMeanLong))-2.*eccent.*sin(deg2rad(geoMeanAnom))+4.*eccent.*vary.*sin(deg2rad(geoMeanAnom)).*cos(2.*deg2rad(geoMeanLong))-0.5.*vary.*vary.*sin(4.*deg2rad(geoMeanLong))-1.25.*eccent.*eccent.*sin(2.*deg2rad(geoMeanAnom)));

timeOffset = eqTime + 4.*longitude - minutes(tzoffset(dt));
tst = dt.Hour .* 60 + dt.Minute + dt.Second ./ 60 + timeOffset;
ha = tst ./ 4;
if ha < 0
    ha = ha + 180;
else
    ha = ha - 180;
end
sunEqCtr = sin(deg2rad(geoMeanAnom)).*(1.914602-jc.*(0.004817+0.000014.*jc))+sin(deg2rad(2.*geoMeanAnom)).*(0.019993-0.000101.*jc)+sin(deg2rad(3.*geoMeanAnom)).*0.000289;
sunTrueLong = geoMeanLong + sunEqCtr;
sunAppLong = sunTrueLong-0.00569-0.00478.*sin(deg2rad(125.04-1934.136.*jc));
dc = rad2deg(asin(sin(deg2rad(oblCorr)).*sin(deg2rad(sunAppLong))));
end