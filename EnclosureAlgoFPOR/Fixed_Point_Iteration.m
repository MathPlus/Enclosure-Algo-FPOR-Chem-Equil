function result = Fixed_Point_Iteration( PBM )
        
    z_old = PBM.z_init ;
    
    y_old = PBM.F( z_old ) ;
    
    for i = 1 : PBM.maxFixdPntIter
    
        z_new = PBM.F( y_old ) ;

        y_new = PBM.F( z_new ) ;
        
        result = Test_Box_for_Solution( PBM , y_new , z_new ) ;
        
        if ( result.SolutionFound )
            
            break ;
            
        end
        
        if ( Smaller_Box( y_old , z_old , y_new , z_new , ...
                          PBM.cmprssFactor_FixdPnt ) )
        
            y_old = y_new ;
            
        else
            
            break ;
            
        end
        
    end
    
    result.nberFixedPointIter = i ;
    
    result.y = y_new ;
    result.z = z_new ;
    
end