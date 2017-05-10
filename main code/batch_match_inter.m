%script file for batched match
percent_match = [];
fname=[];

for i=101:110
   for j=1:3
      tname = sprintf('D:\\DSP\\Fingerprint-recognition-system nigamaript\\db\\db\\%d_%d.tif.dat',i,j);
      fname = [fname;tname];
   end;
end;

for i=1:3:12
   for j=i+3:3:12
             
      t=cputime;
      fname1 = fname(i,:);
      fname2 = fname(j,:);
      template1=load(char(fname1));
      template2=load(char(fname2));
      num = match_end(template1,template2,10,0);
      deltaT=cputime-t
      i
      j
      tmp = [i,j,deltaT,num];
      percent_match = [percent_match;tmp];
   end;
end;

fname = sprintf('D:\\DSP\\Fingerprint-recognition-system nigamaript\\db\\db\\interclassTest.dat');

save(fname,'percent_match','-ASCII');

%percent_match

