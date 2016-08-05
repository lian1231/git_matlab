point_n = 100;
x1 = linspace(-5, 5, point_n);
x2 = linspace(-5, 5, point_n);
y  = linspace(-5, 5, point_n);

% input space x1 -> A1 , A2 , A3
A1= bell_mf(x1,5 ,8 ,-5); % small
A2= bell_mf(x1,5 ,8, 5);  % large

subplot(231);
plot(x1,A1');
hold on;
plot(x1,A2);
hold off;
xlabel('x1');
ylabel('membership grade');
axis([min(x1) max(x1) 0 1.2]);
title('antecedent MF ');
text(-3, 1.1, 'small');
text(+3, 1.1, 'large');

% input space x2 -> B1 , B2 , B3
B1= bell_mf(x2,5 ,2 ,-5); % small
B2= bell_mf(x2,5 ,2 ,5); % large 


subplot(232);
plot(x2,B1);
hold on;
plot(x2,B2);
hold off;
xlabel('x2');
ylabel('membership grade');
axis([min(x2) max(x2) 0 1.2]);
title('antecedent MF ');
text(-3, 1.1, 'small');
text(+3, 1.1, 'large');

% output space y -> y1 , y2 , y3
C1 = bell_mf(y,1.67, 8, -5);
C2 = bell_mf(y,1.67, 8, -1.67);
C3 = bell_mf(y,1.67, 8, 1.67);
C4 = bell_mf(y,1.67, 8, 5);



subplot(233);
plot(y,C1);
hold on;
plot(y,C2);
plot(y,C3);
plot(y,C4);
hold off;
xlabel('y');
ylabel('membership grade');
axis([min(y) max(y) 0 1.2]);
title('consequent MF ');
text(-4, 1.1, 'large negative');
text(-1.5, 1.1, 'small negative');
text(+1.5, 1.1, 'small positive');
text(+4, 1.1, 'large positive');


% conclusion ( then part )
point_n = 15;
x1 = linspace(-5, 5, point_n);
x2 = linspace(-5, 5, point_n);
out=zeros(point_n);
for i=1:point_n
  for j=1:point_n
  x1_mf1 =   bell_mf( x1(i),5 ,8, -5 );
  x1_mf2 =   bell_mf( x1(i),5 ,8,  5 );
  x2_mf1 =   bell_mf( x2(j), 5, 2 ,-5 );
  x2_mf2 =   bell_mf( x2(j), 5, 2 , 5 );

 w1 =min(x1_mf1 , x2_mf1);
 w2 =min(x1_mf1 , x2_mf2);
 w3 =min(x1_mf2 , x2_mf1);
 w4 =min(x1_mf2 , x2_mf2);
  
  con_mf1= min( w1 , bell_mf(y,1.67, 8, -5) );
  con_mf2= min( w2 , bell_mf(y,1.67, 8, -1.67) );
  con_mf3= min( w3 , bell_mf(y,1.67, 8, 1.67) );
  con_mf4= min( w4 , bell_mf(y,1.67, 8, 5) );
  con_mf_out=[con_mf1;con_mf2;con_mf3;con_mf4];
  overall_out_mf=max(con_mf_out);
  out(i,j)=defuzzy(y,overall_out_mf);
  end
end

subplot(235);
mesh(x1,x2,out');
xlabel('x1');
ylabel('x2');
zlabel('y');
axis([min(x1) max(x1) min(x2) max(x2) min(y) max(y)]);
%view(30,30);
set(gca, 'box', 'on');
title('output-input surface');



