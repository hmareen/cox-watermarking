function yuvExport(Y, U, V, filename, amount_of_frames, mode)
%Exports YUV sequence
%yuv_export(Y,U,V,filename,numfrm)
% Found on https://nl.mathworks.com/matlabcentral/fileexchange/36417-yuv-files-reading-and-converting?focused=5229509&tab=function
%
%Input:
% Y, U ,V - cell arrays of Y,U & V components 
% filename - name of the file in which YUV sequence is to be saved
% numfrm - number of frames to write
% mode - [optional, default = 'a'] file write mode, append 'a' or write 'w'
%
%Output:
% Y, U ,V - cell arrays of Y, U and V components  
%
%Note: 
% If the file already exists, the function appends frames
%
%Example:
% [Y, U, V] = yuv_import('F:\Seq\FullSeqs\basket_704x576x4.yuv',[704 576],2);
% yuv_export(Y,U,V,'seq_test.yuv',2);

if nargin<6  
    mode = 'a'; %append!
end;
fid=fopen(filename,mode);
if (fid < 0) 
    error('Could not open the file!');
end;
for i=1:amount_of_frames
    Yd = Y{i}';
    fwrite(fid,Yd,'uint8');    
    UVd = U{i}';  
    fwrite(fid,UVd,'uint8');
    UVd = V{i}'; 
    fwrite(fid,UVd,'uint8');   
end;
fclose(fid);