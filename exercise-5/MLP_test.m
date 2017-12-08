%

%% Turn trdata into images

trimages = zeros(32, 32, 3, size(tr_data, 1));
for i = 1 : size(trimages,4)
    img_data = tr_data(i,:);
    image = zeros(32,32,3);
    image(:,:,1) = reshape(img_data(1:1024), [32 32])';
    image(:,:,2) = reshape(img_data(1025:2048), [32 32])';
    image(:,:,3) = reshape(img_data(2049:3072), [32 32])'; 
    trimages(:,:,:,i) = image;
    
end

%% Turn tr_labels to acceptable format for network

trlabels = zeros(size(tr_labels,1),10);
for i = 1 : size(trlabels,1)
    row = zeros(1,10);
    row(tr_labels(i)+1) = 1;
    trlables(i,:) = row;
end

%% Make different training sets

tr32 = zeros(size(tr_data,1),3);
for i = 1 : size(tr_data,1)
    tr32(i,:) = cifar_10_extract_features(tr_data(i,:), 32);
end

tr16 = zeros(size(tr_data,1),12);
for i = 1 : size(tr_data,1)
    tr16(i,:) = cifar_10_extract_features(tr_data(i,:), 16);
end

%% Train networks with different hiddenlayers and training data.

netIMG_10 = cifar_10_MLP_train(tr_data,trlables, 10);
netIMG_20 = cifar_10_MLP_train(tr_data,trlables, 20);

net32_10 = cifar_10_MLP_train(tr32, trlables, 10);
net32_20 = cifar_10_MLP_train(tr32, trlables, 20);

net16_10 = cifar_10_MLP_train(tr16, trlables, 10);
net16_20 = cifar_10_MLP_train(tr16, trlables, 20);
