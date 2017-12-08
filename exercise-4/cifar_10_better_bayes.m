function c = cifar_10_better_bayes(f, MU, SIGMA, N)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

c_empty = zeros(size(f,1),1);

for q = 1 : size(f,1)
    
    features = cifar_10_extract_features(f(q,:),N);

    probs = 0;
    best = 0;
    for i = 1 : 10
        
        SIGMA_i = SIGMA(:,:,i);
        MU_i = MU(i,:);
        prob = mvnpdf(features, MU_i, SIGMA_i);
        
        if(probs < prob)
            probs = prob;
            best = i;
        end
    end
    
    c_empty(q) = best - 1;
    display(q);
end

c = c_empty;

end

