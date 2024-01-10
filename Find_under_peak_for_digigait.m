function [pks, locs] = Find_minus_peak_for_digigait(data, threshold)
%     Rstd = std(data, 1);
%     thrr = 3.5;
%     nRstd = thrr*Rstd;
%     mean_nRstd = mean(nRstd,1);
%      mean_nRstd = threshold*10^(-6); % [Volts]
         mean_nRstd = -threshold;
    
    [pks, locs] = findpeaks(-data, 'MinPeakHeight', mean_nRstd, 'MinPeakDistance', 100); % find minus peaks
    return    
end