% 5. Ingresar una lista de elementos y mostrar su último elemento.

mostrar_ultimo([_|Tail]) 
    :- Tail \= [], mostrar_ultimo(Tail).
mostrar_ultimo([Head|[]]) :- writeln(Head).

/*
    ?- mostrar_ultimo([1]).
    1
    true.
    ?- mostrar_ultimo([]).
    false.
    ?- mostrar_ultimo([1, 2]).
    2
    true .
    ?- mostrar_ultimo([1, 2, 3]).
    3
    true .
    ?- mostrar_ultimo([1, 2, 3, 4, 5, 7, 2, 10, 15, 20]).
    20
    true .
*/
