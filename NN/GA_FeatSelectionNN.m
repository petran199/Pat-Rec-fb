function val = GA_FeatSelectionNN( chr )
% load('featData.mat');
load('featDataNorm.mat');

chr=round(chr);
if length(chr)~=length(unique(chr))
    val=1000;
    return
end
X=X(:,chr);
% % kataskevi twn protipwn
y=zeros(2,length(Y));
for i=1:length(Y)
    y(Y(i),i)=1;
end
%randomize Data
rndm=randperm(size(X,1));

%kataskevi dedomenwn ekpedefsis kai dokimis
trainData=X(rndm(1:140),:)';
trainCl=y(:,rndm(1:140));
testData=X(rndm(141:end),:)';
testCl=y(:,rndm(141:end));
%kataskevi feedforward NN (2 Hidden 20 neurons)
net =newff(trainData,trainCl,[20 20]);%5);%
%ekpedefsi tou nevronikou
net.trainParam.show = NaN;
net.trainParam.showWindow = false;
net=train(net,trainData,trainCl);
%ipologismos twn exodwn toy nevronikou me eisodous ta dedomena dokimis
y_net=net(testData);
%ipologismos tis apodosis taxinomisis
[vals1,y_labels] = max(testCl);
[vals2,y_net_labels] = max(y_net);
cp = classperf(y_labels,y_net_labels);

val=1-cp.CorrectRate;
end


