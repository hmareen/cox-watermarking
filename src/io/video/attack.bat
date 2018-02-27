@echo off

IF [%1]==[] GOTO NO_ARGUMENT

SETLOCAL

SET test_sequence=BlowingBubbles_416x240_50
SET n=100
SET alpha=50
SET width=416
SET height=240
SET qp=%1

SET input_file=%test_sequence%_w%n%_%alpha%.yuv
SET output_file_265=%test_sequence%_w%n%_%alpha%_qp%qp%.265
SET output_file_yuv=%test_sequence%_w%n%_%alpha%_qp%qp%.yuv

:: Encode
echo Encoding
ffmpeg -y -f rawvideo -pix_fmt yuv420p -s:v %width%x%height% ^
	-i %input_file% -c:v hevc -crf %qp% %output_file_265%
	
:: Decode
echo Decoding
ffmpeg -y -i %output_file_265% %output_file_yuv%

GOTO:EOF

:NO_ARGUMENT
    echo Error: Please provide the following arguments:
    echo    Arg 1: QP
