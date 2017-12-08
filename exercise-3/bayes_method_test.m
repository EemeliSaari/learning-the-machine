%

%% Split the test data into different color spaces. Get the mu and sigma
%  values with the training data.

data_r = tr_data(:, 1:1024);
data_g = tr_data(:, 1025:2048);
data_b = tr_data(:, 2049:3072);

[mu_r, sig_r, p_r] = cifar_10_bayes_learn(data_r, tr_labels);
[mu_g, sig_g, p_g] = cifar_10_bayes_learn(data_g, tr_labels);
[mu_b, sig_b, p_b] = cifar_10_bayes_learn(data_b, tr_labels);

%% Combine them into one 10x1x3 matrix.

mu = cat(3, mu_r, mu_g, mu_b);
sig = cat(3, sig_r, sig_g, sig_b);
p = cat(3, p_r, p_g, p_b);

%% Classify every test_data.

class = cifar_10_bayes_classify(test_data, mu, sig, p);

%% Evaluate the results.
eval = cifar_10_evaluate(class,test_labels);

%% Compute the confusion matrix.

[C, order] = confusionmat(uint8(class), test_labels);

%% Plot the confusion matrix and analyse it.

axes = [0:.1:400];
norm_good_1 = normpdf(axes, mu(6,1,3), sig(6,1,3));
norm_good_2 = normpdf(axes, mu(1,1,3), sig(1,1,3));

plot(axes,norm_good_1); hold on;
plot(axes,norm_good_2);


