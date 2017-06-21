clc;
close all;
clear all;

%% LINEAR BDF2
dt_1_norm = 0.000140659;
dt_05_norm = 6.04622e-5;
dt_0250_norm = 2.00388e-5;
dt_0125_norm = 5.57157e-6;
dt_00625_norm = 1.20416e-6;
%%% BDF2 time integration moose
% dt_1_norm = 0.000141294;
% dt_05_norm = 6.10012e-5;
% dt_0250_norm = 2.05456e-5;
% dt_0125_norm = 6.06898e-6;
% dt_00625_norm = 1.69907e-6;

norms = [dt_1_norm, dt_05_norm, dt_0250_norm, dt_0125_norm, dt_00625_norm];
k = 1:length(norms);
fit1 = polyfit(k, log2(norms), 1);

times = [0.1, 0.05, 0.0250, 0.0125, 0.00625];
figure;
loglog(times, norms)