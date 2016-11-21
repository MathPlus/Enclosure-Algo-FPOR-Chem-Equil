function NUMERICS = NumericsConfig()

    NUMERICS.relTolSol = 1e-6 ;
    
    NUMERICS.maxFixdPntIter = 100 ;
    NUMERICS.maxFixdBoxIter = 100 ;
    NUMERICS.maxBoxSubdivLevels = 1000 ;
    
    NUMERICS.cmprssFactor_FixdPnt = 0.9 ;
    NUMERICS.cmprssFactor_FixdBox = 0.8 ;
    
    NUMERICS.recordBoxes = true ;
    
    NUMERICS.doProfiling = false ;
    
end

