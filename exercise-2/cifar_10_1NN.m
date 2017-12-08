function label = cifar_10_1NN(x, trdata, trlabels)
% One Nearest Neighbour function.
%   Calculates the euclidean distance and picks the closest match.

% Calculate the maximum euclidean distance to initialise the
% comparison.
eucli_sum = 0;
for index = 1 : size(x,2)
    % uint8 values can be max 255.
    eucli_sum = 255^2;
end
max_eucli = sqrt(eucli_sum);

dist_label = 0;
dist = max_eucli;

for index = 1 : size(trdata,1)
    
    eucli_dist = 0;
    for column = 1 : size(trdata,2)    
        eucli_dist = eucli_dist + (double(x(column)) - double(trdata(index,column)))^2; 
    end
    eucli_dist = sqrt(eucli_dist);
    
    % compare if the value is closer or not.
    if(eucli_dist < dist)
        dist = eucli_dist;
        dist_label = trlabels(index);
    end
        
end

label = dist_label;

end


