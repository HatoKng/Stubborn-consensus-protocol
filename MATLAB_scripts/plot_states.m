function plot_states(x_hist, tvec, title_str)
    hold on;
    plot(tvec, x_hist', 'LineWidth', 2);
    xlabel('Time (s)');
    ylabel('Agent State');
    title(title_str);
    legend(arrayfun(@(i) sprintf('Agent %d', i), 1:size(x_hist,1), 'UniformOutput', false));
    grid on;
end