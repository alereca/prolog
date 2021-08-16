%vuelo(origen, destino, tiempo[min])
vuelo('Salta','Cordoba',80).
vuelo('Cordoba','Formosa',120).
vuelo('Cordoba','Rosario',55).
vuelo('Cordoba','Neuquen',100).
vuelo('Cordoba','Mendoza',65).
vuelo('Formosa','Corrientes',50).
vuelo('Corrientes','Posadas',70).
vuelo('Corrientes', 'Parana',57).
vuelo('Corrientes','Santa Fe',93).
vuelo('Posadas','Parana',85).
vuelo('Santa Fe','Rosario',30).
vuelo('Rosario','Parana',25).
vuelo('Rosario','Buenos Aires',55).
vuelo('Rosario','Mendoza',175).
vuelo('Mendoza','Buenos Aires',85).
vuelo('Mendoza','Neuquen',83).
vuelo('Neuquen', 'Buenos Aires',90).
vuelo('Buenos Aires','Calafate',115).
vuelo('Buenos Aires', 'Puerto Madryn',75).
vuelo('Neuquen','Calafate',65).


% *************** REGLAS **************** %
pertenece(X,[X|_]).
pertenece(X,[_|T]):-pertenece(X,T).

% Busqueda de ruta aplicando algoritmo de busqueda en profundidad
calculaRutaProf(Inicio, Meta):-
    buscaRuta(Inicio, Meta, [Inicio], Sol),
    reverse(Sol, SolFinal),
    write(SolFinal).

% Si el estado actual es la meta, devolver la ruta recorrida como solución
buscaRuta(Estado, Estado, Ruta, Ruta).

% Generar un sucesor del estado actual. Si no fue visitado agregarlo a la ruta
buscaRuta(Estado, Meta, Ruta, Sol):-
        sucesor(Estado, NuevoEstado),
        not(pertenece(NuevoEstado, Ruta)),
        buscaRuta(NuevoEstado, Meta, [NuevoEstado|Ruta], Sol).

% Generar el próximo estado
sucesor(Estado, NuevoEstado):- vuelo(Estado, NuevoEstado, _).
sucesor(Estado, NuevoEstado):- vuelo(NuevoEstado, Estado, _).

