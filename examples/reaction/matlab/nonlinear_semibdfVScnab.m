clc;
close all;
clear all;

%bloth imex cnab and semibdf

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
fig = figure;
hold on
loglog(times, norms, '-d', 'MarkerFaceColor', 'red');
xlabel('\Deltat');
ylabel('L^2 error');
title('Nonlinear Reaction-Diffusion SBDF2 vs CNAB2');

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
loglog(times, norms, '-d', 'MarkerFaceColor', 'blue');
legend('semi-bdf2', 'cn-ab2');
saveas(fig, 'figures/nonlinear_cnabVSsbdf.png');