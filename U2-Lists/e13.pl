/*
    13. Ingresar dos listas de elementos, concatenarlas (los elementos deben
    ser asignados de a uno en la lista de salida) y mostrarlas en una
    tercera.
*/

copy([Head| Tail], [Head | TailListaNueva]) :- copy(Tail, TailListaNueva).
copy([], []).

concat([H1|T1], L2, [H1|TN]) :- concat(T1, L2, TN).
concat([], [H2|T2], [H2 |TN]) :- concat([], T2, TN).
concat([], [], []).

concatenar([], L2, L2).
concatenar([H1|T1], L2, [H1| TN]) :- concatenar(T1, L2, TN).

/*
    ?- concat([1, 2, 3],[4, 5], L).
    L = [1, 2, 3, 4, 5] .

    ?- concat([],[4, 5], L).
    L = [4, 5] .

    ?- concat([1, 2, 3],[], L).
    L = [1, 2, 3].

    ?- concat([1],[1], L).
    L = [1, 1] .
*/