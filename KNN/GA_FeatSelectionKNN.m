function val = GA_FeatSelectionKNN( chr )
load('featData.mat');
% load('featDataNorm.mat');

chr=round(chr);
if length(chr)~=length(unique(chr))
    val=1000;
    return
end
X=X(:,chr);
rndm=randperm(size(X,1));
trainData=X(rndm(1:140),:);
trainCl=Y(rndm(1:140));
testData=X(rndm(141:end),:);
testCl=Y(rndm(141:end));
knn=knnclassify(testData,trainData,trainCl);
cp=classperf(knn,testCl);
val=1-cp.CorrectRate;
end


