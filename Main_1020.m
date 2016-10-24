% �D�{�� ���ձa�JIinput output �Ҧ��Ѽ�(17��)

clc;
clear;
%% ��Jinput��
%x1=linspace(-10,10,180);
%x2=linspace(0,10,180);

global Select_Point;

%load('POS_test2');
%% �ؼШ��

target_f =@(x) 2-10*x+(5)*x.^2;
%fplot(@(x_t) 2-10.*x_t+5.*x_t.^2);

%% ��100�I�a�J target & model  & �e��
%Input_Range=[x1,x2];
%Random_Index=randperm(360,101);
%Select_Point=sort(Input_Range(Random_Index)); % input 100�I
%%
load('PSO','Select_Point');   %Ū�� 100 �I
Model_Output=zeros(100,1)';
TargetOut = target_f(Select_Point) ;  %�ؼ� y 100�I

for i=1:100
   % model y 100�I 
   Model_Output(i)=Computing_Model_1012([Select_Point(i),Select_Point(i+1)]);
end
figure(1);
plot(Select_Point,TargetOut,'g',Select_Point(1:100),Model_Output,'r');
xlabel('x');ylabel('y');
text(-6,280,'Target output');
text(-9,70,'Model output');
%%  �p��~�t �P  MSE 

%�~�t = �ؼ�y - model y
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
    title('�쪩�����n version');
else

    plot(Select_Point(1:100),Model_out_v2,'b');
    title('new version');
end
text(-9,200,'pso-Model output');
axis([-10 10 0 300]);