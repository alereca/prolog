/*
    2.  Hacer  un  programa  que  defina  una  Base  de  datos  de  personas  de  la 
    siguiente forma:  
        personas(codigo,nombre).  
    El  programa  debe  permitir  ingresar  un  código  y  verificar  si  el  mismo  está 
    definido en la BBDD. De estarlo deberá informar a quién corresponde, de lo 
    contrario  deberá  solicitar ingresar  un  nombre  y  registrar  entonces  la 
    persona en la BBDD.  
*/
:- dynamic personas/2.

inicio :-
    abrir_base,
    writeln('Ingresar codigo a verificar'),
    read(Cod),
    verificar(Cod),
    inicio. 

abrir_base :- consult('/home/ale/Documents/prolog/U4-Files&Functors/E2/e2-data.txt').

verificar(Cod) :- personas(Cod, Persona), writeln(Persona).
verificar(Cod) :- 
    writeln('Ingresar persona para este codigo'), read(Persona),
    assert(personas(Cod, Persona)), guardar.

guardar :- tell('/home/ale/Documents/prolog/U4-Files&Functors/E2/e2-data.txt'), listing(personas), told.

/*
    ?- inicio.
    Ingresar codigo a verificar
    |: 1.
    ale
    Ingresar codigo a verificar
    |: 6.
    joaquin
    Ingresar codigo a verificar
    |: 7.
    juan
    Ingresar codigo a verificar
    |: 8.
    Ingresar persona para este codigo
    |: agustin.
    Ingresar codigo a verificar
    |: 8.
    agustin
*/