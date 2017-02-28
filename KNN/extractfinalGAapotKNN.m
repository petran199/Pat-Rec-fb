clear all;close all;clc;
% fortwma apotelesmatwn apo Genetiko 
load GAapotelesmataKnn;

apotcpy=apotelesmata;

 apotmat=cell(16,1);
for i=1:size(apotcpy,1)
    for j=1:size(apotcpy,2)
        %ean ta apotelesmata periexoun diplotipa dimiourgise keno cell
        if length(apotcpy{i,j}) ~= length(unique(apotcpy{i,j}))
            apotcpy{i,j}=[];
        end
        
    end
    
    apotmat{i}=cell2mat(apotcpy(i,:));
    if ~isempty(apotmat{i})
        %vres gia oles tis monadikes times poses fores iparxoun sta vectors
        edges = unique(apotmat{i});
        counts = histc(apotmat{i}, edges);
        temp=[counts;edges]';
        % sorting fthinousa me ta adistixa indexes kratimena stin swsti
        % thesi
        [S,i1]=sort(temp,'descend');
        %o tdt periexei pleon tis megaliteres times  kai se poia indexes
        %adistixoun
        tdt=temp(i1(:,1),:);
        %ginete aftos o elegxos gia na min iparxoun sfalmata se periptwsi
        %pou iparxei mono ena vector se kapoio row tou cell
        if i==size(tdt,1)
            apotmat{i}=tdt(:,2)';
        else
        apotmat{i}=tdt(1:i+3,2)';
        end
    
    end
end
%petama to empty cells
apotmat(cellfun(@(apotmat) isempty(apotmat),apotmat))=[];
apot=apotmat;
save('apotForClassifyKnn.mat','apot');
clear i j i1 S counts edges tds tst temp apotcpy tdt apotmat