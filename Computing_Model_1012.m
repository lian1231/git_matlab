function out=Computing_Model_1012(input_x)
%%
% 原始model
%%

[Num_point,Num_v]=size(input_x);

% define var x1 , x2 , y
x1=linspace(-10,10,100);  % ex:汙濁程度
x2=linspace(0,10,100);    % ex:洗衣量 
y=linspace(0,180,100);    % ex:洗衣時間

% 定義 x1 的fuzzy set
%x1_small= gaussian_mf(x1,-6,1);   % small  v1v2
%x1_medium= gaussian_mf(x1,0,0.5); % medium  v3v4
%x1_large= gaussian_mf(x1,7,2);    % large    v5v6
%x1_fuzzy=[x1_small;x1_medium;x1_large];   

% 定義 x2 的fuzzy set
%x2_small= gaussian_mf(x2,0,2);      % small   v7v8
%x2_medium= gaussian_mf(x2,5,1);     % medium   v9v10
%x2_large= gaussian_mf(x2,10,0.5);   % large    v11v12
%x2_fuzzy=[x2_small;x2_medium;x2_large];

% 定義 y 的fuzzy set
y_small = triangle_mf(y,0,18,90);      % small
y_medium = triangle_mf(y,72,108,144);  % medium
y_large = triangle_mf(y,136,180,270);  % large
y_vsmall = y_small.^2;                  % CON(C1) very small                
y_elarge = y_large.^8;                  % Extremely large
%y_fuzzy=[y_small;y_medium;y_large;y_vsmall;y_elarge];

%-------------------------------模糊推論( Mandani Max-min 合成法 )-------------------------------
%-------- 模糊規則
R_out=zeros(Num_point,length(y));
out=zeros(Num_point,1);

for i=1:Num_point  % 輸入幾對(x1,x2)就跑幾次
    
%function rule_out=Fuzzy_Rule_1011(x1_MF,x2_MF,y_MF)
R_out(1,:)=Fuzzy_Rule_1011(gaussian_mf(input_x(i,1),-6,1)  ,gaussian_mf(input_x(i,2),5,1)   ,y_small);
R_out(2,:)=Fuzzy_Rule_1011(gaussian_mf(input_x(i,1),0,0.5) ,gaussian_mf(input_x(i,2),5,1)   ,y_medium);
R_out(3,:)=Fuzzy_Rule_1011(gaussian_mf(input_x(i,1),7,2)   ,gaussian_mf(input_x(i,2),0,2)   ,y_medium);
R_out(4,:)=Fuzzy_Rule_1011(gaussian_mf(input_x(i,1),-6,1)  ,gaussian_mf(input_x(i,2),0,2)   ,y_vsmall);
R_out(5,:)=Fuzzy_Rule_1011(gaussian_mf(input_x(i,1),7,2)   ,gaussian_mf(input_x(i,2),10,0.5),y_elarge);
R_out(6,:)=Fuzzy_Rule_1011(gaussian_mf(input_x(i,1),0,0.5) ,gaussian_mf(input_x(i,2),0,2)   ,y_small);
R_out(7,:)=Fuzzy_Rule_1011(gaussian_mf(input_x(i,1),0,0.5) ,gaussian_mf(input_x(i,2),10,0.5),y_large);
R_out(8,:)=Fuzzy_Rule_1011(gaussian_mf(input_x(i,1),-6,1)  ,gaussian_mf(input_x(i,2),10,0.5),y_medium);
R_out(9,:)=Fuzzy_Rule_1011(gaussian_mf(input_x(i,1),7,2)   ,gaussian_mf(input_x(i,2),5,1)   ,y_large);

% mandani-合成所有rule的then part
All_Rule_Max=max(R_out);

% 解模糊化
out(i)=defuzzy(y,All_Rule_Max);
end
%-------------------------------模糊推論( Mandani Max-min 合成法 )-------------------------------

