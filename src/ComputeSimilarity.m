function [origwm_similarity, similarities] = ComputeSimilarity(origwm, extwm, n, seed)
% Compute the similarities of the original watermark along with other
% randomly generated 100 sequences.

% Parameters:
% (1) origwm    : original watermark sequence
% (2) extwm     : extracted watermark sequence
% (3) n         : # of bits in watermark
% (4) seed

amount_of_random_watermarks = 200;
extracted_watermark_index = amount_of_random_watermarks / 2;

% Create 99 random watermarks + 1 extracted watermark
watermarks = zeros(amount_of_random_watermarks, n);
for i = 1 : amount_of_random_watermarks - 1
    new_seed = seed + i;
    watermarks(i,:) = GenerateGaussianSequence(n, new_seed); 
end
% Place the similarity for extracted watermark in 100th index
watermarks(extracted_watermark_index,:) = extwm;

% Compute similarities with all 100 watermarks
similarities = zeros(amount_of_random_watermarks);
for i = 1 : amount_of_random_watermarks
    %similarity = origwm * watermarks(i,:)';
    %display(similarity);
    similarities(i) = origwm * watermarks(i,:)' / sqrt(watermarks(i,:) * watermarks(i,:)');
    %similarities(i) = origwm * watermarks(i,:)' / sqrt(origwm * origwm'); 
end

% The original similarity is on index 100
origwm_similarity = similarities(extracted_watermark_index);

end

