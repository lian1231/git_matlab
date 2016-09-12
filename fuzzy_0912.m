% var x1 , x2 and y
x1=linspace(-10,10,101);
x2=linspace(0,10,101);
y=linspace(0,180,101);

% the membership function of input var x1 
% type of x1 : small , medium , large

x1_small= gaussian_mf(x1,-6,1);
x1_medium= gaussian_mf(x1,0,0.5);
x1_large= gaussian_mf(x1,7,2);

subplot(231);
plot(x1,x1_small,x1,x1_medium,x1,x1_large);
xlabel('x1');
ylabel('membership grade');
title('antecedent MF');
axis([min(x1) max(x1) 0 1.2]);
text(-6.5,1.1,'small');
text(-1,1.1,'medium');
text(5,1.1,'large');

% the membership function of input var x2
% type of x2 : small , medium , large
x2_small= gaussian_mf(x2,0,2);     % ¤p
x2_medium= gaussian_mf(x2,5,1);     % ¤¤
x2_large= gaussian_mf(x2,10,0.5);  % ¤j

subplot(232);
plot(x2,x2_small,x2,x2_medium,x2,x2_large);
xlabel('x2');
ylabel('membership grade');
axis([min(x2) max(x2) 0 1.2]);
title('antecedent MF ');
text(0,1.1,'small');
text(4,1.1,'medium');
text(9,1.1,'large');


% the membership function of input var y
% type of y :very small , small , medium , large ,extremely large

y_small = triangle_mf(y,0,18,90);  % small
y_medium = triangle_mf(y,72,108,144);  % medium
y_large = triangle_mf(y,136,180,270); % large

% CON(C1) very small
y_vsmall = y_small.^2;                        
% Extremely large
y_elarge = y_large.^8;                      

y_all=[y_small;y_medium;y_large;y_vsmall;y_elarge];
subplot(233);
plot(y,y_all);
text(10.8,1.05,'small');
text(105,1.05,'medium');
text(162,.9,'large');
text(12.6,.3,'very small');
text(162,.45,'extremely large');
xlabel('y');
ylabel('membership grade');
axis([min(y) max(y) 0 1.2]);
title('consequent MF ');

pre1=IF_Part(x1_small,x2_medium);
pre2=IF_Part(x1_medium,x2_medium);
pre3=IF_Part(x1_large,x2_small);
pre4=IF_Part(x1_small,x2_small);
pre5=IF_Part(x1_large,x2_large);
pre6=IF_Part(x1_medium,x2_small);
pre7=IF_Part(x1_medium,x2_large);
pre8=IF_Part(x1_small,x2_large);
pre9=IF_Part(x1_large,x2_medium);



%draw the image about R1~R9
subplot(234);
mesh(x1,x2,pre1);
xlabel('x1');
ylabel('x2');
zlabel('Membership Grade');
hold on;
mesh(x1,x2,pre2);
mesh(x1,x2,pre3);
mesh(x1,x2,pre4);
mesh(x1,x2,pre5);
mesh(x1,x2,pre6);
mesh(x1,x2,pre7);
mesh(x1,x2,pre8);
mesh(x1,x2,pre9);
hold off;
axis([min(x1) max(x1) min(x2) max(x2) 0 1.2 ]);
view(-60,20);
title('input space');
text(-7,5,1,'R1');
text(0,5,1,'R2');
text(6,0,1,'R3');
text(-7,0,1,'R4');
text(6,5,1,'R9');
text(0,0,1,'R6');
text(0,10,1,'R7');
text(-7,10,1,'R8');
text(6,10,1,'R5');
% 
point_n=length(x1);
out=zeros(point_n);

R1_out=Then_Part(pre1,y_small);
R2_out=Then_Part(pre2,y_medium);
R3_out=Then_Part(pre3,y_medium);
R4_out=Then_Part(pre4,y_vsmall);
R5_out=Then_Part(pre5,y_elarge);
R6_out=Then_Part(pre6,y_small);
R7_out=Then_Part(pre7,y_large);
R8_out=Then_Part(pre8,y_medium);
R9_out=Then_Part(pre9,y_large);


for i=1:point_n
    for j=1:point_n
         con_mf_out=[R1_out(i,j,:);R2_out(i,j,:);R3_out(i,j,:);R4_out(i,j,:);R5_out(i,j,:);R6_out(i,j,:);R7_out(i,j,:);R8_out(i,j,:);R9_out(i,j,:)];
         overall=max(con_mf_out);
         overall_out_mf=overall(:)';
         out(i,j)=defuzzy(y,overall_out_mf);
    end
end

figure;
mesh(x1,x2,out');
xlabel('x1');
ylabel('x2');
zlabel('y');
axis([min(x1) max(x1) min(x2) max(x2) min(y) max(y)]);
%view(30,30);
title('output-input surface');
