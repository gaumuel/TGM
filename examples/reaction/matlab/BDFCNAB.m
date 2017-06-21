clc;
close all;
clear all;

%bloth imex cnab and semibdf
times = [0.1, 0.05, 0.0250, 0.0125, 0.00625];
fig = figure;
loglog(times, times.^2, 'k');
xlabel('\Deltat');
ylabel('L^2 error');
set(gca,'fontsize',16);
title('Model A, Reaction-Diffusion L^2 Errors Comparison');

%semi bdf
dt_1_norm = 0.000369454;
dt_05_norm = 3.45565e-5;
dt_0250_norm = 4.71612e-6;
dt_0125_norm = 3.49546e-6;
dt_00625_norm = 1.18826e-6;

norms = [dt_1_norm, dt_05_norm, dt_0250_norm, dt_0125_norm, dt_00625_norm];
k = 1:length(norms);
fit1 = polyfit(k, log2(norms), 1);
hold on;
times = [0.1, 0.05, 0.0250, 0.0125, 0.00625];
loglog(times, norms, '-*r','LineWidth', 1, 'MarkerFaceColor', 'r', 'MarkerSize', 12);

% cnab
dt_1_norm = 4.5551e-5;
dt_05_norm = 1.24149e-5;
dt_0250_norm = 3.16636e-6;
dt_0125_norm = 7.54616e-7;
dt_00625_norm = 1.4146e-7;

norms = [dt_1_norm, dt_05_norm, dt_0250_norm, dt_0125_norm, dt_00625_norm];
k = 1:length(norms);
fit2 = polyfit(k, log2(norms), 1);

times = [0.1, 0.05, 0.0250, 0.0125, 0.00625];
hold on
loglog(times, norms, '-*b', 'LineWidth', 1, 'MarkerFaceColor', 'b', 'MarkerSize', 12);

% euler
% dt_1_norm = 0.00177427;
% dt_05_norm = 0.000872334;
% dt_0250_norm = 0.000432893;
% dt_0125_norm = 0.00021571;
% dt_00625_norm = 0.000107701;
% 
% norms = [dt_1_norm, dt_05_norm, dt_0250_norm, dt_0125_norm, dt_00625_norm];
% k = 1:length(norms);
% fit3 = polyfit(k, log2(norms), 1);



%%%%%% Crank Nicolson %%%%
dt_1_norm = 6.82957e-5;
dt_05_norm = 1.75551e-5;
dt_0250_norm = 4.37019e-6;
dt_0125_norm = 1.04249e-6;
dt_00625_norm = 2.08597e-7;

norms = [dt_1_norm, dt_05_norm, dt_0250_norm, dt_0125_norm, dt_00625_norm];
k = 1:length(norms);
fit4 = polyfit(k, log2(norms), 1);

times = [0.1, 0.05, 0.0250, 0.0125, 0.00625];
hold on;
loglog(times, norms, '-sb','LineWidth', 1, 'MarkerFaceColor', 'b', 'MarkerSize', 12);

%legend('semi-bdf2', 'cn-ab2', 'implicit-euler', 'cn2');

% LINEAR BDF2
dt_1_norm = 0.000140659;
dt_05_norm = 6.04622e-5;
dt_0250_norm = 2.00388e-5;
dt_0125_norm = 5.57157e-6;
dt_00625_norm = 1.20416e-6;

norms = [dt_1_norm, dt_05_norm, dt_0250_norm, dt_0125_norm, dt_00625_norm];
k = 1:length(norms);
fit5 = polyfit(k, log2(norms), 1);

times = [0.1, 0.05, 0.0250, 0.0125, 0.00625];
hold on;
loglog(times, norms, '-sr','LineWidth', 1, 'MarkerFaceColor', 'r', 'MarkerSize', 12);

legend('O(\Deltat^2)', 'IMEX-BDF2', 'CN-AB2', 'CN', 'BDF2');

%saveas(fig, 'figures/all.png');