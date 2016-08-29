function Then_Part(x1,x2)
% Then Part
%%
% ªì©lÅÜ¼Æ
point_n=length(x1);
y=linspace(0,10,point_n);
out=zeros(point_n);

%%
% output space y -> y1-y9
C1 = (0.5).*triangle_mf(y,0,1,5);  % small
C2 = (0.7).*triangle_mf(y,4,6,8);  % median
C3 = (0.9).*triangle_mf(y,7,10,15); % large
%----------------------------------------
% CON(C1) very small
C4 = C1.^2; % update by 8/27 for Rule 4
% Extremely large
C5 = C3.^8; % update by 8/27 for Rule 5


all=[C1;C2;C3;C4;C5];
subplot(233);
plot(y,all);
text(.6,.4,'C1');
text(6,.6,'C2');
text(9.5,.9,'C3');
text(1,.2,'C4');
text(10,.45,'C5');
xlabel('y');
ylabel('membership grade');
axis([min(y) max(y) 0 1.2]);
title('consequent MF ');
%%
for i=1:point_n
  for j=1:point_n
  x1_mf1 =   gaussian_mf( x1(i),-6, 1 );
  x2_mf1 =   gaussian_mf( x2(j), 5, 1 );
  x1_mf2 =   gaussian_mf( x1(i), 0, 0.5);
  x2_mf2 =   gaussian_mf( x2(j), 5, 1 );
  x1_mf3 =   gaussian_mf( x1(i), 7, 2 );
  x2_mf3 =   gaussian_mf( x2(j), 0,2 );
  %------------update on 8/28--------------
  x1_mf4 =   gaussian_mf( x1(i),-6, 1 );
  x2_mf4 =   gaussian_mf( x2(j), 0, 2 );
  
  x1_mf5 =   gaussian_mf( x1(i),7, 2 );
  x2_mf5 =   gaussian_mf( x2(j), 10,0.5);
  
  x1_mf6 =   gaussian_mf( x1(i),0, 0.5);
  x2_mf6 =   gaussian_mf( x2(j), 0, 2 );
  
  x1_mf7 =   gaussian_mf( x1(i),0, 0.5 );
  x2_mf7 =   gaussian_mf( x2(j), 10, 0.5 );
  
  x1_mf8 =   gaussian_mf( x1(i),-6, 1 );
  x2_mf8 =   gaussian_mf( x2(j), 10, 0.5 );
  
  x1_mf9 =   gaussian_mf( x1(i),7, 2 );
  x2_mf9 =   gaussian_mf( x2(j), 5, 1 );
  %----------------------------------------

 w1 =x1_mf1 .* x2_mf1;
 w2 =x1_mf2 .* x2_mf2;
 w3 =x1_mf3 .* x2_mf3;
 
 w4 =x1_mf4 .* x2_mf4;
 w5 =x1_mf5 .* x2_mf5;
 w6 =x1_mf6 .* x2_mf6;
 w7 =x1_mf7 .* x2_mf7;
 w8 =x1_mf8 .* x2_mf8;
 w9 =x1_mf9 .* x2_mf9;
  
  con_mf1= min( w1 , C1 );
  con_mf2= min( w2 , C2 );
  con_mf3= min( w3 , C2 );
  
  con_mf4= min( w4 , C4 );
  con_mf5= min( w5 , C5);
  con_mf6= min( w6 , C1 );
  con_mf7= min( w7 , C3 );
  con_mf8= min( w8 , C2 );
  con_mf9= min( w9 , C3 );
  
  con_mf_out=[con_mf1;con_mf2;con_mf3;con_mf4;con_mf5;con_mf6;con_mf7;con_mf8;con_mf9];
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