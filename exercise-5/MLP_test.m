% Cifar-10 with Matlabs shallow neural network Patternnet

%% Read the data to workspace

% with new workspace
%cifar_10_read_data();

% with old workspace with trained network etc.
load('exercise5_workspace.mat');

%% Turn tr_labels to acceptable format for network

trlabels = zeros(size(tr_labels,1),10);
for i = 1 : size(trlabels,1)
    row = zeros(1,10);
    row(tr_labels(i)+1) = 1;
    trlabels(i,:) = row;
end

%% Make different training sets

tr_data = double(tr_data);

tr32 = zeros(size(tr_data,1),3);
tr16 = zeros(size(tr_data,1),12);
for i = 1 : size(tr_data,1)
    tr32(i,:) = cifar_10_extract_features(tr_data(i,:), 32);
    tr16(i,:) = cifar_10_extract_features(tr_data(i,:), 16);

end

%% Make different test sets to match training sets

te32 = zeros(size(te_data,1),3);
te16 = zeros(size(te_data,1),12);
for i = 1 : size(te_data,1)
   te32(i,:) = cifar_10_extract_features(te_data(i,:), 32);
   te16(i,:) = cifar_10_extract_features(te_data(i,:), 16); 
end

%% Train networks with different hiddenlayers and training data.

netIMG_10 = cifar_10_MLP_train(tr_data, trlabels, 10);
netIMG_20 = cifar_10_MLP_train(tr_data, trlabels, 20);

net32_10 = cifar_10_MLP_train(tr32, trlabels, 10);
net32_20 = cifar_10_MLP_train(tr32, trlabels, 20);

net16_10 = cifar_10_MLP_train(tr16, trlabels, 10);
net16_20 = cifar_10_MLP_train(tr16, trlabels, 20);

%% Classify test data with each networks 

IMG_10_class = cifar_10_MLP_test(te_data, netIMG_10);
IMG_20_class = cifar_10_MLP_test(te_data, netIMG_20);

class_32_10 = cifar_10_MLP_test(te32, net32_10);
class_32_20 = cifar_10_MLP_test(te32, net32_20);

class_16_10 = cifar_10_MLP_test(te16, net16_10);
class_16_20 = cifar_10_MLP_test(te16, net16_20);

%% Evaluate each networks accuracy.

IMG_10_eval = cifar_10_evaluate(IMG_10_class,te_labels); % 0.4051
IMG_20_eval = cifar_10_evaluate(IMG_20_class,te_labels); % 0.4307

eval_32_10 = cifar_10_evaluate(class_32_10,te_labels); % 0.2511
eval_32_20 = cifar_10_evaluate(class_32_20,te_labels); % 0.2538

eval_16_10 = cifar_10_evaluate(class_16_10,te_labels); % 0.4006
eval_16_20 = cifar_10_evaluate(class_16_20,te_labels); % 0.4307

%% Plot the accuracys

evals = [IMG_10_eval IMG_20_eval eval_32_10 eval_32_20...
         eval_16_10 eval_16_20];
     
figure(1)
plot(evals);