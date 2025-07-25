function [fitness,ER]=fitness(feat,label,X,D)
k=5; 
kfold=5;
AF=size(feat,2);
[fitness,ER]=jwrapperKNN(feat(:,X==1),label,k,kfold,AF);
end
function [FF2,ER]=jwrapperKNN(feat,label,k,kfold,AF)
Model=fitcknn(feat,label,'NumNeighbors',k,'Distance','euclidean'); 
C=crossval(Model,'KFold',kfold);
ER=kfoldLoss(C);
SF=size(feat,2);
FF2=(0.99*ER)+(0.01*(SF/AF));
end







