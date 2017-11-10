%Testing the 1NN function.

%% Loads the test labels

conf_test = load('cifar-10-batches-mat/test_batch.mat');
test_labels = conf_test.labels;
test_data = conf_test.data;

%% Test the function against the same labels

test_amount = 100;

results = zeros(test_amount);

% read the data to workspace.
cifar_10_read_data();

for index = 1 : test_amount
   
    results(index) = cifar_10_1NN(test_data(index,:), test_data(1:test_amount,:), test_labels(1:test_amount));
    
end

% answer should be 1.
eval = cifar_10_evaluate(results, test_labels(1:test_amount));

%% Test 10 test images in full training set.

tr_results = zeros(13);

for n = 1 : 13  
    
    tr_results(n) = cifar_10_1NN(test_data(n,:), tr_data, tr_labels);
    display(n);

end

eval_tr = cifar_10_evaluate(tr_results, test_labels(1:13)); 