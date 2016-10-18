

x1=linspace(-10,10,101);
x2=linspace(0,10,101);
xx=[x1,x2];
s=randperm(200,101);
xxx=sort(input(s));

target_f = 2-10*xxx+5*xxx.^2;
plot(xxx,target_f,'--gs');


for i=1:100
   y(i)=Computing_Model_1012([xxx(i),xxx(i+1)]);
end
hold on;
plot(xxx(1:100),y,':');
%---------------------------1015
x1=linspace(-10,10,101);
x2=linspace(0,10,101);
model_y=zeros(100,1);
target_y=zeros(101,1);

for i=1:101
   model_y(i)=Computing_Model_1012([x1(i),x2(i)]);
   target_y(i)=2-10*x1(i)+5*x1(i).^2;
end

plot(x1(2:101),model_y(2:101),x1(2:101),target_y(2:101));




