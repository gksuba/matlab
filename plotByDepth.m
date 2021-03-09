function plotByDepth(dataTable,sensorName,depthValues)
% plotByDepth(dataTable,sensorName,depthValues)
%
% Inputs:
%   dataTable       A table containing all the data for the plot
%   sensorName      The name of the sensor to plot, given as a string
%   depthValues     Array of depth values to plot

% round the depth values since they are exactly whole numbers
dataTable.Depth = round(dataTable.Depth);
% use 'hold on' to keep pasting subsequent plotting commands onto the same
% figure
hold on
% loop through the depth values, pasting each plot on top of each other
for ii = 1:length(depthValues)
    % create a logical index that contains only the data from that depth
    idx = dataTable.Depth == depthValues(ii);
    % plot the data from that depth, with Time on the X axis and the sensor
    % value on the Y axis, using circles and a line plot and naming each
    % line according to its depth
    plot(dataTable.Time(idx),dataTable.(sensorName)(idx),'o-','DisplayName',[num2str(depthValues(ii)) ' meters'])
end
% show the legend
legend('show')
% label the X axis as Time
xlabel('Time')
% label the Y axis with the sensor name
ylabel(sensorName)
% turn grid lines on
grid on
% turn off holding
hold off