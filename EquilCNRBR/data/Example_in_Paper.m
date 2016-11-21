function CNRBR = Example_in_Paper()

    %% Units
    UNIT = Unit() ;
    
    %% Filenames
    CNRBR.FileName = mfilename() ;
    CNRBR.FilePath = mfilename('fullpath') ;
    CNRBR.OutputFilePath = [ addPreExtTimeStamp( CNRBR.FilePath ) , 'mat' ] ;

    %% Network ID
    CNRBR.ID = 'Example_in_Paper' ;
    
    %% Unit for equilibrium dissociation constants and species cooncentrations
    CNRBR.Unit = UNIT.NoUnit ;
    
    %% Information on elementary species
    CNRBR.X{1} = SpeciesInfo( 'X1' , 'X1' , 'X1' , NaN , UNIT.NoUnit ) ;
    CNRBR.X{2} = SpeciesInfo( 'X2' , 'X2' , 'X2' , NaN , UNIT.NoUnit ) ;
    CNRBR.X{3} = SpeciesInfo( 'X3' , 'X3' , 'X3' , NaN , UNIT.NoUnit ) ;
    CNRBR.X{4} = SpeciesInfo( 'X4' , 'X4' , 'X4' , NaN , UNIT.NoUnit ) ;
    
    %% Information on composite species
    CNRBR.Y{1} = SpeciesInfo( 'Y1' , 'Y1' , 'Y1' , NaN , UNIT.NoUnit ) ;
    CNRBR.Y{2} = SpeciesInfo( 'Y2' , 'Y2' , 'Y2' , NaN , UNIT.NoUnit ) ;
    CNRBR.Y{3} = SpeciesInfo( 'Y3' , 'Y3' , 'Y3' , NaN , UNIT.NoUnit ) ;
    CNRBR.Y{4} = SpeciesInfo( 'Y4' , 'Y4' , 'Y4' , NaN , UNIT.NoUnit ) ;
    CNRBR.Y{5} = SpeciesInfo( 'Y5' , 'Y5' , 'Y5' , NaN , UNIT.NoUnit ) ;

    %% Number of elementary species
    CNRBR.p = length( CNRBR.X ) ;

    %% Number of composite species
    CNRBR.q = length( CNRBR.Y ) ;

    %% Composition matrix
    %           X1 X2 X3 X4
    CNRBR.s = [  1  1  0  0  ;   % Y1
                 0  1  1  0  ;   % Y2
                 1  0  1  0  ;   % Y3
                 0  0  1  1  ;   % Y4
                 1  0  1  1  ] ; % Y5
    
    %% Equilibrium dissociation constants
    CNRBR.K(1) = 10 ;
    CNRBR.K(2) = 170 ;
    CNRBR.K(3) = 325 ;
    CNRBR.K(4) = 0.016 ;
    CNRBR.K(5) = 2 ;
    
    %% Equilibrium association constants
    CNRBR.a = arrayfun( @ ( K ) ( 1 ./ K ) , CNRBR.K ) ;

    %% Total concentrations
    CNRBR.b(1) = 2500 ;
    CNRBR.b(2) = 10 ;
    CNRBR.b(3) = 100 ;
    CNRBR.b(4) = 80 ;

end