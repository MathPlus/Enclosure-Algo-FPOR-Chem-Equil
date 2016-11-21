function hms = seconds2hmsStr( seconds )

    [ h , m , s ] = seconds2hmsVec( seconds ) ;
    
    if any( [ h , m , s ] )
        
        if ( s > 0 )
            hms = sprintf( '%.2f %s' , s , strHMS('S') ) ;
        else        
            hms = '' ;            
        end
        
        if ( m > 0 )
            if ( isempty(hms) )
                hms = sprintf( '%d %s' , m , strHMS('M') ) ;
            else
                hms = sprintf( '%d %s, %s' , m , strHMS('M') , hms ) ;
            end
        end
        
        if ( h > 0 )
            if ( isempty(hms) )
                hms = sprintf( '%d %s' , h , strHMS('H') ) ;
            else
                hms = sprintf( '%d %s, %s' , h , strHMS('H') , hms ) ;
            end
        end
        
    else
        
        hms = sprintf( '%.2f %s' , 1000 * s , strHMS('mS') ) ;
        
    end

end