clear; clc; close all;

% Number of agents
N = 6;

% Initial conditions 
x0 = [0.5; 0.2; 0.4; 0.1; 0.35; 20];  


aritmetic_mean = mean(x0);
armonic_mean = armonic_mean(x0);

disp('aritmetic mean:') 
disp(aritmetic_mean)

disp('armonic mean:') 
disp(armonic_mean)


A = generate_graph(N);
T = 8;

% Simulate weighted consensus
[x_weighted, t_weighted] = weighted_consensus(A, x0, T);

% Simulate standard consensus
[x_consensus, t_standard] = standard_consensus(A, x0, T);

% Simulate stubborn consensus
[x_stubborn, y_stubborn, t_stubborn] = stubborn_consensus(A, x0, T);

% Plot 
figure;
set(gcf, 'Position', [100 100 1300 700]);

h1 = subplot(2,2,1);   % top-left
plot_states(x_consensus, t_standard, 'Standard Consensus x(t)');
set(h1,'Position',[0.1 0.57 0.4 0.4]);

h2 = subplot(2,2,2);   % top-right
plot_states(x_weighted, t_weighted, 'Weighted Consensus x(t)');
set(h2,'Position',[0.55 0.57 0.4 0.4]);

h3 = subplot(2,2,3);   % bottom-left
plot_states(y_stubborn, t_stubborn, 'Stubborn Consensus y(t)');
set(h3,'Position',[0.1 0.08 0.4 0.4]);

h4 = subplot(2,2,4);   % bottom-right
plot_states(x_stubborn, t_stubborn, 'Stubborn Consensus x(t)');
set(h4,'Position',[0.55 0.08 0.4 0.4]);