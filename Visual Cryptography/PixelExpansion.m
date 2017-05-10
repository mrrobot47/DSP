function [share] = PixelExpansion(s,share12)
share=zeros(s(1),s(2));
ctr=0; 
for i=1:s(1) %column-increment of 2
     j=1;
     for k=1:s(1) %row
        share(i,k)= sum(share12(i,j:j+1));
        j=j+2;
        ctr=ctr+1;
     end 
end
end