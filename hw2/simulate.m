function [X_n_approximated, error] = simulate(N, b, NREPS)
arguments
    N 
    b = 0.5
    NREPS  = 1e3
end
% Get the approximation matrix
H = estim_mtrx(N, b);
% Generate signals
X_n = gen_x(N, b, NREPS);

% Split the signal to past and future (1:N-1) and (2:N)
X_n_past = X_n(:, 1:end-1);
X_n_future = X_n(:, 2:end);

% Approximate the X_n using H matrix and past samples of X_n
X_n_approximated = H * X_n_past';

% Calculate the MSE error
diffs = X_n_future - X_n_approximated';
mean_error = mean(diffs.^2, 1);

% Plot the MSE error by discreate time index
figure(999);
plot(mean_error, '*--');
title('MSE error');
xlabel('Time index');
ylabel('$X_n - \hat{X}_n$', 'Interpreter','latex');
end
