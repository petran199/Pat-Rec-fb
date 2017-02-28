% % RBF % %
clear all; clc; close all;
load featDataNorm
load apotForClassifyRBF
apotClsf=cell(size(apot,1),1);
% kataskevi twn protipwn
y=zeros(2,length(Y));
for i=1:length(Y)
    y(Y(i),i)=1;
end

%randomize Data
rndm=randperm(size(X,1));

for i=1:size(apot,1)
%kataskevi dedomenwn ekpedefsis kai dokimis
trainData=X(rndm(1:140),unique(apot{i,1}))';
trainCl=y(:,rndm(1:140));
testData=X(rndm(141:end),unique(apot{i,1}))';
testCl=y(:,rndm(141:end));
%kataskevi RBF
netrb=newrb(trainData,trainCl);
%ekpedefsi tou nevronikou
y_netrb=netrb(testData);
%ipologismos tis apodosis taxinomisis
[vals1,y_labels]=max(testCl);
[vals2,y_netrb_labels]=max(y_netrb);
cp=classperf(y_labels,y_netrb_labels);
%apothikefsi apotelesmatwn ston pinaka
apotClsf{i,1}=[num2str(i),')gia to deigma klasewn :',num2str(apot{i}),' ','RBF Classification Rate(%) = ' num2str(cp.CorrectRate*100)];
%ektipwsi tis posostiaias akriveias taxinomisis
% disp([num2str(i),')gia to deigma klasewn :',num2str(unique(apot{i,1}))]);
% disp(['RBF Classification Rate(%) = ' num2str(cp.CorrectRate*100),char(10)]);
end
save('apotCorRateRBF.mat','apotClsf');