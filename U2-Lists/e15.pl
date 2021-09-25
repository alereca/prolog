/*
    15. Ingresar una lista y determinar a través de una segunda lista todos los
    elementos que se repiten.
*/

pertenece([ItemBuscado| _], ItemBuscado).
pertenece([_| Tail], ItemBuscado) :- pertenece(Tail, ItemBuscado).

repetido([Head| Tail], [Head| TailRepetidos]) :- pertenece(Tail, Head)
                                               , repetido(Tail, TailRepetidos), not(pertenece(TailRepetidos, Head)).
repetido([_| Tail], Repetidos) :- repetido(Tail, Repetidos).
repetido([], []).

/*
    ?- repetido([2, 1, 3], R).
    R = [].

    ?- repetido([1, 2, 1, 3], R).
    R = [1] .

    ?- repetido([2, 1, 1, 3, 4, 3, 1], R).
    R = [1, 3] .

    ?- repetido([2, 1, 1, 2, 0, -1], R).
    R = [2, 1] .
*/