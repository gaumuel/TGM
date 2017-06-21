clc;
close all;
clear all;
%/Users/Aaron/projects/TGM/examples/reaction/adam_bash/crank-nicolson_dts
%file1 = '../adam_bash/crank-nicolson_dts/cn_dt_1_out.csv';
%csvread(file1)

dt_1_norm = 0.000369454;
dt_05_norm = 3.45565e-5;
dt_0250_norm = 4.71612e-6;
dt_0125_norm = 3.49546e-6;
dt_00625_norm = 1.18826e-6;

norms = [dt_1_norm, dt_05_norm, dt_0250_norm, dt_0125_norm, dt_00625_norm];
k = 1:length(norms);
fit1 = polyfit(k, log2(norms), 1);

times = [0.1, 0.05, 0.0250, 0.0125, 0.00625];
figure;
hold on
loglog(times, norms, '-d', 'MarkerFaceColor', 'red');
xlabel('\Deltat');
ylabel('L^2 norm');
title('Semi-BDF of order 2');