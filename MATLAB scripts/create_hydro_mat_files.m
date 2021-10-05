function create_hydro_mat_files(filename, output_file_suffix)

[all_data, params] = ReadFASTbinary(filename);

% extract time and forces/moments
time = all_data(:,1);
PtfmSurge = all_data(:, find(strcmp(params, 'HydroFxi')));
PtfmSway = all_data(:, find(strcmp(params, 'HydroFyi')));
PtfmHeave = all_data(:, find(strcmp(params, 'HydroFzi')));
PtfmRoll = all_data(:, find(strcmp(params, 'HydroMxi')));
PtfmPitch = all_data(:, find(strcmp(params, 'HydroMyi')));
PtfmYaw = all_data(:, find(strcmp(params, 'HydroMzi')));

% shift forces/moments one time step ahead so they are now acting as inputs
% instead of outputs
PtfmSurge = [0; PtfmSurge(1:end-1)];
PtfmSway = [0; PtfmSway(1:end-1)];
PtfmHeave = [0; PtfmHeave(1:end-1)];
PtfmPitch = [0; PtfmPitch(1:end-1)];
PtfmRoll = [0; PtfmRoll(1:end-1)];
PtfmYaw = [0; PtfmYaw(1:end-1)];

% make everything into Simulink-readable format
PtfmSurge = [time'; PtfmSurge'];
PtfmSway = [time'; PtfmSway'];
PtfmHeave = [time'; PtfmHeave'];
PtfmPitch = [time'; PtfmPitch'];
PtfmRoll = [time'; PtfmRoll'];
PtfmYaw = [time'; PtfmYaw'];

% Save as MAT files
save(['../report data/MAT/Hydro/PtfmSurge_',output_file_suffix,'.mat'], 'PtfmSurge')
save(['../report data/MAT/Hydro/PtfmSway_',output_file_suffix,'.mat'], 'PtfmSway')
save(['../report data/MAT/Hydro/PtfmHeave_',output_file_suffix,'.mat'], 'PtfmHeave')
save(['../report data/MAT/Hydro/PtfmPitch_',output_file_suffix,'.mat'], 'PtfmPitch')
save(['../report data/MAT/Hydro/PtfmRoll_',output_file_suffix,'.mat'], 'PtfmRoll')
save(['../report data/MAT/Hydro/PtfmYaw_',output_file_suffix,'.mat'], 'PtfmYaw')