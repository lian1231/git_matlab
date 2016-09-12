function pre = IF_Part(x1_mf,x2_mf)

[A,B]=meshgrid(x1_mf,x2_mf);
pre=A.*B;