clc; clear; close all;
warning on verbose

origfile = 'io\video\BlowingBubbles_416x240_50.yuv';
width = 416;
height = 240;
amount_of_frames = 500;
%amount_of_frames = 1;
%n = 1000;
n = 100;
alpha = 50;
basic_filename = strcat('io\video\BlowingBubbles_416x240_50_w', num2str(n), '_', num2str(alpha));
seed = 1;

check_file = basic_filename;
%qp = 20;
%qp = 30;
%qp = 40;
%check_file = strcat(basic_filename, '_qp', num2str(qp));

suspfile = strcat(check_file, '.yuv');
output_file = strcat(check_file, '.csv');

fprintf('Extraction starting: %s \n', suspfile);
SpreadSpectrumExtractVideo(suspfile, origfile, output_file, width, height, amount_of_frames, n, seed, alpha)
fprintf('Extraction done!\n');
