clc;
close all;
clear all;

%bloth imex cnab and semibdf

% nonlinear euler
% dt_1_norm = 0.0237145;
% dt_05_norm = 0.012002;
% dt_0250_norm = 0.00606097;
% dt_0125_norm = 0.00304016;
% dt_00625_norm = 0.00152262;

% norms = [dt_1_norm, dt_05_norm, dt_0250_norm, dt_0125_norm, dt_00625_norm];
% k = 1:length(norms);
% fit3 = polyfit(k, log2(norms), 1);
fig = figure;
times = [0.1, 0.05, 0.0250, 0.0125, 0.00625];
loglog(times, times.^2, '-k', 'LineWidth', 1);
xlabel('\Deltat');
ylabel('L^2 error');
set(gca,'fontsize',16);
title('Model B, Reaction-Diffusion L^2 Errors Comparison');

% nonlinear semiBDF
dt_1_norm = 0.00221958;
dt_05_norm = 0.000614155;
dt_0250_norm = 0.000164391;
dt_0125_norm = 4.3516e-5;
dt_00625_norm = 1.1134e-5;

norms = [dt_1_norm, dt_05_norm, dt_0250_norm, dt_0125_norm, dt_00625_norm];
k = 1:length(norms);
fit1 = polyfit(k, log2(norms), 1);

times = [0.1, 0.05, 0.0250, 0.0125, 0.00625];
hold on
loglog(times, norms, '-*r','LineWidth', 1, 'MarkerFaceColor', 'r', 'MarkerSize', 12);

%non linear CNAB
dt_1_norm = 0.00136986;
dt_05_norm = 0.000377152;
dt_0250_norm = 9.95886e-5;
dt_0125_norm = 2.55651e-5;
dt_00625_norm = 6.36142e-6;

norms = [dt_1_norm, dt_05_norm, dt_0250_norm, dt_0125_norm, dt_00625_norm];
k = 1:length(norms);
fit2 = polyfit(k, log2(norms), 1);

times = [0.1, 0.05, 0.0250, 0.0125, 0.00625];
hold on
loglog(times, norms, '-*b', 'LineWidth', 1, 'MarkerFaceColor', 'b', 'MarkerSize', 12);

% nonlinear cn
dt_1_norm = 0.000371665;
dt_05_norm = 0.000110567;
dt_0250_norm = 2.7739e-5;
dt_0125_norm = 6.58653e-6;
dt_00625_norm = 1.31614e-6;

norms = [dt_1_norm, dt_05_norm, dt_0250_norm, dt_0125_norm, dt_00625_norm];
k = 1:length(norms);
fit4 = polyfit(k, log2(norms), 1);

times = [0.1, 0.05, 0.0250, 0.0125, 0.00625];
hold on;
loglog(times, norms, '-sb','LineWidth', 1, 'MarkerFaceColor', 'b', 'MarkerSize', 12);

%legend('semi-bdf2', 'cn-ab2', 'implicit-euler', 'cn2');

% nonlinear BDF
dt_1_norm = 0.000910905;
dt_05_norm = 0.00028134;
dt_0250_norm = 7.79658e-5;
dt_0125_norm = 2.1927e-5;
dt_00625_norm = 5.74097e-6;

norms = [dt_1_norm, dt_05_norm, dt_0250_norm, dt_0125_norm, dt_00625_norm];
k = 1:length(norms);
fit5 = polyfit(k, log2(norms), 1);

times = [0.1, 0.05, 0.0250, 0.0125, 0.00625];
hold on;
loglog(times, norms, '-sr','LineWidth', 1, 'MarkerFaceColor', 'r', 'MarkerSize', 12);

legend('O(\Deltat^2)', 'IMEX-BDF2', 'CN-AB2', 'CN', 'BDF2');

fits = [fit1, fit2, fit4, fit5];
%saveas(fig, 'figures/nonlinear_all.png');