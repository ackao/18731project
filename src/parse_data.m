function [output] = parse_data(filename, secs_interval)

    %% Function input
    % filename: Relative of absolute file path of CSV data
    % secs_interal: The interval in seconds of the time-domain data
    
    %% Function output
    % output: The reshaped matrix with first column as time and subsequent
    % columns as datasets from different captures

    %% Function implementation
    % Read CSV file
    csv_data = csvread(filename, 0, 0);
    
    % Get some information on the time splits
    a = find(csv_data(:,1) == 0);
    s = size(a, 1);
    
    % Calculate the resulting matrix dimensions
    max_length_window = 0;
    
    for i = 2:s
        if a(i) - a(i-1) > max_length_window
            max_length_window = a(i) - a(i-1);
        end
    end
    
    if size(csv_data, 1) - a(s) > max_length_window
        max_length_window = size(csv_data, 1) - a(s);
    end
    
    % Build matrix from CSV data
    output = zeros(max_length_window, s + 1);
    b = 0:secs_interval:max_length_window*secs_interval;
    b = b';
    output(:,1) = b(1:end-1,:);
    
    for i = 1:s-1
       output(1:a(i+1) - a(i),i+1) = csv_data(a(i):a(i+1)-1,2); 
    end

    output(1:size(csv_data, 1) - a(s) + 1, s+1) = csv_data(a(s):end, 2);
end