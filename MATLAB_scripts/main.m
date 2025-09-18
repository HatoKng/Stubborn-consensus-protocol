clear; clc; close all;

% Number of agents
N = 6;

% Initial conditions 
x0 = [1; 1.2; 0.9; 1.1; 1.3; 12];  
v0 = [-1; -1; -1; -1; -1; -1];         % if v0 is [] then the simple integrator case is 
                            % enabled else is enabled the double integrator case
converge_and_move = true;

aritmetic_mean = mean(x0);
armonic_mean = armonic_mean(x0);

disp('aritmetic mean:') 
disp(aritmetic_mean)

disp('armonic mean:') 
disp(armonic_mean)


A = generate_graph(N);
T = 10;

% Simulate weighted consensus
[z_weighted, t_weighted] = weighted_consensus(A, x0, v0, T, converge_and_move);

% Simulate standard consensus
[z_consensus, t_standard] = standard_consensus(A, x0, v0, T, converge_and_move);

% Simulate stubborn consensus
[z_stubborn, y_stubborn, t_stubborn] = stubborn_consensus(A, x0, v0, T, converge_and_move);

% Plot 
figure;
set(gcf, 'Position', [100 100 1300 700]);

h1 = subplot(2,2,1);   % top-left
plot_states(z_consensus(1:N,:), t_standard, 'Standard Consensus x(t)');
set(h1,'Position',[0.1 0.57 0.4 0.4]);

h2 = subplot(2,2,2);   % top-right
plot_states(z_weighted(1:N,:), t_weighted, 'Weighted Consensus x(t)');
set(h2,'Position',[0.55 0.57 0.4 0.4]);

h3 = subplot(2,2,3);   % bottom-left
plot_states(y_stubborn(1:N,:), t_stubborn, 'Stubborn Consensus y(t)');
set(h3,'Position',[0.1 0.08 0.4 0.4]);

h4 = subplot(2,2,4);   % bottom-right
plot_states(z_stubborn(1:N,:), t_stubborn, 'Stubborn Consensus x(t)');
set(h4,'Position',[0.55 0.08 0.4 0.4]);


if ~isempty(v0)
    figure;
    set(gcf, 'Position', [100 100 1300 700]);
    
    h1 = subplot(2,2,1);   % top-left
    plot_states(z_consensus(N+1:2*N,:), t_standard, 'Standard Consensus v(t)');
    set(h1,'Position',[0.1 0.57 0.4 0.4]);

    h2 = subplot(2,2,2);   % top-right
    plot_states(z_weighted(N+1:2*N,:), t_weighted, 'Weighted Consensus v(t)');
    set(h2,'Position',[0.55 0.57 0.4 0.4]);

    h3 = subplot(2,2,3);   % bottom-left
    plot_states(y_stubborn(N+1:2*N,:), t_stubborn, 'Stubborn Consensus v_y(t)');
    set(h3,'Position',[0.1 0.08 0.4 0.4]);
    
    h4 = subplot(2,2,4);   % bottom-right
    plot_states(z_stubborn(N+1:2*N,:), t_stubborn, 'Stubborn Consensus v_x(t)');
    set(h4,'Position',[0.55 0.08 0.4 0.4]);
end
