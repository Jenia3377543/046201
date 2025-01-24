function [x,v,y] = gen_meas(X0, sigma_u)
arguments
    X0 = 0
    sigma_u = 1000
end
% First part
v1 = 100; dt1 = 200;
x1 = (0:dt1-1) * v1;

% Second part
v2 = -100; dt2 = 300;
x2 = x1(end) + (0:dt2-1) * v2;

x = cat(2, x1, x2);
v = diff([X0, x]);

% Noise the x samples
y = x + sigma_u * randn(size(x));
end