function [X,fitX,fes] = localSA(features,labels,X,fitX,fes)
D=size(features,2);
fun=@fitness;
T=10;
Tf=0.1;
B=0.97;
newX=X;
while T>Tf
    d=fix(rand*D+1);
    newX(d)=not(X(d));
    newfitX=fun(features,labels,newX,size(features,2));
    fes=fes+1;
    delta=newfitX-fitX;
    if delta>0
        if (rand<min(1,exp(-delta/T)))
            X=newX;
            fitX=newfitX;
            Tf=2*T; 
        end
    else
        X=newX;
        fitX=newfitX;
        Tf=2*T;       
    end
     T=B*T;
end
end