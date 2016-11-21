function CNRBR_structure_validation( CNRBR , strErrorMsgID )

    % Network ID ;
    if ( ~ ischar( CNRBR.ID ) )
        error( strErrorMsgID , ...
               'CNRBR.ID must be a character string' ) ;
    elseif ( isempty( CNRBR.ID ) )
        error( strErrorMsgID , ...
               'CNRBR.ID must be a nonempty character string' ) ;
    end
    
    % Information on elementary species
    if ( ~ iscell( CNRBR.X ) )
        error( strErrorMsgID , ...
               'CNRBR.X must be a cell array' ) ;
    end  
    
    % Information on composite species
    if ( ~ iscell( CNRBR.Y ) )
        error( strErrorMsgID , ...
               'CNRBR.Y must be a cell array' ) ;
    end

    % Number of elementary species
    if ( ~ isIntegerPositive(CNRBR.p) )
        error( strErrorMsgID , ...
               'CNRBR.p must be a positive integer' ) ;
    end

    % Number of composite species
    if ( ~ isIntegerPositive(CNRBR.q) )
        error( strErrorMsgID , ...
               'CNRBR.q must be a positive integer' ) ;
    end
    
    % Size of composition matrix
    if ( ~ isequal( size( CNRBR.s ) , [ CNRBR.q , CNRBR.p ] ) )
        error( strErrorMsgID , ...
               'CNRBR.s must have size CNRBR.q x CNRBR.p' ) ;
    end
    
    % Content of composition matrix - Step 1
    if ( any( any( ~ arrayfun( @isIntegerNonnegative , CNRBR.s ) ) ) )
        error( strErrorMsgID , ...
               'Entries of CNRBR.s must be nonnegative integers' ) ;
    end
    
    % Content of composition matrix - Step 2
    composition_order = sum( CNRBR.s , 2 ) ;
    min_composition_order = min( composition_order ) ;
    if ( min_composition_order == 0 )
        error( strErrorMsgID , ...
               'Rows of CNRBR.s must be nonzero' ) ;
    elseif ( min_composition_order == 1 )
        error( strErrorMsgID , ...
               'Rows of CNRBR.s must be not be elementary' ) ;
    end

    % Content of composition matrix - Step 3
    if ( ~ isequal( size( unique( CNRBR.s , 'rows' ) ) , [ CNRBR.q , CNRBR.p ] ) )
        error( strErrorMsgID , ...
               'Rows of CNRBR.s must be pairwise different' ) ;
    end
    
end