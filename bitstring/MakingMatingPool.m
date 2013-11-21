% Needs to return an even number.
function[PopReference] = MakingMatingPool(Pop, sigma)
    PopReference = ceil(abs((randn(size(Pop,1),1) * sqrt(sigma) )));
end
