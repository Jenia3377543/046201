function [mean_diffs,std_diffs, diffs] = erg1(omega_0)
arguments
    omega_0
end
num_hypotesis = 1000;
LENGTH = 10000;

gt_mean = 0;
X_n = gen_x(omega_0, LENGTH, num_hypotesis);
X_n = squeeze(X_n);

empirical_mean = mean(X_n, 2);
diffs = empirical_mean - gt_mean;

mean_diffs = mean(diffs);
std_diffs  = std(diffs);
end