function [output] = model_stats(lin_corrs, fft_corrs)

    %% Function input
    % lin_corrs: Matrix of linear correlations. Rows are test data, columns
    % are database entries
    % fft_corrs: Matrix of fft correlations. Rows are test data, columns
    % are database entries

    assert(size(lin_corrs, 1)==size(fft_corrs, 1), 'Dataset size mismatch');
    assert(size(lin_corrs, 2)==size(fft_corrs, 2), 'Dataset size mismatch');

    lin_corr_weight = 0.35;
    fft_corr_weight = 1 - lin_corr_weight;
    
    num_to_correlate = size(lin_corrs, 1);
    
    tmp_lin_corrs = zeros(size(lin_corrs));
    tmp_fft_corrs = zeros(size(fft_corrs));
    output = zeros(size(lin_corrs));
    
    for i = 1:num_to_correlate
        tmp_lin_corrs(i, :) = lin_corrs(i, :) ./ sum(lin_corrs(i, :));
        tmp_fft_corrs(i, :) = fft_corrs(i, :) ./ sum(fft_corrs(i, :));
        output(i, :) = lin_corr_weight.*tmp_lin_corrs(i,:) + fft_corr_weight.*tmp_fft_corrs(i,:);
    end
    
    [M, I1] = max(output,[],2);
    
    tmp_output = output;
    
    for i = 1:num_to_correlate
        tmp_output(i, I1(i)) = 0;
    end
    
    [M, I2] = max(tmp_output,[],2);
    
    for i = 1:num_to_correlate
       X = sprintf('%d -> %d, %d', i, I1(i), I2(i));
       disp(X)
    end
end