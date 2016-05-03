function [output] = parse_many(filenames, secs_interval)
    output = [];
    seconds_vector = zeros(1);
    for i = 1:size(filenames, 2)
       tmp = parse_data(filenames{1, i}, secs_interval);
       
       if size(tmp, 1) > size(seconds_vector, 1)
           seconds_vector = tmp(:,1);
       end
       
       if size(tmp, 1) > size(output, 1)
           tmp_output = zeros(size(tmp, 1), size(tmp, 2) - 1 + size(output, 2));
           tmp_output(1:size(output,1), 1:size(output, 2)) = output;
           tmp_output(:, size(output, 2)+1:end) = tmp(:, 2:end);
           output = tmp_output;
       else
           tmp_output = zeros(size(output, 1), size(tmp, 2) - 1 + size(output, 2));
           tmp_output(:, 1:size(output, 2)) = output;
           tmp_output(1:size(tmp, 1), size(output, 2)+1:end) = tmp(:, 2:end);
           output = tmp_output;
       end
    end
    
    tmp_output = zeros(size(output, 1), 1+size(output,2));
    tmp_output(:, 2:end) = output;
    tmp_output(:, 1) = seconds_vector;
    output = tmp_output;
end