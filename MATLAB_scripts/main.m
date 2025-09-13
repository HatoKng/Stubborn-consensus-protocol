clear; clc; close all;

% Number of agents
N = 6;

% Initial conditions (1 outlier)
x0 = [1; 1.2; 0.9; 1.1; 1; 8];  


aritmetic_mean = mean(x0);
armonic_mean = armonic_mean(x0);

disp('aritmetic mean:') 
disp(aritmetic_mean)

disp('armonic mean:') 
disp(armonic_mean)


A = generate_graph(N);
T = 50;
% Simulate standard consensus
x_consensus = standard_consensus(A, x0, T);

% Simulate weighted consensus
x_weighted = weighted_consensus(A, x0, T);

% Simulate stubborn consensus
x_stubborn = stubborn_consensus(A, x0, T);

% Plot 
plot_states(x_consensus, T, 'Standard Consensus');
plot_states(x_weighted, T, 'Weighted Consensus');
plot_states(x_stubborn, T, 'Stubborn Consensus');