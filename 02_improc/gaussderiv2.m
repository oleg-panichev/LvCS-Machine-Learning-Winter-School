function [dxx,dxy,dyy]=gaussderiv2(in,sigma)
  x = -ceil(sigma*3.0):ceil(sigma*3.0);
  G = gauss(x, sigma);
  D = dgauss(x, sigma);
  [dx,dy] = gaussderiv(in,sigma);
  dxx = conv2(G,D,dx,'same');
  dxy = conv2(D,G,dx,'same');
  dyy = conv2(D,G,dy,'same');
end