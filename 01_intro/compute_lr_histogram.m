function [lr_histogram, lr_centers] = compute_lr_histogram(letter_char, Alphabet, images, labels, num_bins)
% lr_histogram = compute_lr_histogram(letter_char, Alphabet, images, labels, num_bins)
%
%   Calculates feature histogram.
%
%   Parameters:
%       letter_char is a character representing the letter whose feature 
%                   histogram we want to compute, e.g. 'C'
%       Alphabet - string of characters
%       images - images in 3d matrix of shape <h x w x n>
%       labels - labels of images, indices to Alphabet list, <1 x n>
%       num_bins - number of histogram bins
%   
%   Return: 
%       lr_histogram - counts of values in the corresponding bins, vector <1 x num_bins>
%
%   class support: integer classes
    
    n = size(images, 2);
    idx = find(Alphabet==letter_char);
    x = sum(sum(images(:, 1:n/2, labels==idx))) - ...
      sum(sum(images(:, n/2+1:n, labels==idx)));
    x = x(:);
    [lr_histogram, lr_centers] = hist(x, num_bins);
    
end
