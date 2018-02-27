% Set the video information
origfile = 'io\image\Lenna.png';
n = 1000;
alpha = 50;

markedfile = strcat('io\image\Lenna_wm', num2str(n), '_', num2str(alpha), '.png');
suspfile = markedfile;
%suspfile = strcat('io\image\Lenna_wm', num2str(n), '_', num2str(alpha), '_recompressed',  '.png');

wmfile = strcat('io\image\Lenna_wm', num2str(n), '_', num2str(alpha), '.seq');

seed=1;

fprintf('Watermarking extraction starting\n');
SpreadSpectrumExtract(suspfile, origfile, wmfile, n, seed, alpha)
fprintf('Watermarking extraction done!\n');