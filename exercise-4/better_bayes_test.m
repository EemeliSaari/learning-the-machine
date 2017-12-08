%

%% Load previous exercise workspace

cifar_10_read_data();

%% Making a model with covariance in mind.

[MU, SIGMA] = cifar_10_bayes_learn2(tr_data,tr_labels, 32);

%% Testing the new not-naive classifier

class_better = cifar_10_better_bayes(test_data, MU, SIGMA);

%% Evaluate the results

eval_better = cifar_10_evaluate(class_better,test_labels);

%% Make a model with more features

[MU32, SIGMA32] = cifar_10_bayes_learn2(tr_data,tr_labels, 32);
[MU16, SIGMA16] = cifar_10_bayes_learn2(tr_data,tr_labels, 16);
[MU8, SIGMA8] = cifar_10_bayes_learn2(tr_data,tr_labels, 8);
[MU4, SIGMA4] = cifar_10_bayes_learn2(tr_data,tr_labels, 4);

%% Classify the test data with the different models

class32 = cifar_10_better_bayes(test_data, MU32, SIGMA32, 32);
class16 = cifar_10_better_bayes(test_data, MU16, SIGMA16, 16);
class8 = cifar_10_better_bayes(test_data, MU8, SIGMA8, 8);
class4 = cifar_10_better_bayes(test_data, MU4, SIGMA4, 4);


%% Evaluate performance of each model

eval32 = cifar_10_evaluate(class32, test_labels);
eval16 = cifar_10_evaluate(class16, test_labels);
eval8 = cifar_10_evaluate(class8, test_labels);
eval4 = cifar_10_evaluate(class4, test_labels);

%% Plot the accuracy differences

d = [eval32 eval16 eval8 eval4];
figure;
plot(d);