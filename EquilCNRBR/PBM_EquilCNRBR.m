function PBM = PBM_EquilCNRBR( CNRBR , NUMERICS )
    
    PBM.F = CNRBR.FixedPointMap ;
    
    PBM.z_init = CNRBR.b ;
    
    PBM.n = CNRBR.p ;
    
    PBM.tolFactorLower = 1 - NUMERICS.relTolSol ;
    PBM.tolFactorUpper = 1 + NUMERICS.relTolSol ;
    
    PBM.maxFixdPntIter = NUMERICS.maxFixdPntIter ;
    PBM.maxFixdBoxIter = NUMERICS.maxFixdBoxIter ;
    
    PBM.maxBoxSubdivLevels = NUMERICS.maxBoxSubdivLevels ;
    
    PBM.cmprssFactor_FixdPnt = NUMERICS.cmprssFactor_FixdPnt  ;
    PBM.cmprssFactor_FixdBox = NUMERICS.cmprssFactor_FixdBox ;
    
    PBM.recordBoxes = NUMERICS.recordBoxes ;
    
end
