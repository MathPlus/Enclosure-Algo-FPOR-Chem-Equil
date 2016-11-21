function filenameOut = addPreExtTimeStamp(filenameIn)
%addPreExtTimeStamp
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Input
%   filenameIn : Filename before timestamp pre-extension is added
%
% Output
%   filenameOut : Filename after timestamp pre-extension is added
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    filenameOut = addPreExtension( filenameIn , TimeStamp() ) ;

end