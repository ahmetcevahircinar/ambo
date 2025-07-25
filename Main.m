
clc, clear
datasets={'l1','l2','l3','l4','l5','l6','l7','l8'}; % maxrun 20 fes 5000 pop 50
%datasets={'m1','m2','m3','m4','m5','m6','m7','m8'}; % maxrun 10 fes 20000 pop 100
%datasets={'h1','h2','h3','h4','h5'}; % maxrun 10 fes 20000 pop 100
N=50; 
T=100;
maxrun=1;

for p=8:8
    load(strcat('./datasets/',datasets{p},'.mat'));    
    komple=[];
    convergences=[];
    localsayilar=zeros(1,maxrun);
    mutasyonsayilar=zeros(1,maxrun);
    trial=[];
    selected=[];
    unselected=[];
    for r=1:maxrun
        [sFeat,Sf,Nf,curve,gbest,ER,trial,islenenboyutlar,localsearchiseyaradi,localsearchiseyaramadi,andiseyaradi,andiseyaramadi,mutasyoniseyaradi,selected,unselected]=MBO(r,features,labels,N,T);
        komple(r,1:Nf+4)=[r gbest ER Nf Sf];
        curvesize=size(curve,2);
        convergences(r,1:curvesize)=curve;
        localsayilar(r,1:4)=[localsearchiseyaradi localsearchiseyaramadi andiseyaradi andiseyaramadi];
        mutasyonsayilar(r)=mutasyoniseyaradi;        
        trial(r,:)=trial;
        selected(r,:)=selected;
        unselected(r,:)=unselected;
    end
    save(strcat('./results/',datasets{p},'-komple.mat'),'komple');
    save(strcat('./results/',datasets{p},'-convergences.mat'),'convergences');
    save(strcat('./results/',datasets{p},'-trial.mat'),'trial');
    save(strcat('./results/',datasets{p},'-selected.mat'),'selected');
    save(strcat('./results/',datasets{p},'-unselected.mat'),'unselected');
    save(strcat('./results/',datasets{p},'-localsayilar.mat'),'localsayilar');
    save(strcat('./results/',datasets{p},'-mutasyonsayilar.mat'),'mutasyonsayilar');
   
    
end
