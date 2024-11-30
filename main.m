%% Section a-b
omega_0 = 0;
[mean_diffs,std_diffs, diffs] = erg1(omega_0);

figure(999); 
histogram(diffs, -5:1e-1:5);
title({ ...
    compose("\\omega_0=%.3f", omega_0), ...
    compose("\\mu=%.3f; \\sigma=%.3f", mean_diffs, std_diffs)});
%% Section c
omega_0 = 0;
[X_n] = erg2(omega_0);