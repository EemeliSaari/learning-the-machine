function f = cifar_10_features(x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

results = zeros(1,3);

f_r = x(1:1024);
f_g = x(1025:2048);
f_b = x(2049:3072);

results(1) = mean(f_r);
results(2) = mean(f_g);
results(3) = mean(f_b);
    
f = results;

end

