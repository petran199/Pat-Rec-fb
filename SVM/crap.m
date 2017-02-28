% clear all;clc;close all;
load apotForClassifySVM
load featData
apotClsfpercent=cell(size(apot,1),1);
sum=0;
rndm=randperm(size(X,1));
for i=1:size(apot,1)
    for p=1:50
    %eisagwgi dedomewn
    X1 = X(rndm(:),apot{i});
    Y1 = Y(rndm(:));
    %diaxorismos dedomenwn
    P = cvpartition(Y1,'Holdout',0.20);
    %dimiourgia toy taixnomiti
    svmStruct = svmtrain(X1(P.training,:),Y1(P.training),'showplot',false);
    %taxinomisi
    C = svmclassify(svmStruct,X1(P.test,:),'showplot',false);
    
%     errRate = sum(Y1(P.test)~= C)/P.TestSize;  
        correct=0;Creal=Y1(P.test);
    for j=1:length(C)
        if Creal(j)==C(j)
        correct=correct+1;
        end
    end
    CRate = correct/P.TestSize;  
    sum=sum+ CRate*100;

  
    end
    
    sum=sum/50;
    apotClsfpercent{i,1}=sum;
    sum=0;
end