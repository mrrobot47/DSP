function [share]= pixelexp(s,share12)
share=zeros(s(1),s(2));
j=1;
for k=1:s(2)
    for i=1:s(1)
        share(i,k) = share12(i,j)+share12(i,j+1);
        
    end
    j=j+2;
end    
end