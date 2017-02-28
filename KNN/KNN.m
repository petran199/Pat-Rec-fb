% % % % knn % % % %
clear all;clc;close all;
load apotForClassifyKnn
load featData
%randomize Data
rndm=randperm(size(X,1));

apotClsf=cell(size(apot,1),1);
for i=1:size(apot,1)
    %diaxwrismos dedomenwn
    trainData=X(rndm(1:140),apot{i});
    trainCl=Y(rndm(1:140));
    testData=X(rndm(141:end),apot{i});
    testCl=Y(rndm(141:end));
    %taxinomisi dedomenwn
    knn=knnclassify(testData,trainData,trainCl);
    %metrisi apodosis taxinomisis
    cp=classperf(knn,testCl);
    %apothikefsi dedomenwn sto cell
    apotClsf{i,1}=[num2str(i),')gia to deigma klasewn :',num2str(apot{i}),' ','knn Classification Rate(%) = ' num2str(cp.CorrectRate*100)];
    %ektipwsi tis posostiaias akriveias taxinomisis
%     disp([num2str(i),')gia to deigma klasewn :',num2str(unique(apot{i,1})),char(10)]);
%     disp(['knn Classification Rate(%) = ' num2str(cp.CorrectRate*100),char(10)]);
    
end
save('apotCorRateKnn.mat','apotClsf');