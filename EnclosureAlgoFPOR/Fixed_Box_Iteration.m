function result = Fixed_Box_Iteration( PBM , y , z )

    y_old = y ;
    z_old = z ;
    
    for i = 1 : PBM.maxFixdBoxIter

        Fy_old = PBM.F( y_old ) ;

        result.isAdmissibleBox = all( y_old <= Fy_old ) ;

        if ( ~ result.isAdmissibleBox )
            return ;
        end
        
        Fz_old = PBM.F( z_old ) ;

        result.isAdmissibleBox = all( Fz_old <= z_old ) ;

        if ( ~ result.isAdmissibleBox )
            return ;
        end

        y_new = max( y_old , Fz_old ) ;

        z_new = min( z_old , Fy_old ) ;
        
        if ( Smaller_Box( y_old , z_old , y_new , z_new , ...
                          PBM.cmprssFactor_FixdBox ) )
        
            y_old = y_new ;
            
            z_old = z_new ;
            
        else
            
            break ;
            
        end
        
    end
    
    if ( result.isAdmissibleBox )
        result.y = y_new ;
        result.z = z_new ;
    end

end