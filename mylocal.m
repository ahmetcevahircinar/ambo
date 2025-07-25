function [x,fes] = mylocal(fit,pop,features,labels,fes)
D=size(pop,2);
fun=@fitness;
    sss=[2	3	5	11	15	16	17	24	27]
    Pos=1:D; 
    Sf1=Pos(pop(1,:)==1)
    Sf2=Pos(pop(2,:)==1)
    Sf3=Pos(pop(3,:)==1)
    Sf4=Pos(pop(4,:)==1)
    Sf5=Pos(pop(5,:)==1)
    
      
    sum(pop)
    sum(pop')
    
    sss
    
    tempand=and(pop(1,:),pop(2,:))
    D1 = pdist2(pop(1,:),pop(2,:),'hamming')
    D2 = pdist2(pop(1,:),pop(1,:),'hamming')
    D3 = pdist2(zeros(1,D),ones(1,D),'hamming')
    tempandfit=fun(features,labels,tempand,D)
    fes=fes+1;
    



end

