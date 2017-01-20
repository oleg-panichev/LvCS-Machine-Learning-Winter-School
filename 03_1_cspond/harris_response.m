function response=harris_response(img,sigma_d,sigma_i,alpha)
  if (nargin < 2) sigma_d = 1; end;
  if (nargin < 3) sigma_i = 1; end;
  if (nargin < 4) alpha = 0.04; end;

  x = x3sigma(sigma_i);
  G = gauss(x, sigma_i);

  [dx,dy]=gaussderiv(img, sigma_d);
  C11 = gaussfilter(dx.^2, sigma_i);
  C12 = gaussfilter(dx.*dy, sigma_i);
  C21 = C12;
  C22 = gaussfilter(dy.^2, sigma_i);

  detC = C11.*C22 - C12.*C21;
  traceC = C11 + C22;
  
  response=detC - alpha*traceC.*traceC;
end
