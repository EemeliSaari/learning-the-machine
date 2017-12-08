function c = cifar_10_bayes_classify(f, mu, sig, p)
%CIFAR_10 BAYES CLASSIFY Summary of this function goes here
%   Detailed explanation goes here
c_empty = zeros(size(f,1),1);

for q = 1 : size(f,1)
    f_mu = cifar_10_features(f(q,:));
    
    r_mu = f_mu(1);
    g_mu = f_mu(2);
    b_mu = f_mu(3);

    probs = 0;
    best = 0;
    for i = 1 : 10
    
        prob_r = normpdf(r_mu, mu(i,1,1), sig(i,1,1));
        prob_g = normpdf(g_mu, mu(i,1,2), sig(i,1,2));
        prob_b = normpdf(b_mu, mu(i,1,3), sig(i,1,3));
    
        prob = prob_r * prob_g * prob_b * p(i,1,1);
        
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

