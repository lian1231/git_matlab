function out=Computing_Model_PSO_test_allpara(input_x,para)
%%
% ��PSO_test �I�s , ���թҦ��Ѽ�
%%
y=fix(linspace(0,180,100));
%para(13)=18;para(14)=108;para(15)=160;para(16)=5;para(17)=180;

% �w�q y ��fuzzy set
y_small = singleton(y,fix(para(13)))    ;%triangle_mf(y,0,18,90);       % small   
y_medium = singleton(y,fix(para(14)))  ;% triangle_mf(y,72,108,144);   % medium      
y_large =  singleton(y,fix(para(15)))  ;%triangle_mf(y,136,180,270);   % large       
y_vsmall = singleton(y,fix(para(16)))   ;% y_small.^2;                  % CON(C1) very small               
y_elarge = singleton(y,fix(para(17)))  ;% y_large.^8;                  % Extremely large  
%y_fuzzy=[y_small;y_medium;y_large;y_vsmall;y_elarge];

%% -------------------------------�ҽk����( Mandani Max-min �X���k )-------------------------------
%-------- �ҽk�W�h
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

% mandani-�X���Ҧ�rule��then part
All_Rule_Max=max(R_out);

% �Ѽҽk��
out(i)=defuzzy(y,All_Rule_Max);



end
%-------------------------------�ҽk����( Mandani Max-min �X���k )-------------------------------
