%% Setup folder for saving sessions
close all;
clear all;
folder = sprintf('session_%s_%d',date,round(sum(clock)));% eg. session_21-dec-2013_2301
mkdir(folder);cd(folder); 
%% simulink block
sim ../videorecord;
save('v1','v1');
save('v2','v2');
cd ..;
clear all;
close all;

