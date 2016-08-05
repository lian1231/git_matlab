x1=linspace(-10,10,101);
x2=linspace(0,10,101);
y=linspace(0,10,101);
%x1=-10:0.2:10;
%x2=0:0.1:10;

% input space x1 -> A1 , A2 , A3
A1= gaussian_mf(x1,-6,1); % 小
A2= gaussian_mf(x1,0,0.5);  % 中
A3= gaussian_mf(x1,7,2);  % 大

subplot(231);
plot(x1,A1');
hold on;
plot(x1,A2);
plot(x1,A3);
hold off;
xlabel('x1');
ylabel('membership grade');
axis([min(x1) max(x1) 0 1.2]);
title('antecedent MF ');
text(-5.5,1.1,'A1');
text(0,1.1,'A2');
text(5,1.1,'A3');


% input space x2 -> B1 , B2 , B3
B1= gaussian_mf(x2,0,2); % 小
B2= gaussian_mf(x2,5,1);  % 中
B3= gaussian_mf(x2,10,0.5);  % 大

subplot(232);
plot(x2,B1);
hold on;
plot(x2,B2);
plot(x2,B3);
hold off;
xlabel('x2');
ylabel('membership grade');
axis([min(x2) max(x2) 0 1.2]);
title('antecedent MF ');
text(1,1.1,'B1');
text(5,1.1,'B2');
text(9,1.1,'B3');

% output space y -> y1 , y2 , y3
C1 = triangle_mf(y,0,1,5);
C2 = triangle_mf(y,4,6,8);
C3 = triangle_mf(y,7,10,15);


subplot(233);
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

% Fuzzy Rule 
%---------------------------------------
% R1: x1 is A1 and x2 is B1 then y1 
% R2: x1 is A2 and x2 is B2 then y2
% R3: x1 is A3 and x2 is B3 then y3
%---------------------------------------

% premise  ( if part )
% R1
[AA1,BB1]=meshgrid(A1,B1);
     pre1=AA1.*BB1;
% R2
[AA2,BB2]=meshgrid(A2,B2);
     pre2=AA2.*BB2;
% R3
[AA3,BB3]=meshgrid(A3,B3);
     pre3=AA3.*BB3;

% draw the picture about R1,R2 and R2
subplot(234);
mesh(x1,x2,pre1);
xlabel('x1');
ylabel('x2');
text(-5,0,1.2,'R1');
zlabel('Membership Grade');
hold on;
mesh(x1,x2,pre2);
mesh(x1,x2,pre3);
hold off;
axis([min(x1) max(x1) min(x2) max(x2) 0 1.2 ]);
view(-60,20);
title('if part');
text(0,5,1.2,'R2');
text(5,10,1.2,'R3');

     
% conclusion ( then part )
point_n=length(x1);
out=zeros(point_n);
for i=1:point_n
  for j=1:point_n
  x1_mf1 =   gaussian_mf( x1(i),-6, 1 );
  x2_mf1 =   gaussian_mf( x2(j), 0, 2 );
  x1_mf2 =   gaussian_mf( x1(i), 0, 0.5);
  x2_mf2 =   gaussian_mf( x2(j), 5, 1 );
  x1_mf3 =   gaussian_mf( x1(i), 7, 2 );
  x2_mf3 =   gaussian_mf( x2(j), 10,0.5 );
 % w1 = min(x1_mf1 , x2_mf1);
 % w2 = min(x1_mf2 , x2_mf2);
 % w3 = min(x1_mf3 , x2_mf3);
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

subplot(235);
mesh(x1,x2,out');
xlabel('x1');
ylabel('x2');
zlabel('y');
axis([min(x1) max(x1) min(x2) max(x2) min(y) max(y)]);
%view(30,30);
title('output-input surface');



