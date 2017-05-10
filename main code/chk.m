%script file for batched enrolling fingerprints
t = cputime;
for i=1:164
   for j=1:10
% for i=101:110
%    for j=1:3
      i 
   fname = sprintf('D:\\DSP\\Fingerprint-recognition-system nigamaript\\db\\db\\%d_%d.tif',i,j);
   o1 = imread(fname);
   end;
end;
