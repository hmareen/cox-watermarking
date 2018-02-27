function yuvExportFrame(Y, U, V, filename, mode)
%Exports YUV sequence
%yuv_export(Y,U,V,filename,numfrm)
% Found on https://nl.mathworks.com/matlabcentral/fileexchange/36417-yuv-files-reading-and-converting?focused=5229509&tab=function
%
%Input:
% Y, U ,V - cell arrays of Y,U & V components 
% filename - name of the file in which YUV sequence is to be saved
% mode - [optional, default = 'a'] file write mode, append 'a' or write 'w'
%
%Output:
% Y, U ,V - cell arrays of Y, U and V components  
%
%Example:
% [Y, U, V] = yuv_import('F:\Seq\FullSeqs\basket_704x576x4.yuv',[704 576],2);
% yuv_export(Y,U,V,'seq_test.yuv',2);

fid=fopen(filename,mode);
if (fid < 0) 
    error('Could not open the file!');
end;

fwrite(fid,Y','uint8');    
fwrite(fid,U','uint8');
fwrite(fid,V','uint8');   
fclose(fid);