t = cputime;
files = CreateImgDatabase();
for i=1:length(files)
    disp(i);
   str = char(files(i));
   fname = sprintf('D:\\DSP\\Fingerprint-recognition-system nigamaript\\db\\db\\%s',str);
   fname_rot = sprintf('D:\\DSP\\Fingerprint-recognition-system nigamaript\\db\\db\\%s.rot',str);
      
   o1 = imread(fname);
   o1 = imrotate(o1,randi([0,4],1,1),'bilinear');
   o1 =255 - double(o1);
   o1=histeq(uint8(o1));
   o1=fftenhance(o1,0.45);
   
   o1=adaptiveThres(double(o1),32,0);
   [o1Bound,o1Area]=direction(o1,16,0);
   [o1,o1Bound,o1Area]=drawROI(o1,o1Bound,o1Area,0);
   
   o1=im2double(bwmorph(o1,'thin',Inf));
   o1=im2double(bwmorph(o1,'clean'));
   o1=im2double(bwmorph(o1,'hbreak'));
   o1=im2double(bwmorph(o1,'spur'));
   
   [end_list1,branch_list1,ridgeMap1,edgeWidth]=mark_minutia(o1,o1Bound,o1Area,16);
   [pathMap1,real_end1,real_branch1]=remove_spurious_Minutia(o1,end_list1,branch_list1,o1Area,ridgeMap1,edgeWidth);
   fname2=sprintf('%s.dat',fname_rot);
   save(fname2,'real_end1','pathMap1','-ASCII');
end;
t2=cputime;
t2-t
   
