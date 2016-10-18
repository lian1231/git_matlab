function y=singleton(x,a)
y=zeros(1,length(x));
for i=1:length(x)
   if x(i)==a
       y(i)=1;
   else 
       y(i)=0;
   end
end


   % plot([a a],[0,1]);
    