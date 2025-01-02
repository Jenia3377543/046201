function [H] = estim_mtrx(N, b)
arguments
    N 
    b = 0.5
end
% Find estimation matrix H as have shown in class
H_yy = full(spdiags(-(N-1):N-1,-(N-1):N-1,N,N));
H_yy = (1+b^2) * (H_yy == 0) + b * (H_yy == 1) + b * (H_yy == -1);

% Find Cholesky decomposition to get the casual part
[L_yy, ~] = chol(H_yy, 'lower');

H_xy = full(spdiags(-(N-1):N-1,(-(N-1):N-1),N,N)) - 1;
H_xy = (1+b^2) * (H_xy == 0) + b * (H_xy == 1) + b * (H_xy == -1);

% Calculate the H matrix, the tril used to get the casual part and
% afterwards multiplied by the casual part of H_yy
H = tril(H_xy * inv(L_yy')) * inv(L_yy);
end