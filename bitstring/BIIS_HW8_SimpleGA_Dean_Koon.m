%   Extends SimpleGA2012
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

%ex GA( 1000, 3, .5, -1, .3, .3, 1000, ones(1,1000)) 
function [Generations, Best, Score] = ...
        BIIS_HW8_SimpleGA_Dean_Koon ( vecLength, popSize, sigma, varM, numCross, chanceCross, chanceMutate, desired, Matcher ) 
  
	% Create Random Population of 1/0’s of length: vecLength
    % Plus 1 because we will use column 1 for holding the score
	input = randi(2, popSize, vecLength+1 ) - 1;
    %default value
    ProbTest = @Sigmoid; 
    
	[ X, Generations, Best, Score ] = ...
        GA( ProbTest, input, sigma, varM, numCross, chanceCross, chanceMutate, desired, Matcher )  

    %plot the Performance
    figure;
    plot(X);
    title(strcat('Performance vs Generation of ones', num2str(popSize)));
    ylabel('Score');
    xlabel('Generation');
    
    %Final population
    figure;
    hist(input(:,1));
    title('Final population score')
    xlabel('Scores')
    ylabel('count')

end
