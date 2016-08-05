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
% R1: x1 is A1 and x2 is B1 then y1 
% R2: x1 is A2 and x2 is B2 then y2
% R3: x1 is A3 and x2 is B3 then y3
%---------------------------------------

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
subplot(223);
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
view(60,20);
title('if part');
text(0,5,1.2,'R2');
text(5,10,1.2,'R3');

Then_Part(x1,x2);
