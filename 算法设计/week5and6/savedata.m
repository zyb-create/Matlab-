fileID = fopen('location.txt','w');
nbytes = fprintf(fileID,'%d %d\n',location');
fclose(fileID);
clc,clear;
fprintf('保存完成\n');