function CNRBR = CNRBR_data( CNRBR_data_function )

    strErrorMsgID = 'CNRBR:Invalid' ;
    
    % Load network structure and data
    CNRBR = CNRBR_data_function() ;
    
    % Validate network structure
    CNRBR_structure_validation( CNRBR , strErrorMsgID ) ;

    % Validate equilibrium dissociation constants
    isVectorHorzPositiveLong_Error( CNRBR.K , CNRBR.q , ...
                                    'CNRBR.K' , strErrorMsgID ) ;
    
    % Validate equilibrium association constants
    isVectorHorzPositiveLong_Error( CNRBR.a , CNRBR.q , ...
                                    'CNRBR.a' , strErrorMsgID ) ;
    
    % Validate total concentrations
    isVectorHorzPositiveLong_Error( CNRBR.b , CNRBR.p , ...
                                    'CNRBR.b' , strErrorMsgID ) ;
    
    % Binding monic monomials
    CNRBR.BindingMonicMonomial ...
        = @ ( x ) arrayfun( @ ( j ) prod( x .^ CNRBR.s( j , : ) ) , 1 : CNRBR.q ) ;
    
    % Binding monomials
    CNRBR.BindingMonomial ...
        = @ ( x ) ( CNRBR.a .* CNRBR.BindingMonicMonomial( x ) ) ;
    
    % Binding polynomials
    CNRBR.BindingPolynomial ...
        = @ ( x ) ( x + CNRBR.BindingMonomial( x ) * CNRBR.s ) ;
    
    % Fixed-point map
    CNRBR.FixedPointMap ...
        = @ ( x ) ( CNRBR.b ./ ( 1 + ( ( CNRBR.BindingMonomial( x ) * CNRBR.s ) ./ x ) ) ) ;
    
end