clear all; close all; clc;
load('abu_airport_2.mat');
hyper_data = data;

hyper_data = (hyper_data-min(min(min(hyper_data))))/(max(max(max(hyper_data)))-min(min(min(hyper_data))));
figure; imshow(hyper_data(:,:,30),[]);
[spat1,spat2,spec] = size(hyper_data);
hyper_vector = zeros(spec,spat1*spat2);

for b = 1:1:spec
    hyper_vector(b,:) = reshape(hyper_data(:,:,b),1,spat1*spat2);
end

spectSings(:,1) = squeeze(hyper_data(46,40,:));

SMF_start = cputime;
mean_b = squeeze(mean(mean(hyper_data)))';
Cb = cov(double(hyper_vector'));
costMap_SMF = zeros(spat1,spat2,size(spectSings,2));
pixel = 0;
for i = 1:1:spat1
    for j = 1:1:spat2
pixel = pixel+1;
disp(pixel);
x = double(squeeze(hyper_data(i,j,:)))';
for k = 1:1:size(spectSigns,2)
    s = spectSigns(:,k);
    costMap_SMF(i,j,k) = ((s-mean_b)*(Cb\(x-mean_b)'))/((a-mean_b)*(Cb\(s-mean_b)'));
end
    end
end

        