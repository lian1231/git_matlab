% define var x1 , x2 , y
x1=linspace(-10,10,101);
x2=linspace(0,10,101);
y=linspace(0,180,101);

subplot(1,2,1);
mesh(x1,x2,out'); %繪製圖時,注意方向(out')
xlabel('x1');
ylabel('x2');
zlabel('y');
axis([min(x1) max(x1) min(x2) max(x2) min(y) max(y)]);
title('before');
subplot(1,2,2);
mesh(x1,x2,out'); %繪製圖時,注意方向(out')
xlabel('x1');
ylabel('x2');
zlabel('y');
title('after');
axis([min(x1) max(x1) min(x2) max(x2) min(y) max(y)]);