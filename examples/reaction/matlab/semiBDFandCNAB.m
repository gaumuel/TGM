clc;
close all;
clear all;

%bloth imex cnab and semibdf

%semi bdf
dt_1_norm = 0.000369454;
dt_05_norm = 3.45565e-5;
dt_0250_norm = 4.71612e-6;
dt_0125_norm = 3.49546e-6;
dt_00625_norm = 1.18826e-6;

norms = [dt_1_norm, dt_05_norm, dt_0250_norm, dt_0125_norm, dt_00625_norm];
k = 1:length(norms);
fit1 = polyfit(k, log2(norms), 1);

times = [0.1, 0.05, 0.0250, 0.0125, 0.00625];
fig = figure;
hold on
loglog(times, norms, '-d', 'MarkerFaceColor', 'red');
xlabel('\Deltat');
ylabel('L^2 error');
title('Linear Reaction-Diffusion SBDF2 vs CNAB2');

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
loglog(times, norms, '-d', 'MarkerFaceColor', 'blue');
legend('semi-bdf2', 'cn-ab2');
saveas(fig, 'figures/cnabVSsbdf.png');