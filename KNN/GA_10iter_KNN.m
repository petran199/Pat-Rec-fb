   close all; clc; clear all;

apotelesmata=cell(16,10);
for i=4:16
    for j=1:10
    LB=ones(1,i);
    UB=ones(1,i)*16;
    NumOfVars = i;
    options=gaoptimset('PopulationSize',200,'EliteCount',2,'CrossoverFraction',0.8,'Generations',200,'PlotFcns',{@gaplotbestf});
    FitnessFcn  = @(x)GA_FeatSelectionKNN(x);
    [x, fval, exitflag, output] = ga(FitnessFcn,NumOfVars,[],[],[],[],LB,UB,[],options);
    apotelesmata{i-3,j}=round(x);
    end
end

save('GAapotelesmataKnn.mat','apotelesmata');