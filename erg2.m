function [X_n] = erg2(omega_0)
arguments
    omega_0
end
num_hypotesis = 1000;
LENGTH = 10000;
OFFSETS = (0:10)';

gt_mean = 0;
X_n = gen_x(omega_0, LENGTH, num_hypotesis, OFFSETS);

end