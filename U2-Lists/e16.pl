/*
    16. Ingresar una lista y un elemento e informar cuántas veces está ese
    elemento en la lista.
*/

pertenece([ItemBuscado| _], ItemBuscado).
pertenece([_| Tail], ItemBuscado) :- pertenece(Tail, ItemBuscado).

repeticiones([Elemento| Tail], Elemento, CantidadRepeticiones) :-  
                                repeticiones(Tail, Elemento, CantidadRepeticionesLast), CantidadRepeticiones is CantidadRepeticionesLast + 1.
repeticiones([_| Tail], Elemento, CantidadRepeticiones) :- 
                                repeticiones(Tail, Elemento, CantidadRepeticiones).
repeticiones([], _, 0).

/*

    ?- repeticiones([2, -1, 3, 100], 1, C).
    C = 0.

    ?- repeticiones([2, 1, 3], 1, C).
    C = 1 .

    ?- repeticiones([1, 2, 1, 3], 1, C).
    C = 2 .

    ?- repeticiones([2, 1, 1, 3, 4, 3, 1], 1, C).
    C = 3 .
*/