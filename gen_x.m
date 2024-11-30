function [X_n] = gen_x(omega_0,N,num_hypotesis,offsets)
arguments
    omega_0                {mustBeNumeric}
    N                      {mustBeNumeric}
    num_hypotesis  {mustBeInteger} = 1
    offsets (:, 1) = 0;
end
discreate_time_domain = (0:N-1) + offsets;
NUM_OFFSETS = height(offsets);

A_B_hC = randn(num_hypotesis, 3) .* [1 1 1/sqrt(2)];
A_B_hC = reshape(A_B_hC, [num_hypotesis, 1, 3]);
Z_n = randn(num_hypotesis, N);
parts = cat(3, ...
    cos(omega_0 * discreate_time_domain) .^ 2, ...
    sin(omega_0 * discreate_time_domain) .^ 2, ...
    sin(2 * omega_0 * discreate_time_domain) ...
    );
X_n = sum(parts .* A_B_hC, 3) + Z_n;
end