function [] = MakeValidationPlots(input_file, output_file, plot_title_str,...
    plot_file_root)

%target_params = {'TTDspFA', 'TTDspSS', 'PtfmSurge', 'PtfmSway', 'PtfmHeave',...
%    'PtfmRoll', 'PtfmPitch', 'PtfmYaw', 'YawBrFxp', 'YawBrFyp', 'YawBrFzp',...
%    'YawBrMxp', 'YawBrMyp', 'YawBrMzp', 'TwrBsFxt', 'TwrBsFyt', 'TwrBsFzt',...
%    'TwrBsMxt', 'TwrBsMyt', 'TwrBsMzt', 'RtAeroFxh', 'RtAeroFyh', 'RtAeroFzh',...
%    'RtAeroMxh', 'RtAeroMyh', 'RtAeroMzh', 'FAIRTEN1', 'FAIRTEN2', 'FAIRTEN3',...
%    'ANCHTEN1', 'ANCHTEN2', 'ANCHTEN3'};

target_params = {'RtAeroFxh', 'RtAeroFyh', 'RtAeroFzh', 'RtAeroMxh', 'RtAeroMyh', 'RtAeroMzh'};
%     'YawBrFxp', 'YawBrFyp', 'YawBrFzp', 'YawBrMxp', 'YawBrMyp', 'YawBrMzp',...
%     'TwrBsFxt', 'TwrBsFyt', 'TwrBsFzt', 'TwrBsMxt', 'TwrBsMyt', 'TwrBsMzt'};

[input_data, params, units] = ReadFASTbinary(input_file);
[output_data, ~] = ReadFASTbinary(output_file);
time1 = input_data(:,1);
time2 = output_data(:,1);

for j = 1:length(target_params)
    param_col = strcmp(target_params{j}, params);
    figure
    plot(time2, output_data(:,param_col), '-r', 'LineWidth', 1.5)
    hold on
    plot(time1, input_data(:,param_col), '-k')
    xlabel('Time (s)')
%     ylabel([target_params{j}, ' ', char(units(param_col))])
    ylabel('{\it F_{x, aero}} (N)')
    legend('Numerical model output', 'Reference output', 'Location', 'best')
    title('ServoDyn comparison, LC43', 'FontName', 'Helvetica')
    grid on
    out_filename = [plot_file_root, '_', target_params{j},'.pdf'];
    
    set(gcf,'Units','inches');
    screenposition = get(gcf,'Position');
    screenposition(3) = screenposition(3)*2;
    set(gcf, 'Position', screenposition)
    set(gcf,...
        'PaperPosition',[0 0 screenposition(3:4)],...
        'PaperSize',[screenposition(3:4)]);
    print('-dpdf', out_filename)
    close(gcf)
end
    
    
    