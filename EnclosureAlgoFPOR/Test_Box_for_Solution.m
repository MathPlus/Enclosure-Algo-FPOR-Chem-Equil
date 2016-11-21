function result = Test_Box_for_Solution( PBM , y , z )

    x = midpoint_Geometric( y , z ) ;
   %x = midpoint_Arithmetic( y , z ) ;

    Fx = PBM.F( x ) ;

    result.SolutionFound =    all( PBM.tolFactorLower * Fx <= x ) ...
                           && all( x <= PBM.tolFactorUpper * Fx ) ;
    
    if ( result.SolutionFound )

        result.x = x ;

        result.Fx = Fx ;
        
        result.relErr = max( abs( ( result.x ./ result.Fx ) - 1 ) ) ;

    end

end