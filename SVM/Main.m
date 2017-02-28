clear all ; close all; clc;

%     load featData.mat;
% 
%    load apotForClassifySVM
%% trexei 50 epanalipseis gia na vrei to meso correct rate gia ta kathe features
    crap;
    rndm=randperm(size(X,1));
    
    X1 = X(rndm(:),apot{7});
    Y1 = Y(rndm(:));
%     %diaxorismos dedomenwn
    P = cvpartition(Y1,'Holdout',0.20);
%     %dimiourgia toy taixnomiti
    svmStruct = svmtrain(X1(P.training,:),Y1(P.training),'showplot',false);
%     %taxinomisi
% feature me tin seira 1-2-4-9-10-12-13-14-15-16

    TstAntras=[];
    
    TstGineka=[];
   
   
    
 %cnters  
    k=0;
    o=0;
    for i=1:11
         C = svmclassify(svmStruct,Tstwman,'showplot',false);
        if C==1
            o = o+1;
        else k=k+1;
        end
    end
if k > o
    disp('To deigma anagnwristike ws Antras');
else 
    disp('To deigma anagnwristike ws Ginaika');
end
clear i o k rndm