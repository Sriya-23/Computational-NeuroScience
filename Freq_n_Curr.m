I = 0:0.001:0.75;

freqs = zeros(1, length(I));
for i = 1:length(I)
    vvals = HHmodel_func(I(i));
    freqs(i) = Freq_val(vvals, 10);
    
end
figure(1)
plot(I,freqs*2, 'k-');

% ylim([0,14])
xlabel('Current in micro Amperes')
ylabel('frequencies(peaks per second)')

title('Frequency vs current');
i1 = 0.02236;
i2 = 0.0624;
i3 = 0.4578;
xline(i1, 'm-', {'I1'})
xline(i2, 'g-', {'I2'})
xline(i3, 'r-', {'I3'})
legend('Freq vs current', 'I1', 'I2', 'I3')
