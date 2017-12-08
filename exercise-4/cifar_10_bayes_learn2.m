function [MU_vector, SIGMA_vector] = cifar_10_bayes_learn2(F, labels, N)
%CIFAR_10_BAYES_LEARN2 Summary of this function goes here
%   Detailed explanation goes here

c = size(unique(labels), 1);
n = 1024/(N*N);

MU_empty = zeros(10,n*3);
SIGMA_empty = zeros(3*n,3*n,10);

for class = 0 : c - 1
    
    class_mean = [];
    for row = 1 : size(F,1)
        if(labels(row) == class)
            features = cifar_10_extract_features(F(row,:),N)';
            class_mean = [class_mean; features'];
        end
    end
    
    data = zeros(1,n*3);
    for i = 1 : size(data,2)
        data(i) = mean(class_mean(:,i));
    end
    MU_empty(class+1,:) = data;
    
    SIGMA = cov(class_mean);
    SIGMA_empty(:,:,class+1) =  SIGMA;
    
    display(class);
end

MU_vector = MU_empty;
SIGMA_vector = SIGMA_empty;

end

