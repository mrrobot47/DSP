function [share1, share2, share12] = VisCrypt(inImg)

s = size(inImg);
share1 = zeros(s(1), (s(2)));
share2 = zeros(s(1), (s(2)));
%disp(s);
%%White Pixel Processing
%White Pixel share combinations
%disp('White Pixel Processing...');
s1a=[1 0];
s1b=[1 0];
[x y] = find(inImg == 1);
len = length(x);

for i=1:len
    a=x(i);b=y(i);
    pixShare=generateShare(s1a,s1b);
    share1((a),(2*b-1):(2*b))=pixShare(1,1:2);
    share2((a),(2*b-1):(2*b))=pixShare(2,1:2);
end

%Black Pixel Processing
%Black Pixel share combinations
%disp('Black Pixel Processing...');
s0a=[1 0];
s0b=[0 1];
[x y] = find(inImg == 0);
len = length(x);

for i=1:len
    a=x(i);b=y(i);
    pixShare=generateShare(s0a,s0b);
    share1((a),(2*b-1):(2*b))=pixShare(1,1:2);
    share2((a),(2*b-1):(2*b))=pixShare(2,1:2);
end

share12=bitor(share1, share2);
share12 = ~share12;
n=size(share12);

share12=pixelexp(s,share12);
%m=size(share12);
%m
%disp('Share Generation Completed.');