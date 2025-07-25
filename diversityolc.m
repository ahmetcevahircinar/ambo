function [diversityolcegi] = diversityolc(pop)
N=size(pop,1);
for i=1:N
    for j=1:N
        diversityolcegi(i,j)=pdist2(pop(i,:),pop(j,:),'hamming');
    end
    
end
end

