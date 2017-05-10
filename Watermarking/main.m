seq = '1100010110010110011011001011100111100111100101100110110110111000110110110010011010111011011000111010011011011001011110001101101100001110011100011100011110011101001100011110010111010011000101101011101101100010110111110001011000111101001100010110001110110';
seq_mat = str2double(regexp(num2str(seq),'\d','match'));
SpreadSpectrumEmbed('2.bmp', '2_watermark.bmp', '2.dat', length(seq_mat), 5);
SpreadSpectrumExtract('2_watermark.bmp', '4.bmp', '2.dat', length(seq_mat), 5);