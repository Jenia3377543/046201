function [x_hat,v_hat] = kalmanfilt(y_n,sigma_w,sigma_u,x_0,pi_0,T)
arguments
    y_n 
    sigma_w = 1
    sigma_u = 1e3
    x_0 = [0; 0]
    pi_0 = [1e6; 10e8]
    T = 1
end

A = [
    [1 T];
    [0 1];
];

B = [
    0.5 * T^2;
    T;
    ];

C = [1 0];
I = eye(size(A));

N_iterations = length(y_n);

x_prev = x_0;
P_prev = diag(pi_0);

x_hat = zeros(size(y_n));
v_hat = zeros(size(y_n));

for iter = 1:N_iterations
    % Compute Kalman constant
    K_n = P_prev * C.' / (C * P_prev * C.' + sigma_u^2);
    
    % Update x_n and P_n
    x_curr = x_prev + K_n * (y_n(iter) - C * x_prev);
    P_curr = (I - K_n * C) * P_prev;

    % Time step
    P_next = A * P_curr * A.' + (sigma_w^2) * (B * B.');
    x_next = A * x_curr;

    x_prev = x_next;
    P_prev = P_next;
    x_hat(iter) = x_next(1);
    v_hat(iter) = x_next(2);
end
end