function result = Subdivide_Box( PBM , y , z )
    
    result.nberSubboxesExamined = 2 ;
    result.nberSubboxesAdmitted = 0 ;
    
    result.SolutionFound = false ;
    
    [ ~ , k ] = max( z ./ y ) ;
   %[ ~ , k ] = max( z - y ) ;
    
    w = midpoint_Geometric( y(k) , z(k) ) ;
   %w = midpoint_Arithmetic( y(k) , z(k) ) ;
    
    result.yy = repmat( y , result.nberSubboxesExamined , 1 ) ;
    result.zz = repmat( z , result.nberSubboxesExamined , 1 ) ;
    
    result.zz(1,k) = w ;
    result.yy(2,k) = w ;
    
    for i = 1 : result.nberSubboxesExamined
        
        j = result.nberSubboxesAdmitted + 1 ;
        
        fbResult = Fixed_Box_Iteration ...
                   ( PBM , result.yy(j,:) , result.zz(j,:) ) ;
        
        if ( fbResult.isAdmissibleBox )
            
            result.nberSubboxesAdmitted = j ;
            
            result.yy(j,:) = fbResult.y ;
            result.zz(j,:) = fbResult.z ;
            
            tbsResult = Test_Box_for_Solution ...
                        ( PBM , result.yy(j,:) , result.zz(j,:) ) ;
            
            result.SolutionFound = tbsResult.SolutionFound ;
            
            if ( result.SolutionFound )

                result.x = tbsResult.x ;

                result.Fx = tbsResult.Fx ;

                result.relErr = tbsResult.relErr ;
            
                result.y = result.yy(j,:) ;
                result.z = result.zz(j,:) ;
                
                break ;

            end
            
        else
            
            result.yy(j,:) = [] ;
            result.zz(j,:) = [] ;
            
        end
    
    end
    
    result.yy = result.yy( 1 : result.nberSubboxesAdmitted , : ) ;
    result.zz = result.zz( 1 : result.nberSubboxesAdmitted , : ) ;

end