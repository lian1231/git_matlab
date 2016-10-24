function out=defuzzy(x,mf)

if sum(mf)==0
    out=0;
    
else
       
 out=sum(x.*mf)./sum(mf);
end
