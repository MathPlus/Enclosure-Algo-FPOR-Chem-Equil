function strOut = strRepMult(strIn, strReplacee, strReplacer)
%strRepMult
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Input
%   strIn       : String upon which substring replacements are to be
%                 performed.
%   strReplacee : Cell array of strings to be searched and replaced.
%   strReplacer : String to be inserted as replacement.
%
% Output
%   strOut      : String resulting from replacement operations.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    strOut = strIn ;
    
    for i = 1 : length(strReplacee)
        
        strOut = strrep( strOut , strReplacee{i} , strReplacer ) ;
        
    end

end