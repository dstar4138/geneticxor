function [item] = Compare( item, parentScore, Matcher, T, ProbTest );
    count = 0;
    [m, n] = size(item);
        for i= 2:n
            if item(i)==Matcher(i-1)
                count=count+1;
            end
        end
    item(1,1)=count;
end
