% % SVM % %
clear all;clc;close all;
load apotForClassifySVM
load featData
apotClsf=cell(size(apot,1),1);
%randomize Data
rndm=randperm(size(X,1));
for i=1:size(apot,1)
    %eisagwgi dedomewn
    X1 = X(rndm(:),apot{i});
    Y1 = Y(rndm(:));
    %diaxorismos dedomenwn
    P = cvpartition(Y1,'Holdout',0.20);
    %dimiourgia toy taixnomiti
    svmStruct = svmtrain(X1(P.training,:),Y1(P.training),'showplot',false);
    %taxinomisi
    C = svmclassify(svmStruct,X1(P.test,:),'showplot',false);
    %metrisi apodosis taxinomiti
%     correct=0;Creal=Y1(P.test);
%     for j=1:length(C)
%         if Creal(i)==C(i)
%         correct=correct+1;
%         end
%     end
%     CRate = correct/P.TestSize;
    %to adistixo error rate
    errRate = sum(Y1(P.test)~= C)/P.TestSize;  
        
 
    %apothikefsi dedomenwn sto cell
    apotClsf{i,1}=[num2str(i),')gia to deigma klasewn :',num2str(apot{i}),' ','SVM Classification Rate(%) = ' num2str((1-errRate)*100)];
    %ektipwsi tis posostiaias akriveias taxinomisis
%     disp([num2str(i),')gia to deigma klasewn :',num2str(unique(apot{i,1})),char(10)]);
%     disp(['SVM Classification Rate(%) = ' num2str((1-errRate)*100),char(10)]);
%      disp(['SVM Classification ErrorRate(%) = ' num2str(errRate*100),char(10)]);
    
end
% save('apotCorRateSVM.mat','apotClsf');