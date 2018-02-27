function SpreadSpectrumExtractVideo(suspfile, origfile, output_file, width, height, amount_of_frames, watermark_size, seed, alpha)
% Extract watermark from an image according to spread spectrum watermarking algorithm

% Parameters:
% (1) suspfile      : filename of suspect image
% (2) origfile      : filename of original file
% (3) n             : # of bits representing the watermark
% (4) alpha         : scaling factor

% Read suspected watermarked video
[y_w,~,~] = yuvRead(suspfile, width, height, amount_of_frames);

% Read original video - informed watermarking
[y,~,~] = yuvRead(origfile, width, height, amount_of_frames);

% Set output file for watermarked sequence
wmfile_output = strcat(suspfile, '.extracted');

% For each frame: extract and compare
output_file_id = fopen(output_file, 'w');
fprintf(output_file_id, 'frame,value\n');
similarities = zeros(1, amount_of_frames);
for iFrame = 1 : amount_of_frames
    % Transform suspsected watermarked video
    dct_image_w = dct2(y_w(:,:,iFrame));
    dct_vector_w = reshape(dct_image_w, 1, width*height);
    [~, index_w] = sort(dct_vector_w, 'descend');
    
    % Transform original video
    dct_image = dct2(y(:,:,iFrame));
    dct_vector = reshape(dct_image, 1, width*height);
    [~, index] = sort(dct_vector, 'descend');
    
    % Extract watermark sequence from coefficients - w
    w = zeros(1, watermark_size);
    for i = 1 : watermark_size
        w(i) = (dct_vector_w(index_w(1,i)) - dct_vector(index(1,i))) / alpha;
        w(i) = sign(w(i));
        if w(i) == -1
           w(i) = 0; 
        end
    end
    
    % Write extracted sequence into a file
    %if iFrame == 1; dlmwrite(wmfile_output, w); else; dlmwrite(wmfile_output, w,  '-append'); end;
    
    % Read watermark sequence
    origwm = GenerateGaussianSequence(watermark_size, seed);
    
    % Calculate and print frame similarity
    similarities(iFrame) = ComputeSimilaritySingle(origwm, w);
    fprintf(output_file_id, '%d,%f\n', iFrame, similarities(iFrame));
end

% Calculate and print mean similarity
mean_similarity = mean(similarities);
fprintf(output_file_id, 'average,%f\n', mean_similarity);

fclose(output_file_id);

end