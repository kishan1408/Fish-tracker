close all;
clear all;
l1=ls;
for i=3:length(l1)
cd char(l1(i,:));
load('v1.mat');load('v2.mat');
for j=1:10
imwrite(strcat('v1',char(j)),v1(:,:,:,j));
end
for k=1:10
imwrite(strcat('v2',char(k)),v1(:,:,:,k));
end
clear all;
cd ..
l1=ls;
end

