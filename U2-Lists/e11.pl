/*
    11. Ingresar una lista de enteros e informar cuál es el mayor de todos los
    números.
*/

mayor([Head| Tail], Mayor) :- mayor(Tail, MayorActual), Head > MayorActual, Mayor is Head.
mayor([Head| Tail], Mayor) :- mayor(Tail, MayorActual), Head =< MayorActual, Mayor is MayorActual.
mayor([Head| []], Head).

/*
    ?- mayor([1, 0, 3], M).
    M = 3 .

    ?- mayor([1,-3, 2, -1], M).
    M = 2 .

    ?- mayor([1, 1000, 3, 14, -45, -5000, 54], M).
    M = 1000 .
*/