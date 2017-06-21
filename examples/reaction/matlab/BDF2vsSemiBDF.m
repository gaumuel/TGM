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
title('Error ');

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
loglog(times, norms, '-d', 'MarkerFaceColor', 'red');

legend('semi-bdf2', 'bdf2');
saveas(fig, 'figures/bdf2VSsbdf2.png');