% % kanonikopoiisi % %
clear all;close all;clc;
load('featData.mat');

mx=max(max(X,1));

for i=1:length(X)
    for j=1:16
        X(i,j)=X(i,j)/mx(j);
    end
end
clear i j mx
save featDataNorm.mat