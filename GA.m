%% General Genetic Algorithm. 
function [X, Generations, Best, BestScore] = ...
    GA( ProbTest, input, sigma, varM, numCross, chanceCross, chanceMutate, desired, Matcher ) 
    
    % Initialize
    X = 0; Generations = 1; 
    Pop = input; vecLength = size(Pop,2)-1;

    %For Simulated Annealing
    T = 1000;
   
    % Initialize Score and Sort Population
    [ Pop ] = ScoreSystem( Pop , Matcher, T, ProbTest );
    BestScore = Pop(1,1);
    X(Generations)=BestScore;
    Best = Pop(1,2:vecLength+1);
    
    %while loop of generations
    Threshold = .15;
    while Pop(1,1)>Threshold
        %Making a mating pool that references the population pool
        MatingPool = MakingMatingPool(Pop, sigma); 
        
        while size(MatingPool,1) > 1 
            %A and B are selected from reference pool
            [A, B, MatingPool] = take2random( MatingPool );

            if rand(1) < chanceCross 
                Pop = CrossOver(Pop, A, B, numCross, Matcher, T, ProbTest );
            end % end cross over

            if rand(1) < chanceMutate
                Pop = Mutate( Pop, A, B, varM, Matcher, T, ProbTest );
            end % end mutation   
            
        end % Finished running through MatingPool

        % Display as you run
        Pop = sortrows( Pop, 1 );
        Generations = Generations + 1;
        Best = Pop(1,2:vecLength+1); 
        BestScore = Pop(1,1)
        X(Generations)=BestScore;        
        
        %For simulated annealing. we want higher numbers, not lower
        T = .95*T;
    end %end while
end
