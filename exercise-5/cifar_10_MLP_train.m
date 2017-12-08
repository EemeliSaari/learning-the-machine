function net = cifar_10_MLP_train(trdata, trlabels, layers)
%CIFAR_10_MLP_TRAIN Summary of this function goes here
%   Detailed explanation goes here

net = patternnet(layers);
net = train(net, trdata', trlabels');

end

