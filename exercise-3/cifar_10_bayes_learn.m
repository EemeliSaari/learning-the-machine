function [mu, sigma, p] = cifar_10_bayes_learn(F, labels)
%CIFAR_10_BAYES_LEARN Summary of this function goes here
%   Detailed explanation goes here

c = size(unique(labels),1);

mu_empty = zeros(c, 1);
sigma_empty = zeros(c, 1);
p_empty = zeros(c,1);

p_value = 1/c;

for class = 0 : c - 1 % number of classes.

    class_values = [];
    for i = 1 : size(F,1)
        if(labels(i) == class)
            class_values = [class_values, mean(F(i,:))]; 
        end
    end
    
    mu_val = double(mean(class_values));
    mu_empty(class + 1) = mu_val;

    sigma_val = double(std(double(class_values),1));
    sigma_empty(class+1) = sigma_val;

    display(class);
    
    p_empty(class+1) = p_value;
end

mu = mu_empty;
sigma = sigma_empty;
p = p_empty;

end
