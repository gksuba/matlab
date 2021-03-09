
%% Define global variables

gStartDateTime = datetime(2017, 5, 26, 6, 0 ,0)
%gStartDateTime = datetime(2017, 6, 6, 6, 0 ,0)
%gStartDateTime = datetime(2017,6, 22, 6, 0 ,0)
%gStartDateTime = datetime(2017, 7, 3, 18, 0 ,0)
gEndDateTime = datetime('now')


gB2File = '\\CHLPIBUOY\WACH_B2Data\WACH_B2_Winch_IP_PFL_Step.dat';
gB3File = '\\CHLPIBUOY\WACH_B3Data\WACH_B3_Winch_IP_PFL_Step.dat';
gB4File = '\\CHLPIBUOY\WACH_B4Data\WACH_B4_Winch_IP_PFL_Step.dat';

%% Load data

B2Data = loadData(gB2File, gStartDateTime, gEndDateTime);
B3Data = loadData(gB3File, gStartDateTime, gEndDateTime);
B4Data = loadData(gB4File, gStartDateTime, gEndDateTime);
 
 
%% Plot gradients using common scale for a parameter
% XXX (Generalize this for any/all parameters?)

minParamVal = min( [ B2Data.Conductivity ; B3Data.Conductivity ; B4Data.Conductivity ] );
maxParamVal = max( [ B2Data.Conductivity ; B3Data.Conductivity ; B4Data.Conductivity ] );

% Go to the nearest multilpe of 5 below (for min) or above (for max)
% This is actually already handled by the color bar so don't need to do it
%minParamVal = floor( minParamVal / 5 ) * 5 
%maxParamVal = ceil( maxParamVal / 5 ) * 5

% min([a(:); b(:)])
% 
plotGradient('B2', B2Data , 'Conductivity', minParamVal, maxParamVal);

plotGradient('B3', B3Data , 'Conductivity', minParamVal, maxParamVal);
plotGradient('B4', B4Data , 'Conductivity', minParamVal, maxParamVal);




%% Plot gradients



plotGradient('B2', B2Data , 'Temperature')

plotGradient('B3', B3Data , 'Temperature')

plotGradient('B4', B4Data , 'Temperature')

%--

plotGradient('B2', B2Data , 'Conductivity')

plotGradient('B3', B3Data , 'Conductivity')

plotGradient('B4', B4Data , 'Conductivity')

%--


plotGradient('B2', B2Data , 'Chlorophyll' )

plotGradient('B3', B3Data , 'Chlorophyll' )

plotGradient('B4', B4Data , 'Chlorophyll' )


plotGradient('B2', B2Data , 'Chlorophyll', 0, 4 )

plotGradient('B3', B3Data , 'Chlorophyll', 0, 4 )

plotGradient('B4', B4Data , 'Chlorophyll', 0, 4 )

%--

plotGradient('B2', B2Data , 'BGAlgae')

plotGradient('B3', B3Data , 'BGAlgae')

plotGradient('B4', B4Data , 'BGAlgae')


%--

plotGradient('B2', B2Data , 'pH')

plotGradient('B3', B3Data , 'pH')

plotGradient('B4', B4Data , 'pH')

%--

plotGradient('B2', B2Data , 'DO')

plotGradient('B3', B3Data , 'DO')

plotGradient('B4', B4Data , 'DO')


%--

plotGradient('B2', B2Data , 'PercentDO')

plotGradient('B3', B3Data , 'PercentDO')

plotGradient('B4', B4Data , 'PercentDO')

%--

plotGradient('B2', B2Data , 'Turbidity')

plotGradient('B3', B3Data , 'Turbidity')

plotGradient('B4', B4Data , 'Turbidity')








