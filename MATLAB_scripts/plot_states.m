function plot_states(x_hist, T, title_str)
    figure;
    plot(0:T, x_hist', 'LineWidth', 2);
    xlabel('Time');
    ylabel('Agent State');
    title(title_str);
    legend(arrayfun(@(i) sprintf('Agent %d', i), 1:size(x_hist,1), 'UniformOutput', false));
    grid on;
end