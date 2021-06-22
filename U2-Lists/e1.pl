% 1. Ingresar una lista de elementos y mostrarla por pantalla.

armar_lista :- writeln("Ingrese lista, finalizar con []"), leer(Lista), writeln(Lista).

leer([Head | Tail]) :- read(Head), Head \= [] , leer(Tail).
leer([]).

/*
    ?- armar_lista.
    Ingrese lista, finalizar con []
    |: 1.
    |: 2.
    |: -2.
    |: [].
    [1,2,-2]
    true .
    ?- armar_lista.
    Ingrese lista, finalizar con []
    |: [].
    []
    true.
    ?- armar_lista.
    Ingrese lista, finalizar con []
    |: 1.
    |: [].
    [1]
    true .
*/
