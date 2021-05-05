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
    for j = 1:5
        idx0 = start_idx + (j - 1);
        trial = data_set{i, j}';
        win = 300;
        step = 100;
        obj = getEMGfeaturesAllData(trial, win, step);
        mav_ogi = obj.MAV';
%         mav_pca = pca(mav_ogi);
%         mav_fin = mav_pca(1:2, :);
        mav_train{i, j} = mav_ogi;
        
        other = obj.TD;
        idx0 = 1:16:80;
        idx1 = 16:16:80;
        
        wl_ogi = other(idx0(2):idx1(2), :)';
%         wl_pca = pca(wl_ogi);
%         wl_fin = wl_pca(1:2,:);
        wl_train{i, j} = wl_ogi;
        
        var_ogi = other(idx0(3):idx1(3), :)';
%         var_pca = pca(var_ogi);
%         var_fin = var_pca(1:2, :);
        var_train{i, j} = var_ogi;
        
        ssc_ogi = other(idx0(4):idx1(4), :)';
%         ssc_pca = pca(ssc_ogi);
%         ssc_fin = ssc_pca(1:2, :);
        ssc_train{i, j} = ssc_ogi;
        
        
        zc_ogi = other(idx0(5):idx1(5), :)';
%         zc_pca = pca(zc_ogi);
%         zc_fin = zc_pca(1:2, :);
        zc_train{i, j} = zc_ogi;
        
    end
end

mav_test ={};
wl_test = {};
var_test = {};
wl_test = {};
ssc_test = {};
zc_test = {};

for i = 1:5
    start_idx = 1 + 6 * (i - 1);
    end_idx = 6 + 6 * (i - 1); 
    idx0 = start_idx + (j - 1);
    trial = data_set{i, 6}';
    win = 300;
    step = 100;
    obj = getEMGfeaturesAllData(trial, win, step);
    mav_ogi = obj.MAV';
%         mav_pca = pca(mav_ogi);
%         mav_fin = mav_pca(1:2, :);
    mav_test{i} = mav_ogi;

    other = obj.TD;
    idx0 = 1:16:80;
    idx1 = 16:16:80;

    wl_ogi = other(idx0(2):idx1(2), :)';
%         wl_pca = pca(wl_ogi);
%         wl_fin = wl_pca(1:2,:);
    wl_test{i} = wl_ogi;

    var_ogi = other(idx0(3):idx1(3), :)';
%         var_pca = pca(var_ogi);
%         var_fin = var_pca(1:2, :);
    var_test{i} = var_ogi;

    ssc_ogi = other(idx0(4):idx1(4), :)';
%         ssc_pca = pca(ssc_ogi);
%         ssc_fin = ssc_pca(1:2, :);
    ssc_test{i} = ssc_ogi;


    zc_ogi = other(idx0(5):idx1(5), :)';
%         zc_pca = pca(zc_ogi);
%         zc_fin = zc_pca(1:2, :);
    zc_test{i} = zc_ogi;
        
end
    




%     mav(6:6:30, :) = [];
%     wl(6:6:30, :) = [];
%     var(6:6:30, :) = [];
%     ssc(6:6:30, :) = [];
%     zc(6:6:30, :) = [];

 



% label_test = {'1', '2', '3', '4', '5', '6'}';
% label_train = {'1', '1', '1', '1', '1', '1', ...
%     '2', '2', '2', '2', '2', '2', ...
%     '3', '3', '3', '3', '3', '3', ... 
%     '4', '4', '4', '4', '4', '4', ...
%     '5', '5', '5', '5', '5', '5'}';

% test = struct('label', {label_test}, 'mav', {mav_t}, 'wl', {wl_t}, ...
%     'var', {var_t}, 'ssc', {ssc_t}, 'zc', {zc_t});
% train = struct('label', {label_train}, 'mav', {mav}, ...
%     'wl', {wl}, 'var', {var}, 'ssc', {ssc}, 'zc', {zc});

% holder = {mav wl var ssc zc};

% name = {'mav.mat' 'wl.mat' 'var.mat' 'ssc.mat' 'zc.mat'; ...
%     'mav_t.mat' 'wl_t.mat' 'var_t.mat' 'ssc_t.mat' 'zc_t.mat'};
% train = {mav, wl, var, ssc, zc};
train = struct('mav', {mav_train}, 'wl', {wl_train}, 'var', ...
    {var_train}, 'zc', {zc_train}, 'ssc', {ssc_train});

test = struct('mav', {mav_test}, 'wl', {wl_test}, 'var', {var_test}, ...
    'zc', {zc_test}, 'ssc', {ssc_test});


save('svmf/train.mat', 'train');
save('svmf/test.mat', 'test');

clear

