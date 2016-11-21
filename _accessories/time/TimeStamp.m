function strTimeStamp = TimeStamp()
    strTimeStamp = strRepMult( strRepMult( datestr(floor(clock), 31) , {':'} , '-' ) , {' '} , '.' ) ;
end