% calculate the differ between target and fis's output
% and get the MSE = sum(e^2) / n ;

% �ؼШ�ƫإ�
target_function_0918;
fuzzy_0918;
% �H����100�� (x1,x2) 
sample=sort(randperm(100*100,100));

% 100�� target function value (t)
target_sample=Target_Rule_out(sample);

% 100�� �ҽk���ץX�Ӫ��� (y)
fis_sample=  Rule_out(sample);

% ���t�� e=t-y
differ=target_sample-fis_sample;

% �� MSE = sum(e^2) / n 
MSE=sum(differ.^2)/length(sample);
format long g;
MSE;

