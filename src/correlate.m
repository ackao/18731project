function [lin_corrs, fft_corrs] = correlate(testset, database)

    %% Function input
    % input1 and input2: The two input data matrices to correlate
    
    %% Function output
    % output:
    
    %% Function implementation
    % Ensure we have similar sized datasets
    assert(size(testset, 2)==size(database, 2), 'Dataset size mismatch');

    testset_smaller = 1;
    
    % Get the number of videos we are correlating
    s = size(testset, 2);

    % Figure out which input is 'smaller' so we can pad
    if size(testset, 1) > size(database, 1)
        larger = testset;
        smaller = database;
        testset_smaller = 0;
    else
        larger = database;
        smaller = testset;
    end
    
    % Pad with zeros to match size of larger input
    B = zeros(size(larger));
    B(1:size(smaller,1),:) = smaller;
    
    lin_corrs = zeros(size(testset, 2)-1, size(database, 2)-1);
    fft_corrs = zeros(size(testset, 2)-1, size(database, 2)-1);
    
    figure

    for i = 2:s
        highest_sum_so_far = 0;
        matching_index = 0;
        highest_corr_coef = 0;
        matching_corr_coef_index = 0;
        for j = 2:s
            [acor, lag] = xcorr(testset(:,i), database(:,j));
            subplot(s-1, s-1, (i-2)*(s-1)+(j-1)), plot(lag, acor)
            
            if max(acor) > highest_sum_so_far
                highest_sum_so_far = max(acor);
                matching_index = j - 1;
            end
            
            lin_corrs(i-1, j-1) = max(acor);
            
            if testset_smaller == 1
                c = corrcoef(abs(fft(B(:,i-1))), abs(fft(larger(:,j-1))));
            else
                c = corrcoef(abs(fft(larger(:,i-1))), abs(fft(B(:,j-1))));
            end
            
            if c(1, 2) > highest_corr_coef
                highest_corr_coef = c(1, 2);
                matching_corr_coef_index = j - 1;
            end
            
            fft_corrs(i-1, j-1) = c(1, 2);
        end
        X = sprintf('%d matches best with %d using xcorr.', i - 1, matching_index);
        disp(X)
        X = sprintf('%d matches best with %d using fft and corrcoef.', i - 1, matching_corr_coef_index);
        disp(X)
    end
    
    
end