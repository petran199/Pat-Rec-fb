% % % % NN % % % %
load featDataNorm
load apotForClassifyNN
apotClsf=cell(size(apot,1),1);
% % kataskevi twn protipwn
y=zeros(2,length(Y));
for i=1:length(Y)
    y(Y(i),i)=1;
end
%randomize Data
rndm=randperm(size(X,1));
for i=1:size(apot,1)
%kataskevi dedomenwn ekpedefsis kai dokimis
trainData=X(rndm(1:140),apot{i})';
trainCl=y(:,rndm(1:140));
testData=X(rndm(141:end),apot{i})';
testCl=y(:,rndm(141:end));
%kataskevi feedforward NN (2 Hidden 20 neurons)
net =newff(trainData,trainCl,[20 20]);%5);%
%ekpedefsi tou nevronikou
net=train(net,trainData,trainCl);
%ipologismos twn exodwn toy nevronikou me eisodous ta dedomena dokimis
y_net=net(testData);
%ipologismos tis apodosis taxinomisis
[vals1,y_labels] = max(testCl);
[vals2,y_net_labels] = max(y_net);
cp = classperf(y_labels,y_net_labels);
%apothikefsi apotelesmatwn ston pinaka
apotClsf{i,1}=[num2str(i),')gia to deigma klasewn :',num2str(apot{i}),' ','NN Classification Rate(%) = ' num2str(cp.CorrectRate*100)];
%ektipwsi tis posostiaias akriveias taxinomisis
% disp([num2str(i),')gia to deigma klasewn :',num2str(unique(apot{i,1}))])
% disp(['NN Classification Rate(%) = ' num2str(cp.CorrectRate*100),char(10)]);
end
save('apotCorRateNN.mat','apotClsf');