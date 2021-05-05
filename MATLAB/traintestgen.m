train_label = zeros(98 * 5 * 5, 1);
test_label = zeros(490, 1);

num_train = 1:490:2450;
num_test = 1:98:490;

for i = 1:5
    train_label(num_train(i):num_train(i) + 489, :) = i;
    test_label(num_test(i):num_test(i) + 97, :) = i;
end

train = load('svmf/train.mat').train;
test = load('svmf/test.mat').test;


%process MAV
mavtr = train.mav;
mavte = test.mav;

mavte = mavte';
mav_test = [test_label cell2mat(mavte)];

save('svmf/test/mav.mat', 'mav_test')

mavtr = reshape(mavtr', 25, 1);
mav_train = [train_label cell2mat(mavtr)];

save('svmf/train/mav.mat', 'mav_train');

%process WL
wltr = train.wl;
wlte = test.wl;

wlte = wlte';
wl_test = [test_label cell2mat(wlte)];

save('svmf/test/wl.mat', 'wl_test')

wltr = reshape(wltr', 25, 1);
wl_train = [train_label cell2mat(wltr)];

save('svmf/train/wl.mat', 'wl_train');

%process VAR
vartr = train.var;
varte = test.var;

varte = varte';
var_test = [test_label cell2mat(varte)];

save('svmf/test/var.mat', 'var_test')

vartr = reshape(vartr', 25, 1);
var_train = [train_label cell2mat(vartr)];

save('svmf/train/var.mat', 'var_train');

%process ZC
zctr = train.zc;
zcte = test.zc;

zcte = zcte';
zc_test = [test_label cell2mat(zcte)];

save('svmf/test/zc.mat', 'zc_test')

zctr = reshape(zctr', 25, 1);
zc_train = [train_label cell2mat(zctr)];

save('svmf/train/zc.mat', 'zc_train');

%process SSC
ssctr = train.ssc;
sscte = test.ssc;

sscte = sscte';
ssc_test = [test_label cell2mat(sscte)];

save('svmf/test/ssc.mat', 'ssc_test')

ssctr = reshape(ssctr', 25, 1);
ssc_train = [train_label cell2mat(ssctr)];

save('svmf/train/ssc.mat', 'ssc_train');



