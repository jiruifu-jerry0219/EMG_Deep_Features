clear
train_set = dir('svmf/train/*.mat'); 
test_set = dir('svmf/test/*.mat');

train_dir = ['svmf/train/'];
test_dir = ['svmf/test/'];

way = {'mav', 'wl', 'var', 'ssc', 'zc'};
cont = 1;
for i = 1:5
%     trainnames = fieldnames(train);
%     train = getfield([train_dir, train_set(i).name],trainnames{1});
    
    train_s = load([train_dir, train_set(i).name]);
    trainn = fieldnames(train_s);
    train = getfield(train_s, trainn{1});
    
    
    test_s = load([test_dir, test_set(i).name]);
    testn = fieldnames(test_s);
    test = getfield(test_s, testn{1});
    
    %Undirect method
    trainData = train(:, 2:17)';
    trainLabels = train(:, 1)';
    testData = test(:, 2:17)';
    testLabels = test(:, 1)';
    
    trainMin = min(trainData, [], 2);
    trainData = bsxfun(@minus, trainData, trainMin);
    trainMax = max(trainData, [], 2);
    trainData = bsxfun(@rdivide, trainData, trainMax);
    
    testData = bsxfun(@minus, testData, trainMin);
    testData = bsxfun(@rdivide, testData, trainMax);
    
%     c = cvpartition(trainLabels','KFold',5);
%     t = templateSVM('KernelFunction','gaussian');
%     MdlSV = fitcecoc(trainData', trainLabels','Learners',t, 'CVPartition',c);
%     ypred = kfoldPredict(MdlSV);
    
    predictions = classifySVMoffline(trainData, trainLabels, testData);
    
    
    figure(cont)
%     cfc = confusionchart(trainLabels', ypred);
    cfc = confusionchart(test(:, 1), predictions);
    cfm = cfc.NormalizedValues;
%     title(['Confusion chart for Cross Validation' ...
%         'with Feature type :', way(i)]);
    title(['Confusion chart for Testing' ...
        'with Feature type :', way(i)]);
    cfc.RowSummary = 'row-normalized';
    cfc.ColumnSummary = 'column-normalized';

    plot_name = ['Feature type_',way{i},'.png'];
    saveas(figure(cont),[pwd '/testing/' plot_name]);
    cont = cont + 1;
    
    %Directly classify method
end