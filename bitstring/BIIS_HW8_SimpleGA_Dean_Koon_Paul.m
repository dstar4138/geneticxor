% Extends SimpleGA2012
%   Generations     Returns the number of generations it went through
%   Best            The best individual found 
%   Score           The best individual’s score.

%vecLength,         % Size of the vector length
%popSize,            % Size of population
%sigma,              % guass dist for mating pool
%varM,               % Mutation variance
%numCross,           % Number of crossovers per merge
%chanceCross,        % Chance Crossovers will occur
%chanceMutate,       % Chance mutations will occur
%threshold,          % When Function should return.
%Matcher )           % [1 1 1 1 1 1 1 1 ], example

function [X, Generations, Best, Score] = BIIS_HW8_SimpleGA_Dean_Koon_Paul( vecLength, popSize, sigma, varM, numCross, chanceCross, chanceMutate, threshold, Matcher ) 
    % Initialize generation count.
	Generations = 1;
    Best = 0;
    Score =0;
    
	% Create Random Population of 1/0’s of length: vecLength
    % Plus 1 because we will use column 1 for holding the score
	Pop = randi(2, popSize, vecLength+1 ) - 1;

	% While we do not have a passing individual
	while Generations<500 
        % Evaluate All Individuals in population
        Pop = AssessFitness( Pop, Matcher ) ; 

        % Check if our population is good enough.
        if Pop(1,1) >= threshold
            break; 
        end

        % We pick out two individuals from population each round.
        MatingPool = MakingMatingPool(Pop, sigma); 
        i=1;
        while size(MatingPool,1) > 0 
            [A, B, MatingPool] = take2random( MatingPool );
            didOp = 0;	

            if rand(1) < chanceCross	
                Pop(i,:) = CrossOver(A, B, vecLength, numCross);
                i=i+1;			
                didOp=didOp+1;
            end
            if rand(1) < chanceMutate
                Pop(i,:) = Mutate( varM, A, B );
                i=i+1;
                didOp=didOp+1;
            end
                % We just removed two elements from the parent list so we 
                % need to make sure we put the same number back. Thus, if
                % we didn’t do any operations, we need to carry the elements
                % back to the list. 
                % ----> TODO, should they go back to mating pool or Pop
            if didOp==1	
                Pop(i,:) = B;
                i=i+1;
            else if didOp == 0
                Pop(i+1,:) = A; Pop(i+2,:) = B;
                i=i+2;
                end
            end

        end % End while Loop
         
        X(Generations)=Pop(1,1);
        % Finished mating, now Pop is made up of the new children.
        Generations=Generations+1
	end % End of While Loop
    Pop = sortrows( Pop, -1 );  
    Best = Pop(1,:) ;
    Score = Pop(1,1) ;
end % End-of-function