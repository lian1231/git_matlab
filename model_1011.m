% to pratice how to make fuzzy sets  and fuzzy rule
% draw the picture of input space and input-output curve


% define var x1 , x2 , y
x1=linspace(-10,10,100);  % ex:汙濁程度
x2=linspace(0,10,100);    % ex:洗衣量 
y=linspace(0,180,100);    % ex:洗衣時間

% 定義 x1 的fuzzy set
x1_small= gaussian_mf(x1,-6,1);   % small
x1_medium= gaussian_mf(x1,0,0.5); % medium
x1_large= gaussian_mf(x1,7,2);    % large
x1_fuzzy=[x1_small;x1_medium;x1_large];

% 定義 x2 的fuzzy set
x2_small= gaussian_mf(x2,0,2);      % small
x2_medium= gaussian_mf(x2,5,1);     % medium
x2_large= gaussian_mf(x2,10,0.5);   % large
x2_fuzzy=[x2_small;x2_medium;x2_large];

% 定義 y 的fuzzy set
y_small = triangle_mf(y,0,18,90);      % small
y_medium = triangle_mf(y,72,108,144);  % medium
y_large = triangle_mf(y,136,180,270);  % large
y_vsmall = y_small.^2;                  % CON(C1) very small                
y_elarge = y_large.^8;                  % Extremely large
y_fuzzy=[y_small;y_medium;y_large;y_vsmall;y_elarge];

% 模糊規則
R1_out=Fuzzy_Rule_1011(x1_small,x2_medium,y_small);
R2_out=Fuzzy_Rule_1011(x1_medium,x2_medium,y_medium);
R3_out=Fuzzy_Rule_1011(x1_large,x2_small,y_medium);
R4_out=Fuzzy_Rule_1011(x1_small,x2_small,y_vsmall);
R5_out=Fuzzy_Rule_1011(x1_large,x2_large,y_elarge);
R6_out=Fuzzy_Rule_1011(x1_medium,x2_medium,y_small);
R7_out=Fuzzy_Rule_1011(x1_medium,x2_large,y_large);
R8_out=Fuzzy_Rule_1011(x1_small,x2_large,y_small);
R9_out=Fuzzy_Rule_1011(x1_large,x2_medium,y_large);

point_n=length(y);
out=zeros(point_n);
% 取聯集(Max)後做 defuzzy
for i=1:point_n
    for j=1:point_n
         con_mf_out=[R1_out(i,j,:);R2_out(i,j,:);R3_out(i,j,:);R4_out(i,j,:);R5_out(i,j,:);R6_out(i,j,:);R7_out(i,j,:);R8_out(i,j,:);R9_out(i,j,:)];
         overall=max(con_mf_out);
         overall_out_mf=overall(:)';
         out(i,j)=defuzzy(y,overall_out_mf);
    end
end







% 畫input-output curve
figure;
mesh(x1,x2,Rule_out');
xlabel('x1');
ylabel('x2');
zlabel('y');
axis([min(x1) max(x1) min(x2) max(x2) min(y) max(y)]);
%view(30,30);
title('output-input surface');
