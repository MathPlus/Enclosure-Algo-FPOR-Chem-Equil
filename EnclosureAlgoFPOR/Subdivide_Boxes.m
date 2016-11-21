function result = Subdivide_Boxes( PBM , y , z )

    N = size( y , 1 ) ;
    
    result.yy = NaN * zeros( 2 * N , PBM.n ) ;
    result.zz = NaN * zeros( 2 * N , PBM.n ) ;
    
    nberSubboxes = struct( 'Examined' , cell( N , 1 ) , ...
                           'Admitted' , cell( N , 1 ) ) ;
    
    i2 = 0 ;
    
    for k = 1 : N
    
        sbResult = Subdivide_Box( PBM , y( k , : ) , z( k , : ) ) ;
        
        nberSubboxes(k).Examined = sbResult.nberSubboxesExamined ;
        nberSubboxes(k).Admitted = sbResult.nberSubboxesAdmitted ;
        
        if ( nberSubboxes(k).Admitted > 0 )

            i1 = i2 + 1 ;
            i2 = i2 + nberSubboxes(k).Admitted ;

            result.yy( i1 : i2 , : ) = sbResult.yy ;
            result.zz( i1 : i2 , : ) = sbResult.zz ;

        end
        
        result.SolutionFound = sbResult.SolutionFound ;
        
        if ( result.SolutionFound )
        
            result.x = sbResult.x ;
            
            result.Fx = sbResult.Fx ;
            
            result.relErr = sbResult.relErr ;
            
            result.y = sbResult.y ;
            result.z = sbResult.z ;
            
            break ;
            
        end
    
    end
    
    result.yy( ( i2 + 1 ) : end , : ) = [] ;
    result.zz( ( i2 + 1 ) : end , : ) = [] ;

    nberSubboxes( ( k + 1 ) : end ) = [] ;
    
    result.nberSubboxesExamined = sum( cat( 1 , nberSubboxes.Examined ) ) ;
    result.nberSubboxesAdmitted = sum( cat( 1 , nberSubboxes.Admitted ) ) ;

end