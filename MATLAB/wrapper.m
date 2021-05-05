clear
mat = dir('subject1/*.mat'); 

action = {};

a1 = 1;
a2 = 1;
a3 = 1;
a4 = 1;
a5 = 1;

for i = 1:30
    if mat(i).name(7) == '1'
        data = load(['subject1/', mat(i).name]).data;
        action{1,a1} = data;
        a1 = a1 + 1;
        fprintf('a')
    end
    
    if mat(i).name(7) == '2'
        data = load(['subject1/', mat(i).name]).data;
        action{2,a2} = data;
        a2 = a2 + 1;
        fprintf('a')
    end
    
    if mat(i).name(7) == '3'
        data = load(['subject1/', mat(i).name]).data;
        action{3,a3} = data;
        a3 = a3 + 1;
        fprintf('a')
    end
    
    if mat(i).name(7) == '4'
        data = load(['subject1/', mat(i).name]).data;
        action{4,a4} = data;
        a4 = a4 + 1;
        fprintf('a')
    end
    
    if mat(i).name(7) == '5'
        data = load(['subject1/', mat(i).name]).data;
        action{5,a5} = data;
        a5 = a5 + 1;
        fprintf('a\n')
    end
    
end

emg = struct('data', {action});
filename = 'EMG_RAW.mat';
save(filename, 'emg')
clear

