function [x,y]=harris(img,sigma_d,sigma_i,thresh)
  response = harris_response(img,sigma_d,sigma_i);
  maximg = nonmaxsup2d(response,thresh);
  [y,x] = find(maximg);
  x = x'-1;
  y = y'-1;
end
