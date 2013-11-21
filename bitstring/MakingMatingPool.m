% Needs to return an even number.
function[MatingPool] = MakingMatingPool(Pop, sigma)
    %Mating pool is the same size as Population
    [m, n] = size(Pop);
    temp = ceil(abs((randn(m,1) * sqrt(sigma) + 0)));
    for i=1:m
    %Using a gaussian distribution with the center at 0.
    %The value must be positive and an integer
    %This will create a large chance of selecting the best performers 
    %rather than the not so high in scoring population
        MatingPool(i,1:n) = Pop(temp(i),1:n);
    end %n loop
    
    
    % If it’s not even, add the top individual
    if mod( size(MatingPool,1), 2) == 1
        MatingPool( i+1, 1:n ) = Pop(temp(1), 1:n);
    end

end
