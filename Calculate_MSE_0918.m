% calculate the differ between target and fis's output
% and get the MSE = sum(e^2) / n ;

% 目標函數建立
target_function_0918;
fuzzy_0918;
% 隨機取100組 (x1,x2) 
sample=sort(randperm(100*100,100));

% 100組 target function value (t)
target_sample=Target_Rule_out(sample);

% 100組 模糊推論出來的值 (y)
fis_sample=  Rule_out(sample);

% 取差值 e=t-y
differ=target_sample-fis_sample;

% 算 MSE = sum(e^2) / n 
MSE=sum(differ.^2)/length(sample);
format long g;
MSE;

