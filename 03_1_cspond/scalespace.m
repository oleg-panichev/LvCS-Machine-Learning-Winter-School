function [ss,sigma]=scalespace(img,levels,step)
  [H, W] = size(img);
  ss = zeros(H, W, levels);
  ss(:,:,1) = img;
  sigma = ones(1,levels);
  for i=2:levels
    sigma(i) = step^(i-1);
    ss(:,:,i) = gaussfilter(img, sigma(i));
  end
end
