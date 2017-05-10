inImg_1 = imread('1.tif');
inImg = im2bw(inImg_1, 0.3);
figure;


%-----------------
%a=[1 0 1];
%b=[0 1 0];
%c=[1 1 1];

%inImg=[a
%b
%c]
%-----------------
imshow(inImg);title('Secret Image');
%Visual Cryptography
[share1, share2, share12] = VisCrypt(inImg);

%Outputs
figure;imshow(share1);title('Share 1');
figure;imshow(share2);title('Share 2');

figure;imshow(share12);title('Overlapping Share 1 & 2');

imwrite(share1,'Share1.png');
imwrite(share2,'Share2.png');
imwrite(share12,'Overlapped.png');
toc;