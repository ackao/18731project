filename = 'Phil_Image_Long_bw_100ms_cut.csv';

output = parse_data(filename, 0.1);
output = norm_filt(output);
%plot_data(output, 2, 2);

filename1 = 'Yellow_Image_Long_bw_100ms_cut.csv';
output1 = parse_data(filename1, 0.1);
output1 = norm_filt(output1);
%plot_data(output1, 2, 2);

correlate(output, output);