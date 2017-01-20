close all;
clear all;
clc;

A = [16     2     3    13;
      5    11    10     8;
      9     7     6    12;
      4    14    15     1]
 
B = [ 3     4     9     4     3     6     6     2     3     4;
      9     2    10     1     4     3     7     1     3     5]

output = matrix_manip(A,B)

%%

load data_33rpz_cv01.mat

ims = permute(images,[1 2 4 3]); % The images must be ordered by the 4th dimension.
figure
montage(ims); colormap gray;

initials = 'NP'

letter_mean1 = compute_letter_mean(initials(1), Alphabet, images, labels);
letter_mean2 = compute_letter_mean(initials(2), Alphabet, images, labels);

imwrite(letter_mean1, 'initial1_mean.png')
imwrite(letter_mean2, 'initial2_mean.png')

num_bins = 10;
[feature_histogram1, feature_histc1] = compute_lr_histogram(initials(1), Alphabet, images, labels, num_bins)
[feature_histogram2, feature_histc2] = compute_lr_histogram(initials(2), Alphabet, images, labels, num_bins)

scrsz = get(groot,'ScreenSize');
fig = figure('Position',[1 scrsz(4)/2 scrsz(3)/1.5 scrsz(4)/1.2]);
ax1 = subplot(2,2,1);
bar(ax1, feature_histc1, feature_histogram1, 'EdgeColor', 'w');
% % xlim([min([feature_histc1, feature_histc2]) max([feature_histc1, feature_histc2])]);
title(['Histogram of letter ', initials(1)])
grid on;

ax2 = subplot(2,2,2);
bar(ax2, feature_histc2, feature_histogram2, 'EdgeColor', 'w');
% xlim([min([feature_histc1, feature_histc2]) max([feature_histc1, feature_histc2])]);
title(['Histogram of letter ', initials(2)])
grid on;

ax3 = subplot(2,2,[3 4]);
bar(ax3, [feature_histc1; feature_histc2]', [feature_histogram1; feature_histogram2]');
% xlim([min([feature_histc1, feature_histc2]) max([feature_histc1, feature_histc2])]);
legend({initials(1), initials(2)});
title('Histograms of letters');
grid on;

linkaxes([ax3, ax1, ax2], 'x');