function f = cifar_10_extract_features(x, N)
%CIFAR_10_EXTRACT_FEATURES Summary of this function goes here
%   Detailed explanation goes here

n = 1024 / (N*N);

results = zeros(n, 3);

f_r = x(1:1024);
f_g = x(1025:2048);
f_b = x(2049:3072);

step = 1024/n;
    index = 1;
for i = 1 : n
        
    m_r = mean(f_r(index:index+step-1));
    m_g = mean(f_g(index:index+step-1));
    m_b = mean(f_b(index:index+step-1));
    
    index = index + step;
    
    results(i,1) = m_r;
    results(i,2) = m_g;
    results(i,3) = m_b;
end

if(N == 32)
    f = results;
else
    temp = results';
    f = temp(:)';
end

end

