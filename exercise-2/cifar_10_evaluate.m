function acc = cifar_10_evaluate(pred, gt)
% Computing classification accuracy for predicted labels.
%   Counts the amount of matched in two vectors.   
ind = uint64(size(pred,1));

counter = uint64(0);
for i = 1 : ind
    if (pred(i) == gt(i))
        counter = counter + 1;
    end
end

acc = double(counter)/double(ind);

end

