:-dynamic(padres/3).

inicio :-
    abrir_base,
    agregar_nuevo,
    listar_con_fail,
    guardar.

abrir_base :- consult('/home/ale/Documents/prolog/U4-Files&Functors/demo/datos.txt').

agregar_nuevo :- 
    write("Ingrese hijo: "), read(H),
    write("Ingrese madre: "), read(M),
    write("Ingrese padre: "), read(P),
    assert(padres(H, M, P)).

listar_con_fail :- 
    padres(H, M, P),
    write(H), write(M), writeln(P),
    fail.
listar_con_fail.

guardar :- tell('/home/ale/Documents/prolog/U4-Files&Functors/demo/datos.txt'), listing(padres), told.