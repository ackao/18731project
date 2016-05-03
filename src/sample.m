filenames1 = {'data/Phil_Image_Short_bw_100ms_cut.csv', 'data/Phil_Image_Long_bw_100ms_cut.csv', 'data/Phil_Moving_Short_bw_100ms_cut.csv', 'data/Phil_Moving_Long_bw_100ms_cut.csv'};
filenames2 = {'data/Yellow_Image_Short_bw_100ms_cut.csv', 'data/Yellow_Image_Long_bw_100ms_cut.csv', 'data/Yellow_Moving_Short_bw_100ms_cut.csv', 'data/Yellow_Moving_Long_bw_100ms_cut.csv'};


output1 = parse_many(filenames1, 0.1);
output2 = parse_many(filenames2, 0.1);

output1 = norm_filt(output1);
%plot_data(output1, 2, 2);


output2 = norm_filt(output2);
%plot_data(output2, 2, 2);

[lin_corrs, fft_corrs] = correlate(output1, output2);

model = model_stats(lin_corrs, fft_corrs);