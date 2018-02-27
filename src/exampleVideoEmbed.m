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
markedfile = strcat('io\video\BlowingBubbles_416x240_50_w', num2str(n), '_', num2str(alpha), '.yuv');
wmfile = strcat('io\video\BlowingBubbles_416x240_50_w', num2str(n), '_', num2str(alpha), '.seq');
seed = 1;

fprintf('Watermarking starting\n');
SpreadSpectrumEmbedVideo(origfile, markedfile, wmfile, width, height, amount_of_frames, n, seed, alpha)
fprintf('Watermarking done!\n');