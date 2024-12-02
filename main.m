%% Section a-b
omega_0 = 0.5;
[mean_diffs,std_diffs, diffs] = erg1(omega_0);

figure(999); 
histogram(diffs, -5:1e-1:5);
title({ ...
    compose("\\omega_0=%.3f", omega_0), ...
    compose("\\mu=%.3f; \\sigma=%.3f", mean_diffs, std_diffs)});
%% Section c
omega_0 = 0;
[r_xx_diffs_mean, r_xx_diffs_std, r_xx_diffs] = erg2(omega_0);

figure(998);
for k = 1:height(r_xx_diffs)
    nexttile;
    histogram(r_xx_diffs(k, :), -5:1e-1:5);
    title({ ...
        compose("K=%d", k-1), ...
        compose("\\mu=%.3f; \\sigma=%.3f", ...
        r_xx_diffs_mean(k), ...
        r_xx_diffs_std(k))});
end
sgtitle(compose("\\omega_0=%.3f", omega_0));