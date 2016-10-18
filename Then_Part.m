function Rn_output=Then_Part(pre,y_mf)
pre=pre';
point_n=length(pre);
point_m=length(y_mf); 
Rn_output=zeros(point_n,point_m);
%point_m ©ñ¸m¦V¶qmin(w,y_mf)

%for i= 1:point_n     
 %   for j=1:point_n   
        
        %w = pre(i,j);
        %con = min(w,y_mf);
        %Rn_output(i,j,:)=con;
        w = pre;
        con = min(w,y_mf);
        Rn_output(:)=con;
        
  %  end
%end
