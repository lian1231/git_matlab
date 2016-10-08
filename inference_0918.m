function out = inference_0918(v1,v2,v3,y)

pre1=IF_Part(v1(1,:),v2(2,:)); % IF_Part(x1_mf,x2_mf)
pre2=IF_Part(v1(2,:),v2(2,:));
pre3=IF_Part(v1(3,:),v2(1,:));
pre4=IF_Part(v1(1,:),v2(1,:));
pre5=IF_Part(v1(3,:),v2(3,:));
pre6=IF_Part(v1(2,:),v2(1,:));
pre7=IF_Part(v1(2,:),v2(3,:));
pre8=IF_Part(v1(1,:),v2(3,:));
pre9=IF_Part(v1(3,:),v2(2,:));


R1_out=Then_Part(pre1,v3(1,:));
R2_out=Then_Part(pre2,v3(2,:));
R3_out=Then_Part(pre3,v3(2,:));
R4_out=Then_Part(pre4,v3(4,:));
R5_out=Then_Part(pre5,v3(5,:));
R6_out=Then_Part(pre6,v3(1,:));
R7_out=Then_Part(pre7,v3(3,:));
R8_out=Then_Part(pre8,v3(2,:));
R9_out=Then_Part(pre9,v3(3,:));

point_n=length(y);
out=zeros(point_n);
% 取聯集(Max)後做 defuzzy
for i=1:point_n
    for j=1:point_n
         con_mf_out=[R1_out(i,j,:);R2_out(i,j,:);R3_out(i,j,:);R4_out(i,j,:);R5_out(i,j,:);R6_out(i,j,:);R7_out(i,j,:);R8_out(i,j,:);R9_out(i,j,:)];
         overall=max(con_mf_out);
         overall_out_mf=overall(:)';
         out(i,j)=defuzzy(y,overall_out_mf);
    end
end

