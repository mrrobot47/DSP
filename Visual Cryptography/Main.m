files = CreateImgDatabase();
for i=1:length(files)
   disp(i);
   str = char(files(i));
   fname = sprintf('C:\\Users\\kr2m\\Google Drive\\DSP Prj\\db\\db\\%s',str);
   fname_bin = sprintf('C:\\Users\\kr2m\\Google Drive\\DSP Prj\\vc\\img\\%s.bin.tif',str);
   fname_s1 = sprintf('C:\\Users\\kr2m\\Google Drive\\DSP Prj\\vc\\img\\%s.s1.png',str);
   fname_s2 = sprintf('C:\\Users\\kr2m\\Google Drive\\DSP Prj\\vc\\img\\%s.s2.png',str);
   fname_comb = sprintf('C:\\Users\\kr2m\\Google Drive\\DSP Prj\\vc\\img\\%s.comb.png',str);

    inImg_1 = imread(fname);
    inImg = im2bw(inImg_1, 0.3);

    %Visual Cryptography
    [share1, share2, share12] = VisCrypt(inImg);

    imwrite(inImg,fname_bin);
    imwrite(share1,fname_s1);
    imwrite(share2,fname_s2);
    imwrite(share12,fname_comb);

end