function fuzzymodel(input_x)
%%  初始變數
%input_x=[5,9];
x1=linspace(-10,10,101);
x2=linspace(0,10,101);
y=linspace(0,180,101);
point_n=length(x1);
out_y=zeros(3,point_n);
%%
% define input/output fuzzy set and  membership function
% input space x1 -> A1 , A2 , A3
% A1= gaussian_mf(x1,-6,1); % 小  
% A2= gaussian_mf(x1,0,0.5);  % 中 
% A3= gaussian_mf(x1,7,2);  % 大   

% input space x2 -> B1 , B2 , B3
% B1= gaussian_mf(x2,0,2); % 小  
% B2= gaussian_mf(x2,5,1);  % 中
% B3= gaussian_mf(x2,10,0.5);  % 大

% output space y -> y1-y9
C1 = triangle_mf(y,0,18,90);  % small
C2 = triangle_mf(y,72,108,144);  % medium
C3 = triangle_mf(y,136,180,270); % large
%----------------------------------------
% CON(C1) very small
C4 = C1.^2; % update by 8/27 for Rule 4
% Extremely large
C5 = C3.^8; % update by 8/27 for Rule 5


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



%%
if (min(x1)<=input_x(1) && input_x(1)<=max(x1)) && (min(x2)<=input_x(2) && input_x(2)<=max(x2))


% if x(1) is A1

    x1_A1=gaussian_mf(input_x(1),-6,1);

% if x(1) is A2

    x1_A2=gaussian_mf(input_x(1),0,0.5);

% if x(1) is A3

    x1_A3=gaussian_mf(input_x(1),7,2);

% if x(2) is B1

    x2_B1=gaussian_mf(input_x(2),0,2);

% if x(2) is B2

    x2_B2=gaussian_mf(input_x(2),5,1);


% if x(2) is B3

    x2_B3=gaussian_mf(input_x(2),10,0.5);
else
    x1_A1=0;x1_A2=0;x1_A3=0;
    x2_B1=0;x2_B2=0;x2_B3=0;
    disp('your input var is out of the range!');
end
%--------------------------------------------------------
disp('R1:x1 is small  and x2 is median then small ');
disp('R2:x1 is median and x2 is median then median ');
disp('R3:x1 is large  and x2 is small  then median ');
disp('R4:x1 is small  and x2 is small  then very small ');
disp('R5:x1 is large  and x2 is large  then extremely large ');
disp('R6:x1 is median and x2 is small  then small ');
disp('R7:x1 is median and x2 is large  then large ');
disp('R8:x1 is small  and x2 is large  then median ');
disp('R9:x1 is large  and x2 is median then large ');
%rule 1
t1=x1_A1.*x2_B2;
fprintf('Rule 1: %3.5f \n', t1);
out_y(1,:)=min(t1,C1);
%rule 2
t1=x1_A2.*x2_B2;
fprintf('Rule 2: %3.5f \n', t1);
out_y(2,:)=min(t1,C2);
%rule 3
t1=x1_A3.*x2_B1;
fprintf('Rule 3: %3.5f \n', t1);
out_y(3,:)=min(t1,C2);

%rule 4
t1=x1_A1.*x2_B1;
fprintf('Rule 4: %3.5f \n', t1);
out_y(4,:)=min(t1,C4);

%rule 5
t1=x1_A3.*x2_B3;
fprintf('Rule 5: %3.5f \n', t1);
out_y(5,:)=min(t1,C5);

%rule 6
t1=x1_A2.*x2_B1;
fprintf('Rule 6: %3.5f \n', t1);
out_y(6,:)=min(t1,C1);

%rule 7
t1=x1_A2.*x2_B3;
fprintf('Rule 7: %3.5f \n', t1);
out_y(7,:)=min(t1,C3);

%rule 8
t1=x1_A1.*x2_B3;
fprintf('Rule 8: %3.5f \n', t1);
out_y(8,:)=min(t1,C2);

%rule 9
t1=x1_A3.*x2_B2;
fprintf('Rule 9: %3.5f \n', t1);
out_y(9,:)=min(t1,C3);

out_max=max(out_y);
% defuzzy
yy=defuzzy(y,out_max);
fprintf('input x = [ %d , %d ], output = %3.5f \n',input_x(1),input_x(2),yy);

%%

     
     


     




