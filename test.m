x1=linspace(-10,10,101);
x2=linspace(0,10,101);
y=linspace(0,180,101);

Rule_out=if_then(x1,x2,y);

figure;
mesh(x1,x2,Rule_out');
xlabel('x1');
ylabel('x2');
zlabel('y');
axis([min(x1) max(x1) min(x2) max(x2) min(y) max(y)]);
%view(30,30);
title('output-input surface');
