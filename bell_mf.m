function y=bell_mf(x,a,b,c)
t=(abs((x-c)./a)).^(2*b);
y=1./(1+t);