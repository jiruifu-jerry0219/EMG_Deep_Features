clear
emg = load('EMG_BAND.mat').emg.data;
head = 'cnn/';
folder1 = {'train/', 'test/', 'val/'};
type = {'mat/', 'csv/'};
root = {'1/', '2/', '3/', '4/', '5/'};
windowsize = 300;
stepsize = 100;


%Write to MAT file
for i = 1:5
    cont = 1;
    for j = 1:4
        filtEMG = emg{i, j};
        dataLength = size(filtEMG, 1);
        vec = windowsize:stepsize:dataLength;
        t = 0;
        for n = vec
            sampleEMG = filtEMG(n-windowsize+1:n, :);
            filename = [head, type(1), folder1(1), root(i), num2str(cont)];
            save(cell2mat(filename), 'sampleEMG');
            cont = cont + 1;
        end
    end
    
end

for i = 1:5
    cont = 1;

    filtEMG = emg{i, 5};
    dataLength = size(filtEMG, 1);
    vec = windowsize:stepsize:dataLength;
    t = 0;
    for n = vec
        sampleEMG = filtEMG(n-windowsize+1:n, :);
        filename = [head,type(1), folder1(2), root(i), num2str(cont)];
        save(cell2mat(filename), 'sampleEMG');
        cont = cont + 1;
    end
end

for i = 1:5
    cont = 1;

    filtEMG = emg{i, 6};
    dataLength = size(filtEMG, 1);
    vec = windowsize:stepsize:dataLength;
    t = 0;
    for n = vec
        sampleEMG = filtEMG(n-windowsize+1:n, :);
        filename = [head,type(1), folder1(3), root(i), num2str(cont)];
        save(cell2mat(filename), 'sampleEMG');
        cont = cont + 1;
    end
end


%Write to CSV file
for i = 1:5
    cont = 1;
    for j = 1:4
        filtEMG = emg{i, j};
        dataLength = size(filtEMG, 1);
        vec = windowsize:stepsize:dataLength;
        t = 0;
        for n = vec
            sampleEMG = filtEMG(n-windowsize+1:n, :);
            filename = [head,type(2), folder1(1), root(i), num2str(cont),'.csv'];
            writematrix(sampleEMG,cell2mat(filename));
            cont = cont + 1;
        end
    end
    
end

for i = 1:5
    cont = 1;

    filtEMG = emg{i, 5};
    dataLength = size(filtEMG, 1);
    vec = windowsize:stepsize:dataLength;
    t = 0;
    for n = vec
        sampleEMG = filtEMG(n-windowsize+1:n, :);
        filename = [head,type(2), folder1(2), root(i), num2str(cont),'.csv'];
        writematrix(sampleEMG,cell2mat(filename));
        cont = cont + 1;
    end
end

for i = 1:5
    cont = 1;

    filtEMG = emg{i, 6};
    dataLength = size(filtEMG, 1);
    vec = windowsize:stepsize:dataLength;
    t = 0;
    for n = vec
        sampleEMG = filtEMG(n-windowsize+1:n, :);
        filename = [head,   type(2), folder1(3), root(i), num2str(cont),'.csv'];
        writematrix(sampleEMG,cell2mat(filename));
        cont = cont + 1;
    end
end