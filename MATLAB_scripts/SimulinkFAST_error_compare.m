function [] = SimulinkFAST_error_compare(outb_dir)

params = {'PtfmSurge', 'PtfmSway', 'PtfmHeave', 'PtfmRoll', 'PtfmPitch', ...
    'PtfmYaw'};

formal_param_names = {'\it Surge', '\it Sway', '\it Heave', '\it Roll', '\it Pitch', '\it Yaw'};

cases = {'TCC1', 'TCC1t', 'TCC5', 'TCC5t', 'LC43', 'LC44'};

% dofs = {'Ptfm+TT', 'Ptfm+Blades', 'Ptfm+TT+Blades'};
dofs = {'Ptfm'};
% formal_dof_names = {'Drivetrain DOFs', 'Blade DOFs', 'Drivetrain + Blade DOFs'};
formal_dof_names = {'Aero-Elastic Coupling Errors'};
outb_files = dir(outb_dir);
outb_files = {outb_files.name};

for i = 1:length(dofs)
    curr_dof = dofs{i};
    dof_files = outb_files(find(contains(outb_files, [curr_dof,'.'])));
        
    nrmse_errors = zeros(length(cases), length(params));
    for j = 1:length(cases)
        curr_case = cases{j};
        fast_file = dof_files(find(contains(dof_files, ['FAST_', curr_case, '_'])));
        
        if isempty(fast_file) == 0
            fast_file = join([outb_dir, '/', fast_file{1}], '');
            simulink_file = dof_files(find(contains(dof_files, ['Simulink_', curr_case, '_'])));
            simulink_file = join([outb_dir, '/', simulink_file{1}], '');
            [fast_data, fast_params] = ReadFASTbinary(fast_file);
            [simulink_data, simulink_params] = ReadFASTbinary(simulink_file);
            
            for k = 1:length(params)
                fast_param_col = strcmp(params{k}, fast_params);
                simulink_param_col = strcmp(params{k}, simulink_params);
                all(fast_data(:, fast_param_col) == 0)
                point_errors = ((fast_data(:, fast_param_col) - simulink_data(:, simulink_param_col))).^2;
                %             ./ fast_data(:, fast_param_col));
                data_range = max(fast_data(:, fast_param_col)) - min(fast_data(:, fast_param_col));
                param_nrmse = sqrt(sum(point_errors) / length(point_errors)) / data_range;
                
                nrmse_errors(j, k) = param_nrmse * 100;
            end
            
        end
        
    end
    
%     subplot(3,1,i)
    bar_headings = categorical(cases);
    h = bar(bar_headings, nrmse_errors);
%     ylim([0 1])
    ylabel('Normalized RMS Error (%)')
    title(formal_dof_names{i})
    grid on
    if i == length(dofs)
        legend(h, formal_param_names, 'Location', 'bestoutside', 'Orientation', 'horizontal');
    end
end

% print('../report data/AugMat mod (w aero) ae errors.pdf','-dpdf','-fillpage')