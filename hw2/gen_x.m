function [X_n] = gen_x(N, b, NREPS)
arguments
    N 
    b = 0.5
    NREPS = 1e3
end
% Generate W_n noise in dimension NREPS x N+2
% The second dimension is N+2 in order to get X_n of dimension NREPS x N
W_n = randn(NREPS, N + 2);
X_n = W_n(:, 2:end) + b * W_n(:, 1:end-1);
end