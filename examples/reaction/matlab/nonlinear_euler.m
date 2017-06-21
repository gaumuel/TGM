clc;
close all;
clear all;

% nonlinear euler
dt_1_norm = 0.0237145;
dt_05_norm = 0.012002;
dt_0250_norm = 0.00606097;
dt_0125_norm = 0.00304016;
dt_00625_norm = 0.00152262;

%euler vs euler
% dt_1_norm = 0.0229739;
% dt_05_norm = 0.0112519;
% dt_0250_norm = 0.00530539;
% dt_0125_norm = 0.00228075;
% dt_00625_norm = 0.00076038;

norms = [dt_1_norm, dt_05_norm, dt_0250_norm, dt_0125_norm, dt_00625_norm];
k = 1:length(norms);
fit1 = polyfit(k, log2(norms), 1);

times = [0.1, 0.05, 0.0250, 0.0125, 0.00625];
figure;
loglog(times, norms)