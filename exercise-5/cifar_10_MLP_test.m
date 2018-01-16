function c = cifar_10_MLP_test(x, net)
% Classifies the input data x with network
%   input data x needs to acceptable to the net
%   returns c as classes nx1 vector

classes = zeros(size(x,1),1);

for i = 1 : size(x,1)
    input = double(x(i,:));
    output = net(input');
    
    % Finds the best match
    classes(i) = find(output == max(output)) - 1;
    disp(i)
end
c = classes;
end

