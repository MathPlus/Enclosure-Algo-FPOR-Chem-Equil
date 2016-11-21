function [ h , m , s ] = seconds2hmsVec( seconds )

    sixty = int32( 60 ) ;
    
    wholeSeconds = floor( seconds ) ;
    
    minutes = idivide( wholeSeconds , sixty , 'floor' ) ;

    s = double( rem( wholeSeconds , sixty ) ) + seconds - wholeSeconds ;
    
    m = rem( minutes , sixty ) ;
    
    h = idivide( minutes , sixty , 'floor' ) ;

end