function plotGradient( buoyTitle, dataTable, paramName, paramRangeMin, paramRangeMax )

%
% Required Inputs:
%   buoyLocation   Location of buoy, used in title of plot
%   dataTable      A table containing all the data for the plot
%   paramName      The name of the param to plot, given as a string
%
% Optional Inputs:
%   paramRangeMin
%   paramRangeMax

figure

minDate = floor( min(datenum(dataTable.DateTime)) );
maxDate = floor( max(datenum(dataTable.DateTime)) );

% create a series of 500 evenly spaced time values to interpolate along
interpTime = linspace(minDate , maxDate , 500);

% create a series of 500 evenly spaced depth values to interpolate along
interpDepth = linspace(min(dataTable.Depth),max(dataTable.Depth),500);

% create 500x500 grids of these values
[gridTime,gridDepth] = meshgrid(interpTime,interpDepth);

% use 'griddata' command to interpolate existing data onto these 500x500
% grids to determine the interpolated sensor values
gridSensor = griddata(datenum(dataTable.DateTime),dataTable.Depth,dataTable.(paramName),gridTime,gridDepth);

% create a scatter plot, coloring the Time by Depth points according to the
% sensor value
scatter(gridTime(:),gridDepth(:),[],gridSensor(:),'.')

% get a handle to the current axes
ax=gca;

% add a colorbar
colorbar(ax)

if exist('paramRangeMin','var') & exist('paramRangeMax','var')
    caxis([paramRangeMin, paramRangeMax])
end

% reverse the Y direction
set(ax,'YDir','reverse')

% format the date axes
%datetick('x','dd-mmm-yyyy HH:MM','keepticks')
datetick('x','dd-mmm-yyyy','keepticks')

% rotate the date axes
ax.XTickLabelRotation = 45;

% label the X and Y axes
xlabel('Date/Time')

% Set the time axis to only leave 1 day on either side of data
ax.XLim = [ (minDate - 1)   (maxDate + 1 ) ];


ylabel('Depth')
% add a title to the plot

title(strcat(paramName,{' at: '}, buoyTitle))


%% Saving in a PDF file.
saveStartDate = datestr(min(datenum(dataTable.DateTime)),'yyyy-mm-dd');
saveEndDate = datestr(max(datenum(dataTable.DateTime)),'mm-dd');

saveasname = strcat(saveStartDate,'-','to','-',saveEndDate,'-',paramName,'-',buoyTitle,'.png');
set(gcf, 'PaperUnits', 'inches');
 x_width=11.25;
 y_width=5;
 set(gcf, 'PaperPosition', [0 0 x_width y_width]); 
 saveas(gcf,saveasname)

%print(gcf, '-r80', '-dpng', 'test.png');

