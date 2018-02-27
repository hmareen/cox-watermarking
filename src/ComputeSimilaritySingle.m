function similarity = ComputeSimilaritySingle(origwm, extwm)
% Compute the similarities of the original watermark with the extracted
% watermark

% Parameters:
% (1) origwm    : original watermark sequence
% (2) extwm     : extracted watermark sequence

similarity = origwm * extwm' / sqrt(extwm * extwm');
%similarity = origwm * extwm' / sqrt(origwm * origwm');

end

