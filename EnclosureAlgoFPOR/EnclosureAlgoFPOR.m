function RESULT = EnclosureAlgoFPOR( PBM )
    
    timeStarted = tic ;

    fpResult = Fixed_Point_Iteration( PBM ) ;
    
    RESULT.SolutionFound = fpResult.SolutionFound ;
    RESULT.nberFixedPointIter = fpResult.nberFixedPointIter ;
    RESULT.nberBoxSubdivLevels = 0 ;
    
    if ( RESULT.SolutionFound )
    
        RESULT.x      = fpResult.x ;
        RESULT.Fx     = fpResult.Fx ;
        RESULT.relErr = fpResult.relErr ;
        
        RESULT.y = fpResult.y ;
        RESULT.z = fpResult.z ;
        
    else
        
        if ( ~ PBM.recordBoxes )
            
            bsResult = Box_Subdivision_Iteration ...
                       ( PBM , fpResult.y , fpResult.z ) ;
                   
        else
        
            bsResult = Box_Subdivision_Iteration__Record_Boxes ...
                       ( PBM , fpResult.y , fpResult.z ) ;
                   
        end
        
        RESULT.SolutionFound = bsResult.SolutionFound ;
        
        if ( RESULT.SolutionFound )
            
            RESULT.x      = bsResult.x ;
            RESULT.Fx     = bsResult.Fx ;
            RESULT.relErr = bsResult.relErr ;
        
            RESULT.y = bsResult.y ;
            RESULT.z = bsResult.z ;
            
        end
        
        RESULT.nberBoxSubdivLevels  = bsResult.nberBoxSubdivLevels ;
        RESULT.nberSubboxesExamined = bsResult.nberSubboxesExamined ;
        RESULT.nberSubboxesAdmitted = bsResult.nberSubboxesAdmitted ;
        
        if ( PBM.recordBoxes )
            RESULT.yy = bsResult.yy ;
            RESULT.zz = bsResult.zz ;
        end
        
    end
    
    RESULT.Duration_sec = toc( timeStarted ) ;
    RESULT.Duration_hms = seconds2hmsStr( RESULT.Duration_sec ) ;
    
end