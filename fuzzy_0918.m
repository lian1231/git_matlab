% define var x1 , x2 , y
x1=linspace(-10,10,101);
x2=linspace(0,10,101);
y=linspace(0,180,101);

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

% 模糊推論
Rule_out=inference_0918(x1_fuzzy,x2_fuzzy,y_fuzzy,y);

figure;
mesh(x1,x2,Rule_out');
xlabel('x1');
ylabel('x2');
zlabel('y');
axis([min(x1) max(x1) min(x2) max(x2) min(y) max(y)]);
%view(30,30);
title('output-input surface');
