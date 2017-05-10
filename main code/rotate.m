leaf = imread('1_1.tif');
figure, imshow(leaf, []);
rotateImg = imrotate(leaf,15,'crop'); 
figure, %imshow(rotateImg);
subplot(1,2,1)
imshow(rotateImg, [min(min(rotateImg(:))) max(max(rotateImg(:)))]);
newrotateImg = rotateImg;
newrotateImg(newrotateImg == 0) = 255; % make all 0 pixels to 255..
subplot(1,2,2)
imshow(newrotateImg, [min(min(newrotateImg(:))) max(max(newrotateImg(:)))]);