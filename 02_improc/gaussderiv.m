function [dx,dy]=gaussderiv(in,sigma)
  x = -ceil(sigma*3.0):ceil(sigma*3.0);
  G = gauss(x, sigma);
  D = dgauss(x, sigma);
  dx = conv2(G,D,in,'same');
  dy = conv2(D,G,in,'same');
end