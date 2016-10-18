% �D�{�� ���ձa�JIinput�Ѽ�(12��)

clc;
clear;
%% ��Jinput��
x1=linspace(-10,10,100);
x2=linspace(0,10,100);
%y=linspace(0,180,100);
%input=[5 9];
global MSE_ori;

%% �e input-output curve 
out=zeros(100,100);
for i=1:100
    for j=1:100
      
        input=[x1(i),x2(j)];
        out(i,j)=Computing_Model_1012(input);
               
    end
end
figure;
mesh(x1,x2,out');
xlabel('x1');ylabel('x2');zlabel('y');
title('Model output');

% ��"input"�ȶi�J�p��ҫ�"Computing_Model_1012"
%model_out=Computing_Model_1012(input);
%plot(y,out)
%xlabel('input');ylabel('output');

%% �ؼШ��

%target_f = 2-10*x_t+(5)*x_t.^2;
%fplot(@(x_t) 2-10.*x_t+5.*x_t.^2);

%% ��100�I�a�J target & model  & �e��
Input_Range=[x1,x2];
Random_Index=randperm(200,101);
Select_Point=sort(Input_Range(Random_Index)); % input 100�I
Model_Output=zeros(100,1)';
target_f = 2-10*Select_Point+5*Select_Point.^2;  %�ؼ� y 100�I

for i=1:100
   % model y 100�I 
   Model_Output(i)=Computing_Model_1012([Select_Point(i),Select_Point(i+1)]);
end

plot(Select_Point,target_f,'g',Select_Point(1:100),Model_Output,'r');
xlabel('x');ylabel('y');
text(-6,280,'Target output');
text(-9,70,'Model output');
%%  �p��~�t �P  MSE 

%�~�t = �ؼ�y - model y
error = target_f(2:101) - Model_Output;
MSE_ori=sum(error.^2)/100;
format long g;

%%    PSO

PSO_sample;

para_out=swarm(gbest, 3, 1:12);   % get the best particle's para
test=reshape(para_out,[],12);
MSE_Aft=swarm(gbest, 4, 1);               % MSE of particle
Model_out_v2=Computing_Model_PSO_test(Select_Point(1:101),test); % bring the para into the model and compute the 100 point again
hold on;
plot(Select_Point(1:100),Model_out_v2,'b');
text(-9,200,'pso-Model output');
axis([-10 10 0 300]);