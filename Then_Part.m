function Rn_output=Then_Part(pre,y_mf)
pre=pre';
point_n=length(pre);
point_m=length(y_mf); 
Rn_output=zeros(point_n,point_m);
%point_m ��m�V�qmin(w,y_mf)

        w = pre;
        con = min(w,y_mf);
        Rn_output(:)=con;
        

