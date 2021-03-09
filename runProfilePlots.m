
%% Define global variables


gB2File = '\\CHLPIBUOY\WACH_B2Data\WACH_B2_Winch_IP_PFL_Step.dat';
gB3File = '\\CHLPIBUOY\WACH_B3Data\WACH_B3_Winch_IP_PFL_Step.dat';
gB4File = '\\CHLPIBUOY\WACH_B4Data\WACH_B4_Winch_IP_PFL_Step.dat';



%% Load all data

B2Data = importDatFile( gB2File )
B3Data = importDatFile( gB3File )
B4Data = importDatFile( gB4File )


%endDateTime = datetime(2017, 7, 18, 13, 0 ,0)
%startDateTime = endDateTime - 1;
%plotProfiles('B2', B2Data, 'Conductivity', startDateTime, endDateTime, 120, 180);

endDateTime = datetime('now');
startDateTime = endDateTime - 1;

plotProfiles('B4', B4Data, 'Conductivity', startDateTime, endDateTime, 120, 180);
plotProfiles('B3', B3Data, 'Conductivity', startDateTime, endDateTime, 120, 180);
plotProfiles('B2', B2Data, 'Conductivity', startDateTime, endDateTime, 120, 180);


endDateTime = datetime('now')-1;
startDateTime = endDateTime - 1;

plotProfiles('B4', B4Data, 'Conductivity', startDateTime, endDateTime, 120, 180);
plotProfiles('B3', B3Data, 'Conductivity', startDateTime, endDateTime, 120, 180);
plotProfiles('B2', B2Data, 'Conductivity', startDateTime, endDateTime, 120, 180);


plotProfiles('B4', B4Data, 'PercentDO', startDateTime, endDateTime);
plotProfiles('B3', B3Data, 'PercentDO', startDateTime, endDateTime);
plotProfiles('B2', B2Data, 'PercentDO', startDateTime, endDateTime);

plotProfiles('B4', B4Data, 'DO', startDateTime, endDateTime);
plotProfiles('B3', B3Data, 'DO', startDateTime, endDateTime);
plotProfiles('B2', B2Data, 'DO', startDateTime, endDateTime);


plotProfiles('B4', B4Data, 'Chlorophyll', startDateTime, endDateTime)
plotProfiles('B3', B3Data, 'Chlorophyll', startDateTime, endDateTime)
plotProfiles('B2', B2Data, 'Chlorophyll', startDateTime, endDateTime)