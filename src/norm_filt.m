function [output] = norm_filt(input)

    %% Function input
    % input: input data with first column as time and subsequent columns as
    % parsed data points
    
    %% Function output
    % output: input data but normalized and filtered using sgolayfilt

    %% Function implementation
    num_data_sets = size(input, 2) - 1;

    output = input;
    
    for i = 1:num_data_sets
        output(:, i+1) = sgolayfilt(input(:, i+1)/norm(input(:, i+1)), 3, 41);
    end
end