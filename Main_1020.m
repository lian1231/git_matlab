% 主程式 測試帶入Iinput output 所有參數(17個)

clc;
clear;
%% 輸入input值
%x1=linspace(-10,10,180);
%x2=linspace(0,10,180);

global Select_Point;

%load('POS_test2');
%% 目標函數

target_f =@(x) 2-10*x+(5)*x.^2;
%fplot(@(x_t) 2-10.*x_t+5.*x_t.^2);

%% 取100點帶入 target & model  & 畫圖
%Input_Range=[x1,x2];
%Random_Index=randperm(360,101);
%Select_Point=sort(Input_Range(Random_Index)); % input 100點
%%
load('PSO','Select_Point');   %讀取 100 點
Model_Output=zeros(100,1)';
TargetOut = target_f(Select_Point) ;  %目標 y 100點

for i=1:100
   % model y 100點 
   Model_Output(i)=Computing_Model_1012([Select_Point(i),Select_Point(i+1)]);
end
figure(1);
plot(Select_Point,TargetOut,'g',Select_Point(1:100),Model_Output,'r');
xlabel('x');ylabel('y');
text(-6,280,'Target output');
text(-9,70,'Model output');
%%  計算誤差 與  MSE 

%誤差 = 目標y - model y
error = TargetOut(2:101) - Model_Output;
MSE_ori=sum(error.^2)/100;
% format long g;

%%    PSO
%MSE_ori=MSE_aft;
    para_out=PSO(TargetOut(2:101),MSE_ori);

    test=reshape(para_out,[],17);
    Model_out_v2=Computing_Model_PSO_test_allpara(Select_Point(1:101),test); % bring the para into the model and compute the 100 point again

    error = TargetOut(2:101) - Model_out_v2;
    MSE_aft=sum(error.^2)/100;

    figure(1);
    hold on;

if MSE_ori<=MSE_aft

    plot(Select_Point(1:100),Model_out_v2,'*b');
    title('原版本較好 version');
else

    plot(Select_Point(1:100),Model_out_v2,'b');
    title('new version');
end
text(-9,200,'pso-Model output');
axis([-10 10 0 300]);