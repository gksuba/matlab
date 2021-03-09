function plotProfiles(buoyTitle, dataTable, paramName, startDateTime, endDateTime, paramRangeMin, paramRangeMax )

%% Plot depth vs parameter - one profile or a set of profiles
%
%   buoyTitle
%   dataTable      A table containing all the data for the plot
%   paramName      The name of the sensor to plot, given as a string


% only consider profiles within time range
dataTable = dataTable(dataTable.DateTime >= startDateTime, : );
dataTable = dataTable(dataTable.DateTime <= endDateTime, : );

dataTable.Group = findgroups(dataTable.ProfileID);

% Now that we have data telling us what group each point belongs in, we can
% plot them by group.

figure
% Inputs:

%Set of marker types to cycle through
% markers = {'o','s','+','*','x','d' }; 

% nice dark purple color:
%  Color =  [ 0.49 0.18 0.56 ]

% Some  'LineStyle' options:
% '-', '--', ':'

% magenta, green, cyan, blue
% with markers:
% lineSpecs = {'ms-','go-','cs-', 'bo-' };
% without markers:
lineSpecs = {'m-','g-','c-', 'b-' };


% use 'hold on' to keep pasting subsequent plotting commands onto the same
% figure
hold on

% loop through each profiles and plot it separately
nProfiles = max(dataTable.Group);

if nProfiles > 4
    disp('Warning - more than four profiles.')
    lineSpecs = {'m-','g-','c-', 'b-', 'k-' };
end

deltaWidth = round( 3.0 / nProfiles, 1);
lineWidth = 0.2;
%Used for both marker size and index into marker type
%markerNum = 1;
lineNum = 1;

for ii = 1:nProfiles
    % pull the data from that group into a separate table, which is not
    % strictly necessary but makes the plotting command easier to write
    tempdata = dataTable(dataTable.Group==ii,:);
    % plot the sensor values on the X axis and depth on the Y axis, using
    % circles for the data points and naming each group according to its
    % first timestamp
    
    %p = plot(tempdata.(paramName), tempdata.Depth,'o-','DisplayName', char(tempdata.DateTime(1))  )
    
    p = plot(tempdata.(paramName), tempdata.Depth, lineSpecs{lineNum},'DisplayName', char(tempdata.DateTime(1)) );
    
    p.LineWidth = lineWidth;;
    lineWidth = lineWidth + deltaWidth;
    lineNum = lineNum + 1;
    
%     p.Color = 'b';
%     p.Marker = markers{markerNum};
%     p.MarkerSize = markerNum + 2;
%     markerNum = markerNum + 1;
    

end


% get a handle to the current axes
ax=gca;

% reverse the Y direction
set(ax,'YDir','reverse');

if exist('paramRangeMin','var') & exist('paramRangeMax','var')
    ax.XLim = [ paramRangeMin   paramRangeMax ];
end


%Set the marker size for the plots
%set(h,{'markers'},{7;6;4;2})  


% show the legend
legend('show','Location','best');

% label the X axis with the sensor name
% XXX need to add appropriate units
xlabel(paramName);

% label the Y axis as depth
ylabel('Depth');

% Add title using the buoy and paramter 
title(strcat(paramName,{' at: '}, buoyTitle));

% turn on the grid lines
grid on
% turn off holding, which is always good practice so you don't accidentally
% paste more plots on top of these

hold off

%% Saving in a PDF file.
saveStartDate = datestr(min(datenum(dataTable.DateTime)),'yyyy-mm-dd');
saveEndDate = datestr(max(datenum(dataTable.DateTime)),'yyyy-mm-dd');

saveasname = strcat('Profile','-',saveEndDate,'-',paramName,'-',buoyTitle,'.png');
set(gcf, 'PaperUnits', 'inches');
 x_width=11.25;
 y_width=5;
 set(gcf, 'PaperPosition', [0 0 x_width y_width]); 
 saveas(gcf,saveasname)



