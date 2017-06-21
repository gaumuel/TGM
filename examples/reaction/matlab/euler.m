clc;
clear all;
close all;
%%%%%% implicit eueler %%%%
dt_1_norm = 0.00177427;
dt_05_norm = 0.000872334;
dt_0250_norm = 0.000432893;
dt_0125_norm = 0.00021571;
dt_00625_norm = 0.000107701;

% implicit eueler respect to implicit
% dt_1_norm = 0.00172046;
% dt_05_norm = 0.000818506;
% dt_0250_norm = 0.000379059;
% dt_0125_norm = 0.000161875;
% dt_00625_norm = 5.38658e-5;
norms = [dt_1_norm, dt_05_norm, dt_0250_norm, dt_0125_norm, dt_00625_norm];
k = 1:length(norms);
fit1 = polyfit(k, log2(norms), 1);

times = [0.1, 0.05, 0.0250, 0.0125, 0.00625];
figure;
hold on
loglog(times, norms, '-d', 'MarkerFaceColor', 'red');
xlabel('\Deltat');
ylabel('L^2 norm');
title('CN-AB of order 2');