function G=gauss(x,sigma)

  G = 1/(sqrt(2*pi)*sigma) * exp(-(x.*x)/(2*sigma*sigma));

end

