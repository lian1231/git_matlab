function out=defuzzy(x,mf)


out=sum(x.*mf)./sum(mf);
