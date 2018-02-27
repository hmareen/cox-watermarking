@echo off

:: SETLOCAL EnableDelayedExpansion
SETLOCAL
set test_sequence=BlowingBubbles_416x240_50
set width=416
set height=240
set amount_of_frames=500

set n=100
::set alpha=50
set alpha=10
set output_file=%test_sequence%_w%n%_%alpha%

set seed=1

echo Watermarking %test_sequence%

matlab -nodisplay -wait -nosplash -nodesktop -r "SpreadSpectrumEmbedVideo('io\video\%test_sequence%.yuv', 'io\video\%output_file%.yuv', 'io\video\%output_file%.seq', %width%, %height%, %amount_of_frames%, %n%, %seed%, %alpha%); exit"

echo Done

GOTO:EOF

:NO_ARGUMENT
    echo Error: Please provide the following arguments:
    echo    Arg 1: test sequence directory
    echo    Arg 2: blocks
    echo    Arg 3: seed
    