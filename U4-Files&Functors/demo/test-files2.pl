:-dynamic(padres/3).

inicio :-
    abrir_base,
    agregar_nuevo,
    guardar,
    listar_con_retract.

abrir_base :- consult('/home/ale/Documents/prolog/U4-Files&Functors/demo/datos.txt').

agregar_nuevo :- 
    write("Ingrese hijo: "), read(H),
    write("Ingrese madre: "), read(M),
    write("Ingrese padre: "), read(P),
    assert(padres(H, M, P)).

listar_con_retract :- 
    padres(H, M, P),
    write(H), write(M), writeln(P),
    retract(padres(H, M, P)),
    listar_con_retract.
listar_con_retract :- consult('/home/ale/Documents/prolog/U4-Files&Functors/demo/datos.txt').
    

guardar :- tell('/home/ale/Documents/prolog/U4-Files&Functors/demo/datos.txt'), listing(padres), told.