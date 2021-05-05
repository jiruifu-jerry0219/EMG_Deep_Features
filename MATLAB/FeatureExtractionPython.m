clear
emg = load('EMG_BAND.mat');
data_set = emg.emg.data;
mav_train = {};
wl_train = {};
var_train = {};
ssc_train = {};
zc_train = {};

for i = 1:5
    start_idx = 1 + 6 * (i - 1);
    end_idx = 6 + 6 * (i - 1); 
    for j = 1:6
        idx0 = start_idx + (j - 1);
        trial = data_set{i, j}';
        win = 300;
        step = 100;
        obj = getEMGfeaturesAllData(trial, win, step);
        mav_ogi = obj.MAV';
        mav_train{i, j} = mav_ogi;       
        other = obj.TD;
        idx0 = 1:16:80;
        idx1 = 16:16:80;       
        wl_ogi = other(idx0(2):idx1(2), :)';
        wl_train{i, j} = wl_ogi;       
        var_ogi = other(idx0(3):idx1(3), :)';
        var_train{i, j} = var_ogi;        
        ssc_ogi = other(idx0(4):idx1(4), :)';
        ssc_train{i, j} = ssc_ogi;        
        zc_ogi = other(idx0(5):idx1(5), :)';
        zc_train{i, j} = zc_ogi;
        
    end
end


% mav_train = mav_train';
train_cell = reshape(zc_train', 30, 1);
train = cell2mat(train_cell);

key_p = 1:588:2940;

label = zeros(2940, 1);

for i = 1:length(key_p)
    label(key_p(i): key_p(i) + 587, :) = i;
end



emg_data = [train, label];
writematrix(emg_data,'emg_zc.csv')


