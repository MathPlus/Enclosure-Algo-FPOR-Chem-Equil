function answer = isIntegerLowerBound(n, lowerBound)
%isIntegerLowerBound
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Tell whether n is an integer greater than or equal to lowerBound
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    answer = ( isInteger(n) && ( n >= lowerBound ) ) ;

end