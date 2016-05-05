% Data files
database_files = {'data/Phil_Image_Short_bw_100ms_cut.csv', 'data/Phil_Image_Long_bw_100ms_cut.csv', 'data/Phil_Moving_Short_bw_100ms_cut.csv', 'data/Phil_Moving_Long_bw_100ms_cut.csv'};
testset1_files = {'data/Yellow_Image_Short_bw_100ms_cut.csv', 'data/Yellow_Image_Long_bw_100ms_cut.csv', 'data/Yellow_Moving_Short_bw_100ms_cut.csv', 'data/Yellow_Moving_Long_bw_100ms_cut.csv'};
testset2_files = {'data/Yellow_Image_Short_2_cut.csv', 'data/Yellow_Image_Long_2_cut.csv', 'data/Yellow_Moving_Short_2_cut.csv', 'data/Yellow_Moving_Long_2_cut.csv'};
testset3_files = {'data/Yellow_Image_Short_2_cut.csv'};

% Parse data
database = parse_many(database_files, 0.1);
testset1 = parse_many(testset1_files, 0.1);
testset2 = parse_many(testset2_files, 0.1);
testset3 = parse_many(testset3_files, 0.1);

% Normalize
database = norm_filt(database);
testset1 = norm_filt(testset1);
testset2 = norm_filt(testset2);
testset3 = norm_filt(testset3);

% Uncomment below to plot the data
%plot_data(output1, 4, 4);
%plot_data(output2, 4, 4);

% Perform linear and fft correlations
[lin_corrs, fft_corrs] = correlate(testset3, database);

% Run the correlations through our model
model = model_stats(lin_corrs, fft_corrs);