function [ preDot , postDot ] = splitFileName( filename )

    posDot = strfind( filename , '.' ) ;
    
    numDots = length(posDot) ;
    
    if (numDots > 0)
        
        lastPosDot = posDot(numDots) ;
        
        preDot  = filename( 1 : ( lastPosDot - 1 ) ) ;
        
        postDot = filename( ( lastPosDot + 1 ) : end ) ;
        
    else
        
        preDot  = filename ;
        
        postDot = '' ;
        
    end

end