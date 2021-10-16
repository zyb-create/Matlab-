clc,clear;
% load xy.txt;
% y=pdist(xy);
% Z=linkage(y);
% % T = cluster(Z,'maxclust',5);
% cutoff = median([Z(end-5,3) Z(end-2,3)]);
% dendrogram(Z,'ColorThreshold',cutoff);
% % h=dendrogram(z);

url = 'https://www.mathworks.com';
sitename = 'The MathWorks Web Site';

fprintf('<a href = "%s">%s</a>\n',url,sitename);