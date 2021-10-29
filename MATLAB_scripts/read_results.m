function read_results(fname)

[all_data, params] = ReadFASTtext(fname);

fields = {'PtfmSurge', 'PtfmSway', 'PtfmHeave', 'PtfmPitch', 'PtfmRoll', ...
    'PtfmYaw', 'PtfmTVxi', 'PtfmTVyi', 'PtfmTVzi', 'PtfmRVyi', 'PtfmRVxi', 'PtfmRVzi'};

fields_read = {'PtfmSurge', 'PtfmSway', 'PtfmHeave', 'PtfmPitch', 'PtfmRoll', ...
    'PtfmYaw', 'PtfmSurgeVel', 'PtfmSwayVel', 'PtfmHeaveVel', 'PtfmPitchVel', ...
    'PtfmRollVel', 'PtfmYawVel'};

results = [];
for i=1:length(fields)
   idx = strcmp(params, fields(i));
   field = all_data(:, idx);
   results = [results field];
end

T = array2table(results, "VariableNames", fields_read);
writetable(T, "results_" + datenum(now) + ".csv")
    
% PtfmSurge = all_data(:, find(strcmp(params, 'PtfmSurge')));
% PtfmSway = all_data(:, find(strcmp(params, 'PtfmSway')));
% PtfmHeave = all_data(:, find(strcmp(params, 'PtfmHeave')));
% PtfmPitch = all_data(:, find(strcmp(params, 'PtfmPitch')));
% PtfmRoll = all_data(:, find(strcmp(params, 'PtfmRoll')));
% PtfmYaw = all_data(:, find(strcmp(params, 'PtfmYaw')));
% PtfmSurgeVel = all_data(:, find(strcmp(params, 'PtfmTVxi')));
% PtfmSwayVel = all_data(:, find(strcmp(params, 'PtfmTVyi')));
% PtfmHeaveVel = all_data(:, find(strcmp(params, 'PtfmTVzi')));
% PtfmPitchVel = all_data(:, find(strcmp(params, 'PtfmRVyi')));
% PtfmRollVel = all_data(:, find(strcmp(params, 'PtfmRVxi')));
% PtfmYawVel = all_data(:, find(strcmp(params, 'PtfmRVzi')));

