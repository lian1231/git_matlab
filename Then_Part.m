function Then_Part(x1,x2)
% Then Part
%%
% ªì©lÅÜ¼Æ
point_n=length(x1);
y=linspace(0,10,point_n);
out=zeros(point_n);

%%
% output space y -> y1 , y2 , y3
C1 = triangle_mf(y,0,1,5);
C2 = triangle_mf(y,4,6,8);
C3 = triangle_mf(y,7,10,15);

figure;
subplot(221);
plot(y,C1);
hold on;
plot(y,C2);
plot(y,C3);
hold off;
xlabel('y');
ylabel('membership grade');
axis([min(y) max(y) 0 1.2]);
title('consequent MF ');
text(1,1.1,'C1');
text(6,1.1,'C2');
text(9,1.1,'C3');

%%
for i=1:point_n
  for j=1:point_n
  x1_mf1 =   gaussian_mf( x1(i),-6, 1 );
  x2_mf1 =   gaussian_mf( x2(j), 0, 2 );
  x1_mf2 =   gaussian_mf( x1(i), 0, 0.5);
  x2_mf2 =   gaussian_mf( x2(j), 5, 1 );
  x1_mf3 =   gaussian_mf( x1(i), 7, 2 );
  x2_mf3 =   gaussian_mf( x2(j), 10,0.5 );

  w1 =x1_mf1 .* x2_mf1;
  w2 =x1_mf2 .* x2_mf2;
  w3 =x1_mf3 .* x2_mf3;
  
  con_mf1= min( w1 , triangle_mf(y,0,1,5) );
  con_mf2= min( w2 , triangle_mf(y,4,6,8) );
  con_mf3= min( w3 , triangle_mf(y,7,10,15) );
  con_mf_out=[con_mf1;con_mf2;con_mf3];
  overall_out_mf=max(con_mf_out);
  out(i,j)=defuzzy(y,overall_out_mf);
  end
end

subplot(223);
mesh(x1,x2,out);
xlabel('x1');
ylabel('x2');
zlabel('y');
axis([min(x1) max(x1) min(x2) max(x2) min(y) max(y)]);
view(30,30);
title('output-input surface');