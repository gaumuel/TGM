% adam refer to adam 400
% dt1_norm = 3.9*10^(-5)
% dt05_norm = 8.08*10^(-6)
% dt025_norm = 1.8*10^(-6)
% dt0125_norm = 3.51*10^(-7)
% k = 1:4;
% norms = [dt1_norm, dt05_norm, dt025_norm, dt0125_norm];
% ab = polyfit(k, log2(norms), 1)

% euelero   n = 1000
% dt1_norm = 3.377286*10^(-2)
% dt05_norm = 1.563934e-0
% dt025_norm =  6.678058e-03
% dt0125_norm = 2.222091e-03
% k = 1:4;
% norms = [dt1_norm, dt05_norm, dt025_norm, dt0125_norm];
% ab = polyfit(k, log2(norms), 1)

%cr nic
% dt1_norm = sqrt( (1/1000) * 2.506226e-03)
% dt05_norm = sqrt( (1/1000) * 2.292766e-03)
% dt025_norm = sqrt((1/1000) * 2.237065e-03)
% dt0125_norm = sqrt( (1/1000) * 2.222091e-03)
% k = 1:4;
% norms = [dt1_norm, dt05_norm, dt025_norm, dt0125_norm];
% ab = polyfit(k, log2(norms), 1)


% dt1_norm = sqrt(3.775921e-01)
% dt05_norm = sqrt(1.748531e-01)
% dt025_norm =  sqrt(7.466296e-02)
% dt0125_norm =  sqrt(2.484373e-02)
% k = 1:4;
% norms = [dt1_norm, dt05_norm, dt025_norm, dt0125_norm];
% ab = polyfit(k, log2(norms), 1)
% 
% times = [0.1, 0.05, 0.025, 0.0125];
% 
% figure;
% loglog(times, norms)
% hold on
% loglog(0.01:0.001:0.1, 0.01:0.001:0.1)


% set(gca, 'XTick', 1:2); % Change x-axis ticks
% set(gca, 'XTickLabel', [iter iter1]); % Change x-axis ticks labels.




%dt1_norm = sqrt(3.775921e-01)
?4.5551e-5
?1.24149e-5
?3.16636e-6
?7.54616e-7
?1.4146e-7
dt05_norm1 = 0.0255729
dt05_norm2 = 0.00113435
dt025_norm1 =  0.0135535
dt025_norm2 =  0.000196932
dt0125_norm1 =  0.0067926
dt0125_norm2 =  0.000138757
k = 1:3;
norms1 = [dt05_norm1, dt025_norm1, dt0125_norm1];
norms2 = [dt05_norm2, dt025_norm2, dt0125_norm2];
fit1 = polyfit(k, log2(norms1), 1);
fit2 = polyfit(k, log2(norms2), 1);

times = [0.5, 0.25, 0.125];
figure;
loglog(times, norms1)
