function out=Computing_Model_PSO_test(input_x,para)
%%
% パPSO_test ㊣ , 代刚 input 把计 12
%%
y=fix(linspace(0,180,100));


% ﹚竡 y fuzzy set
y_small = singleton(y,36)    ;%triangle_mf(y,0,18,90);       % small   
y_medium = singleton(y,108)  ;% triangle_mf(y,72,108,144);   % medium      
y_large =  singleton(y,144)  ;%triangle_mf(y,136,180,270);   % large       
y_vsmall = singleton(y,18)   ;% y_small.^2;                  % CON(C1) very small               
y_elarge = singleton(y,180)  ;% y_large.^8;                  % Extremely large  
%y_fuzzy=[y_small;y_medium;y_large;y_vsmall;y_elarge];

%% -------------------------------家絢崩阶( Mandani Max-min Θ猭 )-------------------------------
%-------- 家絢砏玥
R_out=zeros(9,100);
out=zeros(1,100);


for i=1:(length(input_x)-1)
    
%function rule_out=Fuzzy_Rule_1011(x1_MF,x2_MF,y_MF)
R_out(1,:)=Fuzzy_Rule_1011(gaussian_mf(input_x(i),para(1),para(2))  ,gaussian_mf(input_x(i+1),para(9),para(10))   ,y_small);
R_out(2,:)=Fuzzy_Rule_1011(gaussian_mf(input_x(i),para(3),para(4))  ,gaussian_mf(input_x(i+1),para(9),para(10))   ,y_medium);
R_out(3,:)=Fuzzy_Rule_1011(gaussian_mf(input_x(i),para(5),para(6))  ,gaussian_mf(input_x(i+1),para(7),para(8))    ,y_medium);
R_out(4,:)=Fuzzy_Rule_1011(gaussian_mf(input_x(i),para(1),para(2))  ,gaussian_mf(input_x(i+1),para(7),para(8))    ,y_vsmall);
R_out(5,:)=Fuzzy_Rule_1011(gaussian_mf(input_x(i),para(5),para(6))  ,gaussian_mf(input_x(i+1),para(11),para(12))  ,y_elarge);
R_out(6,:)=Fuzzy_Rule_1011(gaussian_mf(input_x(i),para(3),para(4))  ,gaussian_mf(input_x(i+1),para(7),para(8))    ,y_small);
R_out(7,:)=Fuzzy_Rule_1011(gaussian_mf(input_x(i),para(3),para(4))  ,gaussian_mf(input_x(i+1),para(11),para(12))  ,y_large);
R_out(8,:)=Fuzzy_Rule_1011(gaussian_mf(input_x(i),para(1),para(2))  ,gaussian_mf(input_x(i+1),para(11),para(12))  ,y_medium);
R_out(9,:)=Fuzzy_Rule_1011(gaussian_mf(input_x(i),para(5),para(6))  ,gaussian_mf(input_x(i+1),para(9),para(10))   ,y_large);

% mandani-Θ┮Τrulethen part
All_Rule_Max=max(R_out);

% 秆家絢て
out(i)=defuzzy(y,All_Rule_Max);



end
%-------------------------------家絢崩阶( Mandani Max-min Θ猭 )-------------------------------

