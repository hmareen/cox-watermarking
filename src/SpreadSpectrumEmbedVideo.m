function SpreadSpectrumEmbedVideo(origfile, markedfile, wmfile, width, height, amount_of_frames, watermark_size, seed, alpha)
% Embed watermark into an image according to spread spectrum watermarking algorithm

% Parameters:
% (1) origfile          : filename of cover video YUV - e.g. 'fruits.yuv'
% (2) markedfile        : filename of output YUV - e.g. 'fruits_w.yuv'
% (3) wmfile            : random sequence output file - e.g. fruis_w.seq
% (4) width
% (5) height
% (6) amount_of_frames
% (7) watermark_size    : # of bits representing the watermark - e.g. 1000
% (8) seed              : seed for random watermark sequence
% (9) alpha             : the strength of the watermark - e.g. 5


% Read original video
[y,u,v] = yuvRead(origfile, width, height, amount_of_frames);

% Generate watermarked sequence
watermark_seq = GenerateGaussianSequence(watermark_size, seed);

% For each frame: add watermark in DCT coefficients
for iFrame = 1 : amount_of_frames
    % DCT
    dct_image = dct2(y(:,:,iFrame));  
    % Reshape the matrix to a vector
    dct_vector = reshape(dct_image, 1, width * height);
    
    %'index' is the index of each value of 'sorted_dct_vector' in the original 'dct_vector'
    [sorted_dct_vector, index] = sort(dct_vector, 'descend');
    % Embed watermark sequence to original dct_vector
    for i = 1 : watermark_size
        dct_vector(index(1,i)) = dct_vector(index(1,i)) + (watermark_seq(i) * alpha);
    end

    % Reshape back to matrix
    watermarked_dct_image = reshape(dct_vector, height, width);
    % Inverse DCT
    y_new = idct2(watermarked_dct_image);

    % Check whether modified DCT results to same image with original one
    result = isequal(y_new, y(:,:,iFrame));
    if result == 1
        fprintf('Result image is the same with original one.\nChange either alpha value or watermark size??\nExiting...\n\n');
        %return;
    end
    
    % Write result to output file
    if iFrame == 1, mode = 'w'; else, mode = 'a'; end; % append or write
    yuvExportFrame(y_new, u(:,:,iFrame), v(:,:,iFrame), markedfile, mode);
    
end

% Save watermark sequence in a file
dlmwrite(wmfile, watermark_seq, '');

end