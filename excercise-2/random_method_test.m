% Testing cifar_10_rand() function.

%% Loads the test labels
conf_test = load('cifar-10-batches-mat/test_batch.mat');
test_labels = conf_test.labels;

cifar_10_read_data();

%% Test how randomly picked labels accuracy.

rand_labels = zeros(size(test_labels));

for index = 1 : size(test_labels,1)
   
    rand_labels(index) = cifar_10_rand(test_labels);
 
end

evaluated = cifar_10_evaluate(rand_labels,test_labels);