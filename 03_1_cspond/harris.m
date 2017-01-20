function [x,y]=harris(img,sigma_d,sigma_i,thresh)
  response = harris_response(img,sigma_d,sigma_i);
  maximg = nonmaxsup2d(response,thresh);
  [y,x] = find(maximg);
end

function [x,y,s]=filter_boundaries(im, x, y, s)   
   [height width]=size(im); cutoff = 2.8;
   invalid = x<cutoff*s | x>width-cutoff*s | y<cutoff*s | y>height-cutoff*s;
  x(invalid) = []; y(invalid) = []; if (length(s)>1) s(invalid) = []; end;
end