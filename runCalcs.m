


%XXX rename columsn in this function so output just 'min, max and avg'
%XXX make this into a funtion so can easily produce the plot for any buoy
%and paramter = output both table and plot

resultTable = calculateMinMaxAvgByDepth( B4Data, 'Turbidity' )
hold on
plot(resultTable.mean_Turbidity, resultTable.DepthInt)
plot(resultTable.min_Turbidity, resultTable.DepthInt)
plot(resultTable.max_Turbidity, resultTable.DepthInt)
hold off
set(gca,'Ydir','reverse')

resultTable = calculateMinMaxAvgByDepth( B4Data, 'Conductivity' )
hold on
plot(resultTable.mean_Conductivity, resultTable.DepthInt)
plot(resultTable.min_Conductivity, resultTable.DepthInt)
plot(resultTable.max_Conductivity, resultTable.DepthInt)
hold off
set(gca,'Ydir','reverse')

