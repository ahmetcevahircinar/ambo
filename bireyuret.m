function [worst] = bireyuret(worst,best)
D=size(worst,2);
type=fix(rand*9+1);
switch type
    case 1
        worst=Mutate(worst);
    case 2
        worst=and(randi([0 1],1,D),worst);
    case 3
        worst=or(randi([0 1],1,D),worst);
    case 4
        worst=xor(randi([0 1],1,D),worst);
    case 5
        worst=randi([0 1],1,D);
    case 6
        worst=and(best,worst);
    case 7
        worst=or(best,worst);
    case 8
        worst=xor(best,worst);
    case 9
        worst=Mutate(best);
end
end

