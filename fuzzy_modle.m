x1=linspace(-10,10,101);
x2=linspace(0,10,101);
y=linspace(0,10,101);

% input space x1 -> A1 , A2 , A3
A1= gaussian_mf(x1,-6,1);   % 小
A2= gaussian_mf(x1,0,0.5);  % 中
A3= gaussian_mf(x1,7,2);    % 大

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
B1= gaussian_mf(x2,0,2);     % 小
B2= gaussian_mf(x2,5,1);     % 中
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

% output space y -> y1-y5
C1 = (0.5).*triangle_mf(y,0,1,5);  % small
C2 = (0.7).*triangle_mf(y,4,6,8);  % median
C3 = (0.9).*triangle_mf(y,7,10,15); % large

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


% Fuzzy Rule 
%---------------------------------------
% R1: x1 is A1 and x2 is B2 then y1  -- small & median
% R2: x1 is A2 and x2 is B2 then y2  -- median & median
% R3: x1 is A3 and x2 is B1 then y2  -- large & small 
%------------update on 8/28-------------
% R4: x1 is A1 and x2 is B1 then y4  --  small & small
% R5: x1 is A3 and x2 is B3 then y5  --  large & large 
% R6: x1 is A2 and x2 is B1 then y1  --  median & small
% R7: x1 is A2 and x2 is B3 then y3  --  median & large
% R8: x1 is A1 and x2 is B3 then y2  --  small & large
% R9: x1 is A3 and x2 is B2 then y3  --  large & median 
%---------------------------------------

% premise  ( if part )
% R1
[AA1,BB2]=meshgrid(A1,B2);
     pre1=AA1.*BB2;
% R2
[AA2,BB2]=meshgrid(A2,B2);
     pre2=AA2.*BB2;
% R3
[AA3,BB1]=meshgrid(A3,B1);
     pre3=AA3.*BB1;

%----------------update on 8/28 ---------------- 
% R4
[AA1,BB1]=meshgrid(A1,B1);
     pre4=AA1.*BB1;
% R5
[AA3,BB3]=meshgrid(A3,B3);
     pre5=AA3.*BB3;
% R6
[AA2,BB1]=meshgrid(A2,B1);
     pre6=AA2.*BB1;
% R7
[AA2,BB3]=meshgrid(A2,B3);
    pre7=AA2.*BB3;
% R8
[AA1,BB3]=meshgrid(A1,B3);
    pre8=AA1.*BB3;
% R9
[AA3,BB2]=meshgrid(A3,B2);
    pre9=AA3.*BB2;     

%-----------------------------------------------

% draw the picture about R1~R9
subplot(234);
mesh(x1,x2,pre1);
xlabel('x1');
ylabel('x2');

zlabel('Membership Grade');
hold on;
mesh(x1,x2,pre2);
mesh(x1,x2,pre3);
mesh(x1,x2,pre4);
mesh(x1,x2,pre5);
mesh(x1,x2,pre6);
mesh(x1,x2,pre7);
mesh(x1,x2,pre8);
mesh(x1,x2,pre9);
hold off;
axis([min(x1) max(x1) min(x2) max(x2) 0 1.2 ]);
view(-60,20);
title('if part');
text(-7,5,1,'R1');
text(0,5,1,'R2');
text(6,0,1,'R3');
text(-7,0,1,'R4');
text(6,5,1,'R5');
text(0,0,1,'R6');
text(0,10,1,'R7');
text(-7,10,1,'R8');
text(6,10,1,'R9');


     
% conclusion ( then part )
point_n=length(x1);
out=zeros(point_n);
for i=1:point_n    %x1
  for j=1:point_n  %x2
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

subplot(235);
mesh(x1,x2,out'); %繪製圖時,注意方向(out')
xlabel('x1');
ylabel('x2');
zlabel('y');
axis([min(x1) max(x1) min(x2) max(x2) min(y) max(y)]);
%view(30,30);
title('output-input surface');



