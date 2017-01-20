function out=gaussfilter(in,sigma)
  x = -ceil(sigma*3.0):ceil(sigma*3.0);
  G = gauss(x, sigma);
  out = conv2(G,G,in,'same');
end