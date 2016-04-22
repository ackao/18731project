function plot_data(input, rows, cols)

    %% Function input
    % input: The input data. First column is time-axis and subsequent
    % columns are parsed data points
    % rows: The number of desired rows in plot
    % cols: The number of desired columns in plot

    %% Function implementation
    plot_num = 2;
    figure
    for i = 1:rows
        for j = 1:cols
            subplot(rows, cols, plot_num - 1)
            plot(input(:,1), input(:, plot_num));
            plot_num = plot_num + 1;
        end
    end
end