function result = Box_Subdivision_Iteration__Record_Boxes( PBM , y , z )
    
    result.nberSubboxesExamined = NaN * zeros( PBM.maxBoxSubdivLevels , 1 ) ;
    result.nberSubboxesAdmitted = NaN * zeros( PBM.maxBoxSubdivLevels , 1 ) ;
    
    result.yy = cell( PBM.maxBoxSubdivLevels + 1 , 1 ) ;
    result.zz = cell( PBM.maxBoxSubdivLevels + 1 , 1 ) ;
    
    result.yy{1} = y ;
    result.zz{1} = z ;
    
    for i = 1 : PBM.maxBoxSubdivLevels
    
        sbResult = Subdivide_Boxes( PBM , result.yy{i} , result.zz{i} ) ;
    
        result.nberSubboxesExamined(i) = sbResult.nberSubboxesExamined ;
        result.nberSubboxesAdmitted(i) = sbResult.nberSubboxesAdmitted ;
        
        result.SolutionFound = sbResult.SolutionFound ;
        
        result.yy{i+1} = sbResult.yy ;
        result.zz{i+1} = sbResult.zz ;
        
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
    
    end
    
    result.nberBoxSubdivLevels = i ;
    
    result.nberSubboxesExamined( ( result.nberBoxSubdivLevels + 1 ) : end ) = [] ;
    result.nberSubboxesAdmitted( ( result.nberBoxSubdivLevels + 1 ) : end ) = [] ;
    
    result.yy( ( result.nberBoxSubdivLevels + 2 ) : end ) = [] ;
    result.zz( ( result.nberBoxSubdivLevels + 2 ) : end ) = [] ;
    
end