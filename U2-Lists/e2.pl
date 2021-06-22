% 2. Ingresar una lista de elementos y mostrar su cabeza y su cola.

mostrar_head_and_tail([Head|Tail]) :- writeln("cabeza"), writeln(Head)
                                    , writeln("cola"), writeln(Tail).

/*
    ?- mostrar_head_and_tail([1,2,3,4]).
    cabeza
    1
    cola
    [2,3,4]
    true.
*/