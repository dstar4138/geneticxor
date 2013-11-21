function [ NewPop ] = ScoreSystem( Pop , Matcher, T, ProbTest );
	% Instead of having a score, maybe just order? so compare sort with Match?
	[m n]= size(Pop);

    for i=1:m
		NewPop(i,:) = Compare( Pop(i,:), Matcher );
    end
	
    %sort in descending score order
	NewPop = sortrows( NewPop, -1 );
	%NewPop = Temp(:,2:end) % Trim off the first column (which was score).
end
