%Par1 parent 1
%Par2 parent 2
%numCross number of time to cross over.  if = -1, then randomly decide
function [X] = CrossOver(Par1, Par2, vecLength, numCross)
    %initialize Crossover child
    X = Par1;
   
    if numCross == -1 
        %randomly decide number of crossovers
        %select at random 
        random = rand(vecLength);
    else
        %n number of crossovers            
        %select numCross number of random place to cross over
        
        %cannot generate the same number twice
        randomCrossIndex = zeros(numCross);
        for k = 1 : numCross
            temp = sort(ceil(vecLength*rand(1)));
            if ismember(randomCrossIndex(k), temp)
                k=k-1;
            else 
                randomCrossIndex(k) = temp;
            end %if
        end %k loop
        
        %generate change condition or not
        random = zeros(1,17);
        swap = false;
        for j = 1 : vecLength
            %to cross or not to cross
            if ~ismember(randomCrossIndex, j)
                swap = ~swap;
            end %if
            random(j) = swap;
        end %j loop
    end %if numCross
    
    %perform crossover by either if statements above.
    %if number of crossover specified, use 0 at 0% and 1 as 100% crossing
    for i = 2:vecLength
        if random(i) < .5
            X(i) = Par1(i);
        else
            X(i) = Par2(i);
        end % if random
    end %i loop
end %function
