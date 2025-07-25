function y=Mutate(x)
    D=numel(x);
    j=fix(rand*D+1);   
    y=x;
    y(j)=1-x(j);
end