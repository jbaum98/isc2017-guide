function dt = parseDateISO(dateStr, tz)
%PARSEDATEISO Creates a Matlab datetime object from a datetime string in
%ISO format, for example 2000-01-01T12:00
dt = datetime(dateStr, 'InputFormat', 'uuu-MM-dd''T''HH:mm', 'TimeZone', tz);
end