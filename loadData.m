function dataTable = loadData(datFileName, startDateTime, endDateTime)
%
%

%Import the data from the .dat file
dataTable = importDatFile(datFileName)


%Cut the data to match the start and end date/times
dataTable = dataTable(dataTable.DateTime >= startDateTime, : );
dataTable = dataTable(dataTable.DateTime <= endDateTime, : );
