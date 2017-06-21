clc;
close all;
clear all;
%/Users/Aaron/projects/TGM/examples/reaction/adam_bash/crank-nicolson_dts
file1 = '../adam_bash/crank-nicolson_dts/cn_dt_1_out.csv';
%csvread(file1)

%%%% CN %%%%%
% dt_1_norm = 6.82957e-5;
% dt_05_norm = 1.75551e-5;
% dt_0250_norm = 4.37019e-6;
% dt_0125_norm = 1.04249e-6;
% dt_00625_norm = 2.08597e-7;
% 
% norms = [dt_1_norm, dt_05_norm, dt_0250_norm, dt_0125_norm, dt_00625_norm];
% k = 1:length(norms);
% fit = polyfit(k, log2(norms), 1);
% 
% times = [0.1, 0.05, 0.0250, 0.0125, 0.00625];
% figure;
% loglog(times, norms)

%%%%%% CN AB %%%%
dt_1_norm = 4.5551e-5;
dt_05_norm = 1.24149e-5;
dt_0250_norm = 3.16636e-6;
dt_0125_norm = 7.54616e-7;
dt_00625_norm = 1.4146e-7;

norms = [dt_1_norm, dt_05_norm, dt_0250_norm, dt_0125_norm, dt_00625_norm];
k = 1:length(norms);
fit1 = polyfit(k, log2(norms), 1);

times = [0.1, 0.05, 0.0250, 0.0125, 0.00625];
figure;
loglog(times, norms)