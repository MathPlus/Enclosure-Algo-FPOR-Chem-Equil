function result = Box_Subdivision_Iteration( PBM , y , z )
    
    result.nberSubboxesExamined = NaN * zeros( PBM.maxBoxSubdivLevels , 1 ) ;
    result.nberSubboxesAdmitted = NaN * zeros( PBM.maxBoxSubdivLevels , 1 ) ;
    
    yy = y ;
    zz = z ;
    
    for i = 1 : PBM.maxBoxSubdivLevels
    
        sbResult = Subdivide_Boxes( PBM , yy , zz ) ;
    
        result.nberSubboxesExamined(i) = sbResult.nberSubboxesExamined ;
        result.nberSubboxesAdmitted(i) = sbResult.nberSubboxesAdmitted ;
        
        result.SolutionFound = sbResult.SolutionFound ;
        
        if ( result.SolutionFound )
        
            result.x = sbResult.x ;
            
            result.Fx = sbResult.Fx ;
            
            result.relErr = sbResult.relErr ;
            
            result.y = sbResult.y ;
            result.z = sbResult.z ;
            
            break ;
            
        elseif ( sbResult.nberSubboxesAdmitted == 0 )
        
            error( 'Box_Subdivision_Iteration:NothingLeft' , ...
                   'No solution and no candidate boxes' ) ;
        
        end
        
        yy = sbResult.yy ;
        zz = sbResult.zz ;
    
    end
    
    result.nberBoxSubdivLevels = i ;
    
    result.nberSubboxesExamined( ( result.nberBoxSubdivLevels + 1 ) : end ) = [] ;
    result.nberSubboxesAdmitted( ( result.nberBoxSubdivLevels + 1 ) : end ) = [] ;
    
end