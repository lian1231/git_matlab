x=linspace(90,120,300);
% Mean of x
mean_of_x=mean(x);
% Standard Deviation of x
sd_of_x=std(x);
%
y=gaussian_mf(x,mean_of_x,sd_of_x);
figure;
plot(x,y);
%axis([min(x) max(x) min(y) 1.1 ]);
axis([0 150 min(y) 1.1 ]);
