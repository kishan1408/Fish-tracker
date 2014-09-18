%% Setup folder for saving sessions
close all;
clear all;
prompt = {'Enter the Folder Name :'};
dlg_title = 'Zebra Fish Expt';
num_lines = 1;
folder = sprintf('session_%s_%d',date,round(sum(clock)));
def = {folder};
answer = inputdlg(prompt,dlg_title,num_lines,def);
mkdir(answer{1});cd(answer{1}); 

%% Expt setup
prompt = {'Enter Number of frames:','Time difference between frames (in sec) :','Record background (y/n) :'};
dlg_title = 'Expt setup';
num_lines = 1;
def = {'20','3','y'};
response = inputdlg(prompt,dlg_title,num_lines,def);

%% Camera1 Setup
vid1 = videoinput('winvideo', 1);
set(vid1, 'ReturnedColorSpace', 'RGB');
preview(vid1);
helpdlg('press any key after setting the camera','camera 1 setup');
pause();

%% Camera2 Setup
vid2 = videoinput('winvideo', 2);
set(vid2, 'ReturnedColorSpace', 'RGB');
preview(vid2);
helpdlg('press any key after setting the camera','camera 2 setup');
pause();

%% Background Setup

if response{3}=='y'
for i=1:5    
back{1,i}=getsnapshot(vid1);
back{2,i}=getsnapshot(vid2);
imshow(back{1,i});pause(1);imshow(back{2,i});pause(1)
end
end
%% EXPT
helpdlg('press any key to start the experiment','Experiment');
pause();

h = waitbar(0, 'wait karo ...');
steps = str2num(response{1});
for j=1:str2num(response{1})
data{1,j}=getsnapshot(vid1);
data{2,j}=getsnapshot(vid2);
imshow(data{1,j});imshow(data{2,j});
pause(str2num(response{2}));
waitbar(j / steps);
end
close(h);

%% Image extraction
for jj=1:str2num(response{1})
imwrite(data{1,jj},strcat('cam1_',num2str(jj),'.png'));
end

for kk=1:str2num(response{1})
imwrite(data{2,kk},strcat('cam2_',num2str(kk),'.png'));
end

for ll=1:5
imwrite(back{1,ll},strcat('bgcam1_',num2str(ll),'.png'));
end

for mm=1:5
imwrite(back{2,mm},strcat('bgcam2_',num2str(mm),'.png'));
end
save data;
save back;
cd ..;
%%
% History:
% 20.2.2014  Written by kishan (kishan1408@gmail.com).
% Modifications:
% 21.2.2014 kishan #image extraction # response{1}/{2}
