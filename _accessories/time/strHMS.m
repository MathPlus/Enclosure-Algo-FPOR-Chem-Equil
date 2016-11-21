function strHMS = strHMS(HMS)

    switch HMS        
        case 'H'            
            strHMS = 'hr' ;
        case 'M'
            strHMS = 'min' ;
        case 'S'
            strHMS = 'sec' ;
        case 'mS'
            strHMS = 'msec' ;
        otherwise
            strHMS = '' ;
    end
        
end