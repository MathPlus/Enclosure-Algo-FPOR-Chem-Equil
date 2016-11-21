function filenameOut = addPreExtension(filenameIn, preExt, sep1, sep2)
%addPreExtension
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Input
%   filenameIn : Filename before pre-extension is added
%   preExt     : Pre-extension
%
% Output
%   filenameOut : Filename after pre-extension is added
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    [ preDot , postDot ] = splitFileName( filenameIn ) ;
    
    if ( nargin == 2 )
    
        filenameOut = [ preDot '.' preExt '.' postDot ] ;
        
    elseif ( nargin == 4 )
    
        filenameOut = [ preDot sep1 preExt sep2 postDot ] ;
        
    else
        
        error ...
        ( 'addPreExtension:addPreExtension' , ...
          'Number of arguments: expected either 2 or 4, received %d' , ...
          nargin ) ;
        
    end

end