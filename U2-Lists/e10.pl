/* 
10. Ingresar una lista y un elemento e informar si ese elemento está en la
    lista.
*/

pertenece([ItemBuscado| _], ItemBuscado).
pertenece([_| Tail], ItemBuscado) :- pertenece(Tail, ItemBuscado).


/*
    ?- pertenece([1,2], 3).
    false.
    ?- pertenece([1,1,-2,4,4], -2).
    true .
    ?- pertenece([0,2,4,4], 0).
    true .
    ?- pertenece([1,2, 3, 2, 4], 2).
    true ;
    true ;
    false.
    ?- pertenece([1,-2, 3, -2, 4], 2).
    false.
    ?- pertenece([], 3).
    false.
    ?- pertenece([3], 3).
    true ;
    false.
*/
