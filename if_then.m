function out = if_then(v1,v2,v3)

% 定義 x1 的fuzzy set
x1_small= gaussian_mf(v1,-6,1);   % small
x1_medium= gaussian_mf(v1,0,0.5); % medium
x1_large= gaussian_mf(v1,7,2);    % large

% 定義 x2 的fuzzy set
x2_small= gaussian_mf(v2,0,2);      % small
x2_medium= gaussian_mf(v2,5,1);     % medium
x2_large= gaussian_mf(v2,10,0.5);   % large

% 定義 y 的fuzzy set
y_small = triangle_mf(v3,0,18,90);      % small
y_medium = triangle_mf(v3,72,108,144);  % medium
y_large = triangle_mf(v3,136,180,270);  % large
y_vsmall = y_small.^2;                  % CON(C1) very small                
y_elarge = y_large.^8;                  % Extremely large



pre1=IF_Part(x1_small,x2_medium);
pre2=IF_Part(x1_medium,x2_medium);
pre3=IF_Part(x1_large,x2_small);
pre4=IF_Part(x1_small,x2_small);
pre5=IF_Part(x1_large,x2_large);
pre6=IF_Part(x1_medium,x2_small);
pre7=IF_Part(x1_medium,x2_large);
pre8=IF_Part(x1_small,x2_large);
pre9=IF_Part(x1_large,x2_medium);


R1_out=Then_Part(pre1,y_small);
R2_out=Then_Part(pre2,y_medium);
R3_out=Then_Part(pre3,y_medium);
R4_out=Then_Part(pre4,y_vsmall);
R5_out=Then_Part(pre5,y_elarge);
R6_out=Then_Part(pre6,y_small);
R7_out=Then_Part(pre7,y_large);
R8_out=Then_Part(pre8,y_medium);
R9_out=Then_Part(pre9,y_large);

point_n=length(v1);
out=zeros(point_n);
% 取聯集(Max)後做 defuzzy
for i=1:point_n
    for j=1:point_n
         con_mf_out=[R1_out(i,j,:);R2_out(i,j,:);R3_out(i,j,:);R4_out(i,j,:);R5_out(i,j,:);R6_out(i,j,:);R7_out(i,j,:);R8_out(i,j,:);R9_out(i,j,:)];
         overall=max(con_mf_out);
         overall_out_mf=overall(:)';
         out(i,j)=defuzzy(v3,overall_out_mf);
    end
end

