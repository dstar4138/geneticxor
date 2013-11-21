function [A B Rest] = take2random( Mat )
    T = Mat(randperm(size(Mat,1)),:);
    A = T(1,:);
	B = T(2,:);
	Rest = T(3:end,:);
end