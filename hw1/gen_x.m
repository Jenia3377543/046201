function [X_n] = gen_x(omega_0,N,NUM_HYPOTESIS,OFFSETS)
arguments
    omega_0        {mustBeNumeric}
    N              {mustBeNumeric}
    NUM_HYPOTESIS  {mustBeInteger} = 1
    OFFSETS (:, 1) = 0;
end
discreate_time_domain = (0:N-1) + OFFSETS;
NUM_OFFSETS = height(OFFSETS);

A_B_hC = tensorprod(randn(NUM_OFFSETS, NUM_HYPOTESIS, 1, 3), diag([1 1 1/sqrt(2)]), 4, 2);

Z_n = randn(NUM_OFFSETS, NUM_HYPOTESIS, N);
X_n_parts = cat(3, ...
    cos(omega_0 * discreate_time_domain) .^ 2, ...
    sin(omega_0 * discreate_time_domain) .^ 2, ...
    sin(2 * omega_0 * discreate_time_domain) ...
    );

X_n_parts = permute(X_n_parts, [1 4 2 3]);
X_n = sum(X_n_parts .* A_B_hC, 4) + Z_n;
end