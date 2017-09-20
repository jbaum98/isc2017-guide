function gp = readGeoPoint(file)
%READGEOPOINT Reads latitude and longitude from the first two lines of a 
% file and creates a geopoint from them
latlong = dlmread(file);
lat  = latlong(1);
long = latlong(2);
gp = geopoint(lat, long);
end