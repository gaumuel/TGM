clc;
close all;
clear all;

%bloth imex cnab and semibdf
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

fig = figure;
hold on
xlabel('\Deltat');
ylabel('L^2 error');
title('Nonlinear Reaction-Diffusion Errors CNAB2 vs CN2');
loglog(times, norms, '-d', 'MarkerFaceColor', 'blue');

% nonlinear cn2
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
loglog(times, norms, '-d', 'MarkerFaceColor', 'red');

%legend('semi-bdf2', 'cn-ab2', 'implicit-euler', 'cn2');
legend('cn-ab2','cn2');
saveas(fig, 'figures/nonlinear_cnabVScn2.png');