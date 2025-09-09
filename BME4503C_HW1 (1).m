clear; clc; close all
%% BME4503C_HW1.m
% Emily D. Delgado Gonzalez
% HW1 – variables, equations, matrices, plots, and saving workspace

%% 1) Variables (two of each type) and sizes
% Scalars
a = 0.07;                     % decay rate (1/s)
f = 0.5;                      % frequency (Hz)
size_a = size(a);
size_f = size(f);

% Vectors (row and column)
v_row = [1, 3, 5, 7];         % 1x4 row vector
v_col = (10:10:50)';          % 5x1 column vector
size_v_row = size(v_row);
size_v_col = size(v_col);

% Matrices
M1 = [1 2; 3 4; 5 6];         % 3x2
M2 = [2 0; -1 1; 3 -2];       % 3x2 (same size as M1 for element-wise ops)
N  = [1 -1 0; 2 3 4];         % 2x3 (for matrix multiplication)
size_M1 = size(M1);
size_M2 = size(M2);
size_N  = size(N);

%% 2) Scalar equation P(t) at a single time t = 4 s
P0 = 120;
t_single = 4;
P_single = P0 * exp(-a*t_single) * cos(2*pi*f*t_single);  % scalar result

%% 3) Matrix equation(s)
% Matrix multiplication: (3x2)*(2x3) -> 3x3
MM_prod = M1 * N;

% Element-wise operation on two same-size matrices (3x2)
EW_mul  = M1 .* M2;           % element-wise multiply
EW_pow  = M1 .^ 2;            % example: element-wise square (optional)

%% 4) Build time array and plot P(t)
t = 0:0.01:100;               % seconds
P_t = P0 .* exp(-a.*t) .* cos(2*pi*f.*t);

figure(1)
plot(t, P_t, 'LineWidth', 1.2)
xlabel('Time t (s)')
ylabel('P(t)')
title('P(t) = P_0 e^{-a t} \times cos(2\pi f t)')
legend('P(t)')
grid on

% Save figure
exportgraphics(gcf,'P_t_plot.png','Resolution',300)   % high-quality PNG
savefig('P_t_plot.fig')                               % MATLAB figure format

%% 5) Piecewise signal g(t) using a for-loop
g = zeros(size(t));           % preallocate

for k = 1:numel(t)
    tk = t(k);
    if tk < 50
        g(k) = sin(0.2*tk);           % g1(t)
    elseif tk < 90
        g(k) = 0.5*tk - 20;           % g2(t)
    else
        g(k) = exp(-(tk - 90)/5);     % g3(t)
    end
end

figure(2)
plot(t, g, 'LineWidth', 1.2)
xlabel('Time t (s)')
ylabel('g(t)')
title('Piecewise Signal g(t)')
legend('g(t)')
grid on

% Save figure
exportgraphics(gcf,'g_t_plot.png','Resolution',300)   % high-quality PNG
savefig('g_t_plot.fig')                               % MATLAB figure format

%% 6) Save workspace variables to a .mat file
save('BME4503C_HW1_workspace.mat')
