### Computer Implementation of Enclosure Algorithm for the Fixed Points of Order-Reversing Maps, and Application to Polynomial Systems for Chemical Equilibrium
#### Gilles Gnacadja

This software project is a companion to the paper **_"Enclosure Algorithm for the Fixed Points of Order-Reversing Maps -- Application to Polynomial Systems for Chemical Equilibrium"_**.
- Main paper:
http://math.gillesgnacadja.info/files/EnclosureAlgoFPOR.html
- Supplemental slide deck:
http://math.gillesgnacadja.info/files/EnclosureAlgoFPOR_suppl.html
- Supplemental MATLAB code:
https://github.com/MathPlus/Enclosure-Algo-FPOR-Chem-Equil

The directory `EnclosureAlgoFPOR` is a library of MATLAB scripts that implements the algorithm described in the paper. The interface is `RESULT = EnclosureAlgoFPOR(PBM)`.
The client application submits a problem structure `PBM` and retrieves a result structure `RESULT`.

The directory `EquilCNRBR` contains an application that computes the chemical equilibrium states of qualified reaction networks. It is a client of the above library.

The directory `EquilCNRBR` also contains the script `Reproduce_Example_in_Paper.m`. It readily reproduces the example discussed in Section 6 of the main paper. It gets input data from the file `Example_in_Paper.m` located in the directory `EquilCNRBR/data`, and saves results in a file `Example_in_Paper.YYYY-MM-DD-hh-mm-ss.dat` in the same directory, in addition to displaying results on screen.

There is no particular installation procedure. Just have a local copy of the entire project and run the script `Reproduce_Example_in_Paper` from within the directory `EquilCNRBR` in MATLAB or Octave.

I successfully used this program in MATLAB release 2016b and GNU Octave version 4.2.0 on the Microsoft Windows 10 64-bit operating system and an Intel Core i3 processor. Performance in Octave was significantly poorer than in MATLAB. An implementation in C would presumably outperform MATLAB.