% calculate the differ between target and fis's output
% and get the MSE = sum(e^2) / n ;

target_function_0918;
fuzzy_0918;
sample=sort(randperm(100*100,100));

target_sample=Target_Rule_out(sample);
fis_sample=  Rule_out(sample);

differ=target_sample-fis_sample;
MSE=sum(differ.^2)/length(sample);
format long g;

