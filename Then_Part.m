function Rn_output=Then_Part(pre,y_mf)
pre=pre';
point_n=length(y_mf);
Rn_output=zeros(point_n,point_n,point_n);
for i= 1:point_n     
    for j=1:point_n   
        
        w = pre(i,j);
        con = min(w,y_mf);
        Rn_output(i,j,:)=con;
    end
end
