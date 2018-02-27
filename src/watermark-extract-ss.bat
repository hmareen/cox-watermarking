@echo off

:: SETLOCAL EnableDelayedExpansion
SETLOCAL
set test_sequence=BlowingBubbles_416x240_50
set width=416
set height=240
set amount_of_frames=500

set n=100
set alpha=50
::set alpha=1

set orig_file=io/video/%test_sequence%.yuv
set basic_filename=io/video/%test_sequence%_w%n%_%alpha%

:: No attack
set check_file=%basic_filename%

:: Attack
set qp=20
::set qp=30
::set qp=40
::set check_file=%basic_filename%_qp%qp%

set susp_file=%check_file%.yuv
set output_file=%check_file%.csv

set seed=1

echo Extracting %susp_file%

matlab -nodisplay -wait -nosplash -nodesktop -r "SpreadSpectrumExtractVideo('%susp_file%', '%orig_file%', '%output_file%', %width%, %height%, %amount_of_frames%, %n%, %seed%, %alpha%); exit"

echo Done
