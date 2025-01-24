%% Sample measurements 
[x,v,y] = gen_meas();
figure; 
nexttile; hold all;
plot(x);
title('X[n] - Particle position (Clean)');
xlabel('Time domain [sec]');
ylabel('X[n]');

nexttile;
plot(y);
title('Y[n] - Particle position (Noised)');
xlabel('Time domain [sec]');
ylabel('Y[n]');
%% Apply Kalman filter
[x_hat,v_hat] = kalmanfilt(y, 1, 1e3);

figure;
nexttile; 
sgtitle('Approximated Locations & Velocity');
hold all;
plot(x_hat, 'DisplayName', '$\hat{X}[n]$ - Approximated');
plot(x, 'DisplayName', '$X[n]$ - Clean');
plot(y, 'DisplayName', '$Y[n]$ - Noised');
title('Particle location - $\hat{X}[n]$ vs $X[n]$', 'Interpreter', 'latex');
xlabel('Time domain [sec]');
ylabel('$\hat{X}[n]$ [m]', 'Interpreter', 'latex');
legend('Interpreter','latex');

nexttile; hold all;
plot(v_hat, 'DisplayName', '$\hat{V}[n]$');
plot(v, 'DisplayName', '$V[n]$');
title('Velocities - $\hat{V}[n]$ vs $V[n]$', 'Interpreter', 'latex');
xlabel('Time domain [sec]');
ylabel('$\hat{V}[n]$ [m/sec]', 'Interpreter', 'latex');
legend('Interpreter', 'latex');
saveas(gcf, 'approximated_locations_velocity.png')

MSE_locations = (x - x_hat).^2;
MSE_velocity = (v - v_hat).^2;

figure;
nexttile;
sgtitle('MSE errors');
plot(MSE_locations);
title('MSE - Particle location');
xlabel('Time domain [sec]');
ylabel('$MSE$', 'Interpreter', 'latex');
ylim([0 10e6]);

nexttile;
plot(MSE_velocity);
title('MSE - Particle velocity');
xlabel('Time domain [sec]');
ylabel('$MSE$', 'Interpreter', 'latex');
saveas(gcf, 'MSE_error.png')