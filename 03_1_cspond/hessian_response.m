function response = hessian_response(img,sigma)  
  [Dxx, Dxy, Dyy] = gaussderiv2(img, sigma);
  response = Dxx.*Dyy - Dxy.^2;
end