function [ CNRBR , NUMERICS , result ] = EquilCNRBR( CNRBR_data_function )

    CNRBR = CNRBR_data( CNRBR_data_function ) ;

    NUMERICS = NumericsConfig() ;
    
    if NUMERICS.doProfiling
        profile on
    end
    
    PBM = PBM_EquilCNRBR( CNRBR , NUMERICS ) ;
    
    RESULT = EnclosureAlgoFPOR( PBM ) ;
    
    if ( RESULT.SolutionFound )
        
        result.EquilConctr_Elem = RESULT.x ;
        
        result.EquilConctr_Comp ...
            = CNRBR.BindingMonomial( result.EquilConctr_Elem ) ;
        
        result.TotalConctr ...
            = CNRBR.BindingPolynomial( result.EquilConctr_Elem ) ;
        
        result.relErr = RESULT.relErr ;
        
        result.EquilConctr_Elem__LOWER = RESULT.y ;
        result.EquilConctr_Elem__UPPER = RESULT.z ;
        
    end
    
    result.SolutionFound        = RESULT.SolutionFound ;
    result.nberFixedPointIter   = RESULT.nberFixedPointIter ;
    result.nberBoxSubdivLevels  = RESULT.nberBoxSubdivLevels ;
    result.nberSubboxesExamined = RESULT.nberSubboxesExamined ;
    result.nberSubboxesAdmitted = RESULT.nberSubboxesAdmitted ;
    
    result.Duration_sec = RESULT.Duration_sec ;
    result.Duration_hms = RESULT.Duration_hms ;
    
    if ( PBM.recordBoxes )
        result.yy = RESULT.yy ;
        result.zz = RESULT.zz ;
    end
    
    if NUMERICS.doProfiling
        profile off
        profile_info = profile('info') ;
        profsave( profile_info , 'performance' ) ;
    end
    
    save( CNRBR.OutputFilePath , 'CNRBR' , 'NUMERICS' , 'result' ) ;
    
end
