function create_disp_mat_files(data_file, output_file_suffix)

% import OpenFAST output data from .out file
[all_data, params] = ReadFASTbinary(data_file);

% extract time and displacements
time = all_data(:,1);
PtfmSurge = all_data(:, find(strcmp(params, 'PtfmSurge')));
PtfmSway = all_data(:, find(strcmp(params, 'PtfmSway')));
PtfmHeave = all_data(:, find(strcmp(params, 'PtfmHeave')));
PtfmPitch = all_data(:, find(strcmp(params, 'PtfmPitch')));
PtfmRoll = all_data(:, find(strcmp(params, 'PtfmRoll')));
PtfmYaw = all_data(:, find(strcmp(params, 'PtfmYaw')));
PtfmSurgeVel = all_data(:, find(strcmp(params, 'PtfmTVxi')));
PtfmSwayVel = all_data(:, find(strcmp(params, 'PtfmTVyi')));
PtfmHeaveVel = all_data(:, find(strcmp(params, 'PtfmTVzi')));
PtfmPitchVel = all_data(:, find(strcmp(params, 'PtfmRVyi')));
PtfmRollVel = all_data(:, find(strcmp(params, 'PtfmRVxi')));
PtfmYawVel = all_data(:, find(strcmp(params, 'PtfmRVzi')));

% shift displacements one time step aheadso they are now acting as inputs
% instead of outputs
PtfmSurge = [0; PtfmSurge(1:end-1)];
PtfmSway = [0; PtfmSway(1:end-1)];
PtfmHeave = [0; PtfmHeave(1:end-1)];
PtfmPitch = [0; PtfmPitch(1:end-1)];
PtfmRoll = [0; PtfmRoll(1:end-1)];
PtfmYaw = [0; PtfmYaw(1:end-1)];
PtfmSurgeVel = [0; PtfmSurgeVel(1:end-1)];
PtfmSwayVel = [0; PtfmSwayVel(1:end-1)];
PtfmHeaveVel = [0; PtfmHeaveVel(1:end-1)];
PtfmPitchVel = [0; PtfmPitchVel(1:end-1)];
PtfmRollVel = [0; PtfmRollVel(1:end-1)];
PtfmYawVel = [0; PtfmYawVel(1:end-1)];

% make everything into Simulink-readable format
PtfmSurge = [time'; PtfmSurge'];
PtfmSway = [time'; PtfmSway'];
PtfmHeave = [time'; PtfmHeave'];
PtfmPitch = [time'; PtfmPitch'];
PtfmRoll = [time'; PtfmRoll'];
PtfmYaw = [time'; PtfmYaw'];
PtfmSurgeVel = [time'; PtfmSurgeVel'];
PtfmSwayVel = [time'; PtfmSwayVel'];
PtfmHeaveVel = [time'; PtfmHeaveVel'];
PtfmPitchVel = [time'; PtfmPitchVel'];
PtfmRollVel = [time'; PtfmRollVel'];
PtfmYawVel = [time'; PtfmYawVel'];

% Save as MAT files
save(['report data/MAT/PtfmSurge_',output_file_suffix,'.mat'], 'PtfmSurge')
save(['report data/MAT/PtfmSway_',output_file_suffix,'.mat'], 'PtfmSway')
save(['report data/MAT/PtfmHeave_',output_file_suffix,'.mat'], 'PtfmHeave')
save(['report data/MAT/PtfmPitch_',output_file_suffix,'.mat'], 'PtfmPitch')
save(['report data/MAT/PtfmRoll_',output_file_suffix,'.mat'], 'PtfmRoll')
save(['report data/MAT/PtfmYaw_',output_file_suffix,'.mat'], 'PtfmYaw')
save(['report data/MAT/PtfmSurgeVel_',output_file_suffix,'.mat'], 'PtfmSurgeVel')
save(['report data/MAT/PtfmSwayVel_',output_file_suffix,'.mat'], 'PtfmSwayVel')
save(['report data/MAT/PtfmHeaveVel_',output_file_suffix,'.mat'], 'PtfmHeaveVel')
save(['report data/MAT/PtfmPitchVel_',output_file_suffix,'.mat'], 'PtfmPitchVel')
save(['report data/MAT/PtfmRollVel_',output_file_suffix,'.mat'], 'PtfmRollVel')
save(['report data/MAT/PtfmYawVel_',output_file_suffix,'.mat'], 'PtfmYawVel')