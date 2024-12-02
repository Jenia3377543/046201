function [r_xx_diffs_mean, r_xx_diffs_std, r_xx_diffs] = erg2(omega_0)
arguments
    omega_0
end
num_hypotesis = 100;
LENGTH = 1000;
OFFSETS = (0:10)';

gt_r_xx = @(k) (k == 0) + cos(omega_0 * k) .^ 2;
X_n = gen_x(omega_0, LENGTH, num_hypotesis, OFFSETS);
X_n_mean = mean(X_n, 3);
r_xx_ii = (X_n - X_n_mean) .* (X_n(1, :, :) - X_n_mean(1, :));
r_xx = mean(r_xx_ii, 3);

r_xx_diffs = r_xx - gt_r_xx(OFFSETS);
r_xx_diffs_mean = mean(r_xx_diffs, 2);
r_xx_diffs_std = std(r_xx_diffs, [], 2);

end