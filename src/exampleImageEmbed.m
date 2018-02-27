% Set the video information
origfile = 'io\image\Lenna.png';
markedfile = strcat('io\image\Lenna_wm', num2str(n), '_', num2str(alpha), '.png');
wmfile = strcat('io\image\Lenna_wm', num2str(n), '_', num2str(alpha), '.seq');
n = 1000;
alpha = 50;
seed=1;

fprintf('Watermarking starting\n');
SpreadSpectrumEmbed(origfile, markedfile, wmfile, n, seed, alpha)
fprintf('Watermarking done!\n');