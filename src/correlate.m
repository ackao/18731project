function [output] = correlate(input1, input2)

    %% Function input
    % input1 and input2: The two input data matrices to correlate
    
    %% Function output
    % output:
    
    %% Function implementation
    % Ensure we have similar sized datasets
    assert(size(input1, 2)==size(input2, 2), 'Dataset size mismatch');

    s = size(input1, 2);

    figure

    for i = 2:s
        highest_sum_so_far = 0;
        matching_index = 0;
        for j = 2:s
            [acor, lag] = xcorr(input1(:,i), input2(:,j));
            subplot(s - 1, s - 1, (i-2)*(s-1)+(j-1))
            plot(lag, acor)
            
            if max(acor) > highest_sum_so_far
                highest_sum_so_far = max(acor);
                matching_index = j - 1;
            end
        end
        X = sprintf('%d matches best with %d.', i - 1, matching_index);
        disp(X)
    end
    
    output = zeros(size(input1));
end