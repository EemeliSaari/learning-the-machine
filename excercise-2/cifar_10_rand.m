function label = cifar_10_rand(inputData)
% Returns random label from inputData
%   Picks random using Matlabs randi() function.
dx = size(inputData,1);
dy = size(inputData,2);

if(dx ~= 1 && dy ~= 1)
    label = inputData(randi(dx),randi(dy));

elseif(dx > dy)
    label = inputData(randi(dx));

elseif(dx < dy)
    label = inputData(randi(dy));

else
    label = inputData;
end

end

