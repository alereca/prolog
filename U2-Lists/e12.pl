/*
    12. Ingresar una lista de enteros e informar cuál es el menor de todos los
    números.
*/

menor([Head| Tail], Menor) :- menor(Tail, MenorActual), Head < MenorActual, Menor is Head.
menor([Head| Tail], Menor) :- menor(Tail, MenorActual), Head >= MenorActual, Menor is MenorActual.
menor([Head| []], Head).

menorTail([], MenorFinal, MenorFinal).
menorTail([Head| Tail], MenorActual, Menor) :- Head < MenorActual, menorTail(Tail, Head, Menor).
menorTail([_| Tail], MenorActual, Menor) :- menorTail(Tail, MenorActual, Menor).

/*
    ?- menor([1, 0, 3], M).
    M = 0 .

    ?- menor([1,-3, 2, -1], M).
    M = -3 .

    ?- menor([1, 1000, 3, 14, -45, -5000, 54], M).
    M = -5000 .

    ?- menorTail([1, 0, 3], 1.0Inf, M).
    M = 0 .

    ?- menorTail([1, -3, 2, -1], 1.0Inf, M).
    M = -3 .

    ?- menorTail([1, 1000, 3, 14, -45, -5000, 54], 1.0Inf, M).
    M = -5000 .
*/