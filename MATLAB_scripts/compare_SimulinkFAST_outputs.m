function [] = compare_SimulinkFAST_outputs(outb_dir, Simulink_fst_dir, plot_dir, control_type="displacement")

TMax = 360;

outb_files = dir(outb_dir);
outb_files = {outb_files.name};

for j = 1:length(outb_files)
    if ~contains(outb_files{j},'.outb')
        outb_files{j} = [];
    end
end
outb_files = outb_files(~cellfun('isempty',outb_files));

for j = 1:length(outb_files)
    file_suffix = outb_files{j}(6:end-5);
    
    ptfmonly_suffix = strsplit(file_suffix, '+');
    ptfmonly_suffix = ptfmonly_suffix{1};
    
    % ptfmonly_outb_name = [outb_dir,'/FAST_', ptfmonly_suffix, '.outb'];
    % create_disp_mat_files(ptfmonly_outb_name, ptfmonly_suffix);
    FAST_InputFileName = [Simulink_fst_dir, '/Simulink_', file_suffix,'.fst'];
        
    assignin('base', 'FAST_InputFileName', FAST_InputFileName);
    assignin('base', 'TMax', TMax);
    load_system('../open_loop_test');
    set_param('open_loop_test/PtfmSurgeMAT', 'FileName',...
        ['../report data/MAT/PtfmSurge_',ptfmonly_suffix,'.mat']);
    set_param('open_loop_test/PtfmSwayMAT', 'FileName',...
        ['../report data/MAT/PtfmSway_',ptfmonly_suffix,'.mat']);
    set_param('open_loop_test/PtfmHeaveMAT', 'FileName',...
        ['../report data/MAT/PtfmHeave_',ptfmonly_suffix,'.mat']);
    set_param('open_loop_test/PtfmRollMAT', 'FileName',...
        ['../report data/MAT/PtfmRoll_',ptfmonly_suffix,'.mat']);
    set_param('open_loop_test/PtfmPitchMAT', 'FileName',...
        ['../report data/MAT/PtfmPitch_',ptfmonly_suffix,'.mat']);
    set_param('open_loop_test/PtfmYawMAT', 'FileName',...
        ['../report data/MAT/PtfmYaw_',ptfmonly_suffix,'.mat']);
    
    if control_type == "force"
        set_param('open_loop_test/PtfmSurgeVelMAT', 'FileName',...
            ['../report data/MAT/PtfmSurgeVel_',ptfmonly_suffix,'.mat']);
        set_param('open_loop_test/PtfmSwayVelMAT', 'FileName',...
            ['../report data/MAT/PtfmSwayVel_',ptfmonly_suffix,'.mat']);
        set_param('open_loop_test/PtfmHeaveVelMAT', 'FileName',...
            ['../report data/MAT/PtfmHeaveVel_',ptfmonly_suffix,'.mat']);
        set_param('open_loop_test/PtfmRollVelMAT', 'FileName',...
            ['../report data/MAT/PtfmRollVel_',ptfmonly_suffix,'.mat']);
        set_param('open_loop_test/PtfmPitchVelMAT', 'FileName',...
            ['../report data/MAT/PtfmPitchVel_',ptfmonly_suffix,'.mat']);
        set_param('open_loop_test/PtfmYawVelMAT', 'FileName',...
            ['../report data/MAT/PtfmYawVel_',ptfmonly_suffix,'.mat']);
    end
    
    sim('../open_loop_test.slx',[0,TMax]); 

    % MakeValidationPlots([outb_dir,'/',outb_files{j}], [FAST_InputFileName(1:end-4),'.SFunc.outb'],...
        % file_suffix, [plot_dir,'/',file_suffix])
end