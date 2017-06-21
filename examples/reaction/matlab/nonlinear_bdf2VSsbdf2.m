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

norms1 = [dt_1_norm, dt_05_norm, dt_0250_norm, dt_0125_norm, dt_00625_norm];
k = 1:length(norms1);
fit1 = polyfit(k, log2(norms1), 1);

times = [0.1, 0.05, 0.0250, 0.0125, 0.00625];
fig = figure;
hold on
loglog(times, norms1, '-d', 'MarkerFaceColor', 'red');
xlabel('\Deltat');
ylabel('L^2 error');
title('Nonlinear Reaction-Diffusion Semi-BDF2 vs BDF2');

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
h2=times.^2;
hold on;
loglog(times, norms, '-d', 'MarkerFaceColor', 'red');

legend('semi-bdf2', 'bdf2');
saveas(fig, 'figures/nonlinear_bdf2VSsbdf2.png');

figure; loglog(times, h2, '-d', 'MarkerFaceColor', 'red');
hold on;
loglog(times, norms, '-d', 'MarkerFaceColor', 'red');
loglog(times, norms1, '-d', 'MarkerFaceColor', 'red');