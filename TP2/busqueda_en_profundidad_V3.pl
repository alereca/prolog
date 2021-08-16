%%%%%%%%%%%% HECHOS %%%%%%%%%%%%

% vuelo(origen, destino, tiempo[min])
vuelo(salta, cordoba, 80).
vuelo(cordoba, formosa, 120).
vuelo(cordoba, rosario, 55).
vuelo(cordoba, neuquen, 100).
vuelo(cordoba, mendoza, 65).
vuelo(formosa, corrientes, 50).
vuelo(corrientes, posadas, 70).
vuelo(corrientes, parana, 57).
vuelo(corrientes, santa_fe, 93).
vuelo(posadas, parana, 85).
vuelo(santa_fe, rosario, 30).
vuelo(rosario, parana, 25).
vuelo(rosario, buenos_aires, 55).
vuelo(rosario, mendoza, 175).
vuelo(mendoza, buenos_aires, 85).
vuelo(mendoza, neuquen, 83).
vuelo(neuquen, buenos_aires, 90).
vuelo(neuquen, calafate, 65).
vuelo(buenos_aires, calafate, 115).
vuelo(buenos_aires, puerto_madryn, 75).


%%%%%%%%%%%% REGLAS COMPARTIDAS %%%%%%%%%%%%

% Función pertenece genérica
pertenece(X, [X|_]).
pertenece(X, [_|T]) :- pertenece(X, T).

% Presentación de la solución con un mejor formato
presentar([H|T], Tiempo) :- T \= [], write(H), write(", "), presentar(T, Tiempo).
presentar([H], Tiempo) :- write(H), write(". Tiempo total: "), write(Tiempo), writeln(" min.").

% Cálculo del tiempo total entre inicio y meta de una solución
sumar_tiempos([E1|[E2|T]], Suma) :- sumar_tiempos([E2|T], Total), sucesor(E1, E2, Tiempo), Suma is Total + Tiempo.
sumar_tiempos([_], 0).

% Generar el próximo estado (necesario para generar el siguiente sucesor)
sucesor(Estado, NuevoEstado, Tiempo) :- vuelo(Estado, NuevoEstado, Tiempo).
sucesor(Estado, NuevoEstado, Tiempo) :- vuelo(NuevoEstado, Estado, Tiempo).


%%%%%%%%%%%% REGLAS BÚSQUEDA EN PROFUNDIDAD %%%%%%%%%%%%

% Si el estado actual es la meta, devolver la ruta recorrida como solución
buscaRutaProfundidad(Estado, Estado, Ruta, Ruta).

% Generar un sucesor del estado actual. Si no fue visitado agregarlo a la ruta
buscaRutaProfundidad(Estado, Meta, Ruta, Solucion) :-
    sucesor(Estado, NuevoEstado, _),
    not(pertenece(NuevoEstado, Ruta)),
    buscaRutaProfundidad(NuevoEstado, Meta, [NuevoEstado|Ruta], Solucion).

% Búsqueda de ruta aplicando algoritmo de búsqueda en profundidad
calculaRutaProfundidad(Inicio, Meta) :-
    buscaRutaProfundidad(Inicio, Meta, [Inicio], Solucion),
    reverse(Solucion, SolucionFinal),
    sumar_tiempos(SolucionFinal, Tiempo),
    presentar(SolucionFinal, Tiempo).


%%%%%%%%%%%% REGLAS BÚSQUEDA EN ANCHURA %%%%%%%%%%%%

% Función concatenar genérica
concatenar([], Lista2, Lista2).
concatenar([H1|T1], Lista2, [H1|T3]) :- concatenar(T1, Lista2, T3).

% Expande el subárbol cuya raíz es el nodo actual
expandir([Estado|Ruta], NuevasRutas) :-
    findall([NuevoEstado,Estado|Ruta],
    (sucesor(Estado, NuevoEstado, _),
    not(pertenece(NuevoEstado, [Estado|Ruta]))), NuevasRutas).

% Si el estado actual es la meta, devolver la ruta recorrida como solución
buscaRutaAnchura([[Estado|Ruta]|_], Estado, [Estado|Ruta]).

% Generar un sucesor del estado actual. Si no fue visitado agregarlo a la ruta
buscaRutaAnchura([PrimerRuta|OtrasRutas], Meta, Solucion) :-
    expandir(PrimerRuta, NuevasRutas),
    concatenar(OtrasRutas, NuevasRutas, NuevaListaNodos),
    buscaRutaAnchura(NuevaListaNodos, Meta, Solucion).

% Búsqueda de ruta aplicando el algoritmo de búsqueda en anchura
calculaRutaAnchura(Inicio, Meta) :-
    buscaRutaAnchura([[Inicio]], Meta, Solucion), 
    reverse(Solucion, SolucionFinal),
    sumar_tiempos(SolucionFinal, Tiempo),
    presentar(SolucionFinal, Tiempo).


%%%%%%%%%%%% PROGRAMA PRINCIPAL %%%%%%%%%%%%

% Selector de operación
operacion(1, Inicio, Meta) :- calculaRutaProfundidad(Inicio, Meta), false.
operacion(1, Inicio, Meta) :- writeln("____________"), writeln(""), true.
operacion(2, Inicio, Meta) :- calculaRutaAnchura(Inicio, Meta), false.
operacion(2, Inicio, Meta) :- writeln("____________"), writeln(""), true.

% Menu principal
menu :- writeln("BIENVENIDO/A AL SISTEMA PLANIFICADOR DE VUELOS"), writeln(""),
writeln("Seleccione una opcion"),
writeln("1 - Obtener todos los itinerarios sin importar el orden"),
writeln("2 - Obtener todos los itinerarios ordenados por menor cantidad de trasbordos"),
writeln(""),
writeln("0 - Salir"),
writeln(""),
write("Opcion: "), read(Opcion),
Opcion >= 1, Opcion =< 2,
writeln(""), write("Ingrese ciudad origen: "), read(Inicio),
write("Ingrese ciudad destino: "), read(Meta),
writeln(""),
writeln("Itinerarios: "),
operacion(Opcion, Inicio, Meta),
menu.