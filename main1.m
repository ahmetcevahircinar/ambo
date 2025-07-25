clc, clear all
% datasets={'Breastcancer','BreastEW','CongressEW','ILPD','ionosphere','Lymphography','SonarEW','SpectEW','Tic-tac-toe','WineEW','Zoo'};
%Breastcancer
%CongressEW
%ILPD

datasets={'BreastEW','ionosphere','Lymphography','SonarEW','SpectEW','Tic-tac-toe','WineEW','Zoo'};

maxrun=30;

for p=2:2
    load(strcat('./datasets/',datasets{p},'.mat'));
    [preserved]=preservedolustur(features,labels);
    D=size(features,2);
    for d=1:D
        toplamlar(d)=sum(preserved(:,d));
    end
    birli=zeros(1,D);
    ikili=zeros(1,D);
    uclu=zeros(1,D);
    dortlu=zeros(1,D);
    besli=zeros(1,D);
    sifirli=zeros(1,D);
    for d=1:D
        switch toplamlar(d)
            case 5
                besli(d)=1;
            case 4
                dortlu(d)=1;
            case 3
                uclu(d)=1;
            case 2
                ikili(d)=1;
            case 1
                birli(d)=1;
            case 0
                sifirli(d)=1;
            otherwise
        end
    end
    
    if sum(besli)==0
        besli=or(besli,dortlu);
        besli=double(besli);
    end
    
    
    
    if sum(dortlu)==0
        dortlu=or(uclu,dortlu);
        dortlu=double(dortlu);
        
        if sum(besli)==0
            besli=or(besli,dortlu);
            besli=double(besli);
        end
        
    end
    
    dortlu=or(besli,dortlu);
    dortlu=double(dortlu);
    
    uclu=or(uclu,dortlu);
    uclu=double(uclu);
    
    ikili=or(uclu,ikili);
    ikili=double(ikili);
    
    birli=or(birli,ikili);
    birli=double(birli);
    
    preserved2=[birli;ikili;uclu;dortlu;besli];
    XXX=ones(1,D);
    allpreserved=[XXX;preserved;preserved2];
    
    
    for f=1:11
        for r=1:maxrun
            preservedfitness=fitness(features,labels,allpreserved(f,:));
            Table(r,f)=preservedfitness;
            save(strcat('./results/',datasets{p},'-komple-preserved-',int2str(f),'.mat'),'Table');
        end
    end
    
end



