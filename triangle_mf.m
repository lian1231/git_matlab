function y=triangle_mf(x,a,b,c)

y1=zeros(1,length(x));
for i=1:length(x)

   if x(i)<=a
        y1(1,i)=0;
        
    elseif a<=x(i) && x(i)<=b
        y1(1,i)=(x(i)-a)/(b-a);
    elseif b<=x(i) && x(i)<=c
        y1(1,i)=(c-x(i))/(c-b);
        
    elseif x(i)>=c
        y1(1,i)=0;
    end
    
end

y=y1;

%y = max(min((x-a)/(b-a), (c-x)/(c-b)), 0);
