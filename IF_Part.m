function IF_Part(x1,x2)
% IF Part
%%
% 初始變數
%point_n=101;
%x1=linspace(-10,10,point_n);
%x2=linspace(0,10,point_n);

%%
% Define input fuzzy set and membership functions
% input space x1 -> A1 ,A2 ,A3
A1= gaussian_mf(x1,-6,1);   % 小     
A2= gaussian_mf(x1,0,0.5);  % 中   
A3= gaussian_mf(x1,7,2);    % 大     

% input space x2 -> B1 , B2 , B3
B1= gaussian_mf(x2,0,2);     % 小   
B2= gaussian_mf(x2,5,1);     % 中 
B3= gaussian_mf(x2,10,0.5);  % 大  

% Draw the picture of x1 and x2

subplot(221);
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

subplot(222);
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


%%
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
text(6,10,1,'R5');
text(0,0,1,'R6');
text(0,10,1,'R7');
text(-7,10,1,'R8');
text(6,10,1,'R9');

Then_Part(x1,x2);
