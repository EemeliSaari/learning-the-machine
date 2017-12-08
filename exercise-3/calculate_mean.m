function m = calculate_mean(X)
%CALCULATE_MEAN Summary of this function goes here
%   Detailed explanation goes here

val = 0;
for i = 1 : size(X,2)
    val = val + X(i,2);
    
end

m = val / size(X,2);

end

