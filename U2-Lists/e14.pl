/*
    14. Ingresar una lista y determinar el primer elemento que se repite.
*/

pertenece([ItemBuscado| _], ItemBuscado).
pertenece([_| Tail], ItemBuscado) :- pertenece(Tail, ItemBuscado).

repetido([Head| Tail], ElementoRepetido) :- pertenece(Tail, Head), ElementoRepetido is Head.
repetido([_| Tail], ElementoRepetido) :- repetido(Tail, ElementoRepetido).

/*
    ?- repetido([2, 1, 3], R).
    false.

    ?- repetido([1, 2, 1, 3], R).
    R = 1 .

    ?- repetido([2, 1, 1, 3], R).
    R = 1 .

    ?- repetido([2, 1, 1, 3, 4, 3, 1], R).
    R = 1 .
*/