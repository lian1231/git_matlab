function y = gaussian_mf(x,c,s)
e=(-1/2).*((x-c)/s).^2;
y=exp(e);