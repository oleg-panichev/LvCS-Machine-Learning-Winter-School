function D=dgauss(x,sigma)
  D = -1/(sqrt(2*pi)*sigma^3) * x .* exp(-(x.*x)/(2*sigma*sigma));
end