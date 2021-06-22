/* 
    9. Ingresar una lista de números enteros y calcular su promedio. Respetar
    el formato del predicado promedio(L,S,C) donde L es la lista ingresada,
    S la sumatoria y C el contador de los elementos de la lista.
*/

program :- writeln("Ingrese lista, finalizar con []"), leer(Lista)
            ,  promedio(Lista, S, C), Prom is S / C, writeln(Prom).

leer([Head | Tail]) :- read(Head), Head \= [] , leer(Tail).
leer([]).

promedio([], 0, 0).
promedio([Head| Tail], Sum, Cont) :- promedio(Tail, SumHastaAnterior, ContHastaAnterior)
                                    ,Sum is SumHastaAnterior + Head
                                    ,Cont is ContHastaAnterior + 1.                        
% Queda mas legible componiendo los predicados sum y count pero recorre la lista dos veces

/*
    ?- program.
    Ingrese lista, finalizar con []
    |: 1.
    |: 2.
    |: 3.
    |: [].
    2
    true .
    ?- program.
    Ingrese lista, finalizar con []
    |: 1.
    |: 3.
    |: 3.
    |: [].
    2.3333333333333335
    true .
*/
