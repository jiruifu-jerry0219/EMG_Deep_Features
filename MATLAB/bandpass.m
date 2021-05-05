clear
emg = load('EMG_RAW.mat');
data_set = emg.emg.data;
for i = 1:5
    for j = 1:6
        trial = data_set{i, j};
        fs = 1e3;
        fl = 20;
        fh = 500;
        x_band = filterEMG(trial, fs, 20, 500);
        data_set{i, j} = x_band;
        
    end
end
emg = struct('data', {data_set});
filename = 'EMG_BAND.mat';
save(filename, 'emg')
clear
