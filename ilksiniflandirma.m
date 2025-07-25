datasets={'Breastcancer','BreastEW','CongressEW','ILPD','ionosphere','Lymphography','SonarEW','SpectEW','Tic-tac-toe','WineEW','Zoo'};
load(strcat('./datasets/',datasets{5},'.mat'));
% X=ones(1,size(features,2));
% load('sapmayagorebirey.mat');
% load('lassostd.mat');
% B = lasso(features,labels);
% load('elm0birey.mat');
% load('elm1birey.mat');
% load('elm0-or-elm1-birey.mat');
load('54321.mat');
allfeaturesfitness=fitness(features,labels,X);
for r=1:30
    allfeaturesfitness=fitness(features,labels,X);
    Table(r)=allfeaturesfitness;
end
Table=Table';



