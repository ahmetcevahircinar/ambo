function [pop,boyutlar,dolular] = initialize(N,D)
pop=zeros(N,D);
for i=1:N
    for d=1:D
        if find(birolacaklar==d)
            pop(i,d)=1;
        elseif find(sifirolacaklar==d)
            pop(i,d)=0;
        else
            if rand() > 0.5
                pop(i,d)=1;
                
            end
        end
        
    end
end

end

