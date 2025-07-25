function [sFeat,Sf,Nf,curve,gbest,ER,trial,islenenboyutlar,localsearchiseyaradi,localsearchiseyaramadi,andiseyaradi,andiseyaramadi,mutasyoniseyaradi,selected,unselected]=MBO(run,features,labels,N,T)
TargetErrorRate=100;
localsearchiseyaradi=0;
localsearchiseyaramadi=0;

andiseyaradi=0;
andiseyaramadi=0;

mutasyoniseyaradi=0;

fun=@fitness;
D=size(features,2);

fit=ones(1,N)*100;
ErrorRate = ones(1,N)*100;
pop=randi([0 1],N,D);

for i=1:N
    if sum(pop(i,:))==0
        pop(i,:)=randi([0 1],1,D);
    end
    [fit(i),ErrorRate(i)]=fun(features,labels,pop(i,:),D); 
end

fes=N;
curve=inf;

[gbest,gbestindex]=min(fit);
TargetErrorRate=ErrorRate(gbestindex);
gbestparams=pop(gbestindex,:);
curve(1)=gbest;

[fit, SortOrder]=sort(fit);
pop=pop(SortOrder,:);
[ErrorRate, SortOrderErrorRate]=sort(ErrorRate);



t=1;
trial=zeros(1,N);


islenenboyutlar=[];
unselected=zeros(1,D);
selected=zeros(1,D);

CR=N;
MT=N;

degismeyenlerisay=0;
degisti=0;

nc=N*0.5;
nm=N*0.5;

% while t <= T
while fes <= T*N
    
    if nc>=2*nm || nm>=2*nc || nc<3 || nm<3
        nc=N*0.5;
        nm=N*0.5;
    end
    
    
    
%     P=exp(-8*fit/WorstCost);
%     P=P/sum(P);
    
    
    % Crossover
    popc=zeros(nc,D);
    fitc=ones(1,nc)*1000;
    ErrorRatec = ones(1,nc)*1000;

    for k=1:2:nc-1

        i1=RouletteWheelSelection(fit);
        i2=RouletteWheelSelection(fit);  

        if isempty(i1)
            i1=randi(N);
        end
        if isempty(i2)
            i2=randi(N);
        end
        
        
        [popc(k,:),popc(k+1,:)]=Crossover(pop(i1,:),pop(i2,:));
                
        if sum(popc(k,:))==0
            popc(k,:)=randi([0 1],1,D);
        end        
        if sum(popc(k+1,:))==0
            popc(k+1,:)=randi([0 1],1,D);
        end
        
        [fitc(k),ErrorRatec(k)]=fun(features,labels,popc(k,:),D);
        [fitc(k+1),ErrorRatec(k+1)]=fun(features,labels,popc(k+1,:),D);
        fes=fes+2;      
    end
    
    ortcr=mean(fitc);  
    
    
    
    
    popm=zeros(nm,D);
    fitm=ones(1,nm)*1000;
    ErrorRatem = ones(1,nm)*1000;

    for k=1:nm
        
        % Select Parent
        i=randi([1 N]);
        
        
        % Perform Mutation
        popm(k,:)=Mutate(pop(i,:));
        
        
        if sum(popm(k,:))==0
            popm(k,:)=randi([0 1],1,D);
        end
        
        [fitm(k),ErrorRatem(k)]=fun(features,labels,popm(k,:),D);
        fes=fes+1;
        
        
        
    end
    
    ortmt=mean(fitm);  
    
    if ortcr<=ortmt
        nc=nc+1;
        nm=nm-1;
    else
        nm=nm+1;
        nc=nc-1;
    end
    
    % Create Merged Population
    pop=[pop
        popc
        popm]; %#ok
    
    fit=[fit fitc fitm];

    ErrorRate=[ErrorRate ErrorRatec ErrorRatem];
    
    % Sort Population
    
    [fit, SortOrder]=sort(fit);
    pop=pop(SortOrder,:);
    [ErrorRate, SortOrderErrorRate]=sort(ErrorRate);
        
    % Truncation
    pop=pop(1:N,:);
    fit=fit(1:N);
    ErrorRate=ErrorRate(1:N);
    
    % Store Best Solution Ever Found
    gbest=fit(1);
    gbestparams=pop(1,:);
    TargetErrorRate=ErrorRate(1);
    
    pop(N,:) = bireyuret(pop(N,:),gbestparams);
    if sum(pop(N,:))==0
            pop(N,:)=randi([0 1],1,D);
    end
        tempfitN=fit(N);
                
        [fit(N),ErrorRate(N)]=fun(features,labels,pop(N,:),D);
        fes=fes+1;
        
        if fit(N)<tempfitN
            localsearchiseyaradi=localsearchiseyaradi+1;
        else
            localsearchiseyaramadi=localsearchiseyaramadi+1;
        end
        
        sayilar=[2 3 4 5];
        h=fix(rand*4+1);
        
        tempand=and(pop(1,:),pop(sayilar(h),:));
        
        if sum(tempand)==0
        else
            [tempandfit,tempErrorRate]=fun(features,labels,tempand,D);
            fes=fes+1;
            
            if tempandfit<fit(1)
                andiseyaradi=andiseyaradi+1;
                fit(1)=tempandfit;
                ErrorRate(1)=tempErrorRate;
                pop(1,:)=tempand;
            else
                andiseyaramadi=andiseyaramadi+1;
            end
        end
        
    
    
    
    
    
    %     if CR>MT*2 || MT>CR*2
    %         CR=N;
    %         MT=N;
    %     end
    %
    %     if CR>=MT
    %         i1=RouletteWheelSelection(fit);
    %         i2=RouletteWheelSelection(fit);
    %         temp1=[];
    %         temp2=[];
    %
    %         [temp1,temp2]=Crossover(pop(i1,:),pop(i2,:));
    %
    %         if sum(temp1)==0
    %             temp1=randi([0 1],1,D);
    %         end
    %         if sum(temp2)==0
    %             temp2=randi([0 1],1,D);
    %         end
    %
    %
    %         temp1fit=fun(features,labels,temp1,D);
    %         temp2fit=fun(features,labels,temp1,D);
    %         fes=fes+2;
    %
    %         if temp1fit<=fit(i1)
    %             pop(i1,:)=temp1;
    %             fit(i1)=temp1fit;
    %             CR=CR+N;
    %         else
    %             CR=CR-1;
    %             trial(i1)=trial(i1)+1;
    %         end
    %
    %         if temp2fit<=fit(i2)
    %             pop(i2,:)=temp2;
    %             fit(i2)=temp2fit;
    %             CR=CR+N;
    %         else
    %             CR=CR-1;
    %             trial(i2)=trial(i2)+1;
    %         end
    %     else
    %         i3=randi([1 N]);
    %         temp3=[];
    %
    %         temp3=Mutate(pop(i3,:));
    %
    %         if sum(temp3)==0
    %             temp3=randi([0 1],1,D);
    %         end
    %
    %         temp3fit=fun(features,labels,temp3,D);
    %         fes=fes+1;
    %
    %         if temp3fit<=fit(i3)
    %             pop(i3,:)=temp3;
    %             fit(i3)=temp3fit;
    %             MT=MT+N;
    %         else
    %             MT=MT-1;
    %             trial(i3)=trial(i3)+1;
    %         end
    %
    %
    %     end
    
    %     if max(trial)>N
    %         asanlar=find(trial>N);
    %         asanlarsay=size(asanlar,2);
    %         for k=1:asanlarsay
    %             pop(asanlar(k),:)=bireyuret(pop(asanlar(k),:),gbestparams);
    %             if sum(pop(asanlar(k),:))==0
    %             pop(asanlar(k),:)=randi([0 1],1,D);
    %             end
    %             fit(asanlar(k))=fun(features,labels,pop(asanlar(k),:),D);
    %             fes=fes+1;
    %             trial(asanlar(k))=0;
    %         end
    %
    %     end
    
    
    %     [fit, SortOrder]=sort(fit);
    %     pop=pop(SortOrder,:);
    %
    %     if fit(1)<gbest
    %         gbestparams=pop(1,:);
    %         gbest=fit(1);
    %     end
    
    
    
    
    
    %         if rand<0.9
    %             [newgbestparams,newgbest,fes] = localsearch(features,labels,gbestparams,gbest,fes);
    %         else
    %             [newgbestparams,newgbest,fes] = localSA(features,labels,gbestparams,gbest,fes);
    %         end
    
    %         [newgbestparams,newgbest,fes] = localsearch(features,labels,gbestparams,gbest,fes);
    
    %     [newgbestparams,newgbest,fes] = localSA(features,labels,gbestparams,gbest,fes);
    %
    %         if newgbest < gbest
    %             gbestparams=newgbestparams;
    %             gbest=newgbest;
    %             pop(1,:)=gbestparams;
    %             fit(1)=gbest;
    %             localsearchiseyaradi=localsearchiseyaradi+1;
    %             fprintf('local search ise yaradi\n');
    %         else
    %          localsearchiseyaramadi=localsearchiseyaramadi+1;
    %
    %         end
    %
    
    
    %     [producedlocal,fes] = mylocal(fit(1:5),pop(1:5,:),features,labels,fes);
    
    
    
    
    
    
    
    curve(t)=gbest;
    t=t+1;
    fprintf('run=%d..iter=%d.. fes=%d.. fitness=%g.. ER=%g.. nc=%d.. nm=%d..trial=%d..\n',run,t,fes,gbest,TargetErrorRate,nc,nm,max(trial));
    
    
end

% Select features
Pos=1:D; Sf=Pos(gbestparams==1); Nf=length(Sf); sFeat=features(:,Sf);ER=TargetErrorRate;
end