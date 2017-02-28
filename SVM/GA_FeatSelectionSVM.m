function val = GA_FeatSelectionSVM( chr )
load('featData.mat');
% load('featDataNorm.mat');

chr=round(chr);
if length(chr)~=length(unique(chr))
    val=1000;
    return
end
X=X(:,chr);
rndm=randperm(size(X,1));
%eisagwgi dedomewn
    X1 = X(rndm(:),:);
    Y1 = Y(rndm(:));
    %diaxorismos dedomenwn
    P = cvpartition(Y1,'Holdout',0.20);
    %dimiourgia toy taixnomiti
    svmStruct = svmtrain(X1(P.training,:),Y1(P.training),'kktviolationlevel',0.05)%,'showplot',false);
    %taxinomisi
%     options.MaxIter = 100000;
    C = svmclassify(svmStruct,X1(P.test,:))%,'showplot',true);
    errRate = sum(Y1(P.test)~= C)/P.TestSize; 
%     correct=0;Creal=Y1(P.test);
%     for j=1:length(C)
%         if Creal(j)==C(j)
%         correct=correct+1;
%         end
%     end
%     CRate = correct/P.TestSize;
    val=errRate;
end


