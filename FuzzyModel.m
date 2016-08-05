function FuzzyModel(input_x)
%%  初始變數
%input_x=[5,9];
x1=linspace(-10,10,101);
x2=linspace(0,10,101);
y=linspace(0,10,101);
point_n=length(x1);
out_y=zeros(3,point_n);
x1_A1=0;
x1_A2=0;
x1_A3=0;
x2_B1=0;
x2_B2=0;
x2_B3=0;
%%
% define input/output fuzzy set and  membership function
% input space x1 -> A1 , A2 , A3
%A1= gaussian_mf(x1,-6,1); % 小  -10~-2.2
%A2= gaussian_mf(x1,0,0.5);  % 中   -2~2
%A3= gaussian_mf(x1,7,2);  % 大     -0.6~10

% input space x2 -> B1 , B2 , B3
%B1= gaussian_mf(x2,0,2); % 小   0~7.5
%B2= gaussian_mf(x2,5,1);  % 中  1.2~8.8
%B3= gaussian_mf(x2,10,0.5);  % 大  8.1~10

% output space y -> y1 , y2 , y3
C1 = triangle_mf(y,0,1,5);
C2 = triangle_mf(y,4,6,8);
C3 = triangle_mf(y,7,10,15);

%%
% Fuzzy Rule 
%---------------------------------------
% R1: x1 is A1 and x2 is B1 then y1 
% R2: x1 is A2 and x2 is B2 then y2
% R3: x1 is A3 and x2 is B3 then y3
%---------------------------------------



%%

% if x(1) is A1
if -10<=input_x(1) && input_x(1)<=-2.2
    x1_A1=gaussian_mf(input_x(1),-5,1);
end
% if x(1) is A2
if -2<=input_x(1) && input_x(1)<=2
    x1_A2=gaussian_mf(input_x(1),0,0.5);
end

% if x(1) is A3
if -0.6<=input_x(1) && input_x(1)<=10
    x1_A3=gaussian_mf(input_x(1),7,2);
end

% if x(2) is B1
if 0<=input_x(2) && input_x(2)<=7.5
    x2_B1=gaussian_mf(input_x(2),0,2);
end
% if x(2) is B2
if 1.2<=input_x(2) && input_x(2)<=8.8
    x2_B2=gaussian_mf(input_x(2),5,1);
end

% if x(2) is B3
if 8.1<=input_x(2) && input_x(2)<=10
    x2_B3=gaussian_mf(input_x(2),10,0.5);
end

%--------------------------------------------------------
disp('R1:x1 is A1 and x2 is B1 then y1 ');
disp('R2:x1 is A2 and x2 is B2 then y2 ');
disp('R3:x1 is A3 and x2 is B3 then y3 ');
%rule 1
t1=x1_A1.*x2_B1;
fprintf('Rule 1: %3.2f \n', t1);
out_y(1,:)=min(t1,C1);
%rule 2
t1=x1_A2.*x2_B2;
fprintf('Rule 2: %3.2f \n', t1);
out_y(2,:)=min(t1,C2);
%rule 3
t1=x1_A3.*x2_B3;
fprintf('Rule 3: %3.2f \n', t1);
out_y(3,:)=min(t1,C3);

out_max=max(out_y);
yy=defuzzy(y,out_max);
fprintf('input x = [ %d , %d ], output = %3.5f \n',input_x(1),input_x(2),yy);

%%

     
     


     




