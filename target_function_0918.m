% for test the inference system 
% the question of approximation function
% use 100 points of target function to test  fuzzy_0918's output
% and calculate the MSE

% define var t_x1 , t_x2 , t_y
t_x1=linspace(-10,10,100);
t_x2=linspace(0,10,100);
t_y=linspace(0,180,100);
% 定義 t_x1 的fuzzt_y set
t_x1_small= gaussian_mf(t_x1,-9,2);   % small
t_x1_medium= gaussian_mf(t_x1,-3,1); % medium
t_x1_large= gaussian_mf(t_x1,9,1);    % large
t_x1_fuzzt_y=[t_x1_small;t_x1_medium;t_x1_large];
% 定義 t_x2 的fuzzt_y set
t_x2_small= gaussian_mf(t_x2,1,1);      % small
t_x2_medium= gaussian_mf(t_x2,3,2);     % medium
t_x2_large= gaussian_mf(t_x2,8,1);   % large
t_x2_fuzzt_y=[t_x2_small;t_x2_medium;t_x2_large];
% 定義 t_y 的fuzzt_y set
t_y_small = triangle_mf(t_y,0,28,70);      % small
t_y_medium = triangle_mf(t_y,52,98,120);  % medium
t_y_large = triangle_mf(t_y,136,180,270);  % large
t_y_vsmall = t_y_small.^2;                  % CON(C1) vert_y small                
t_y_elarge = t_y_large.^8;                  % Extremelt_y large
t_y_fuzzt_y=[t_y_small;t_y_medium;t_y_large;t_y_vsmall;t_y_elarge];

% 模糊推論
Target_Rule_out=inference_0918(t_x1_fuzzt_y,t_x2_fuzzt_y,t_y_fuzzt_y,t_y);

figure;
mesh(t_x1,t_x2,Target_Rule_out');
xlabel('t_x1');
ylabel('t_x2');
zlabel('t_y');
axis([min(t_x1) max(t_x1) min(t_x2) max(t_x2) min(t_y) max(t_y)]);
%view(30,30);
title('Target output-input surface');
