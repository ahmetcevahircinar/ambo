function [X,fitX,fes] = localsearch(features,labels,X,fitX,fes)
tempX=X;
tempfitX=fitX;
fun=@fitness;
newX=X;
% D=size(features,2);
d=1;
D=randi([2 5]);
while d<D    
    newX(d)=not(X(d));    
    newfitX=fun(features,labels,newX,size(features,2));
    fes=fes+1;
    if newfitX<fitX
        X=newX;
        fitX=newfitX;
        fprintf('iyileþti adim=%d.. eski fitness=%g.. yenifitness=%g..\n',d,fitX,newfitX);
        d=D;
    else
%         fprintf('iyileþmedi adim=%d.. eski fitness=%g.. yenifitness=%g..\n',d,fitX,newfitX);
        X=tempX;
        fitX=tempfitX;
        d=d+1;
    end
end
end