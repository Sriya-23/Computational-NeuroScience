function freq = Freq_val(arr, thresh)
peaks = findpeaks(arr);
peaks = peaks(peaks>0);
% disp(peaks)
freq = sum(peaks >= thresh);

% if uncommented , frequency drops to zero when we encounter inconsistent
% peaks

% if length(peaks) ~= freq
%     freq = 0
% end
