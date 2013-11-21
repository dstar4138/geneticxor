% Randomly picks A or B, mutates it in a batch according to varM
function [C] = Mutate(varM, A, B )
    i = randi( size(A)-1 ) + 1 ;% Pick a random bit in the vector
    if rand(1) < 0.5
        C = A;
    else 
        C = B;
    end
    
    % The larger the variance, the wider the spread.
    for x=i:i+varM
        if x>size(C)
            break;
        end
        C(x) = ~C(x);
    end % End-of-For-Loop
end % End-of-Function
