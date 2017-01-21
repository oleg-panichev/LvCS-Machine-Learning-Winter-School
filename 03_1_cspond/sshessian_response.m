function [hes,sigma]=sshessian_response(img,levels,step)
  if (nargin < 2) levels = 20; end;
  if (nargin < 3) step = 1.1; end;
  
  [ss,sigma] = scalespace(img,levels,step);

  hes = ss;
  for i = 1:numel(sigma)
    dx = conv2(1, [1 0 -1],ss(:,:,i), 'same');      
    dxx = conv2(1, [1 -2 1],ss(:,:,i), 'same');
    dxy = conv2([1 0 -1], 1, dx, 'same')/4;
    dyy = conv2([1 -2 1], 1, ss(:,:,i), 'same');

    hes(:,:,i) = sigma(i).^4*(dxx.*dyy-dxy.*dxy);
  end
end