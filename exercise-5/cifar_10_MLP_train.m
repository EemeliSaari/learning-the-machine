function net = cifar_10_MLP_train(trdata, trlabels, layers)
% Trains a Patternet with input data
%   Layers param determin the hiddenlayers size of the network

% Initialize the net
net = patternnet(layers);

% Set the divide parameters
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

% train the network
net = train(net, trdata', trlabels');

end

