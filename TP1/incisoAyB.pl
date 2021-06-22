% HECHOS
% Primer alternativa: seViajaDesdeHasta(CiudadOrigen, CiudadDestino).
seViajaDesdeHasta(1, 2).
seViajaDesdeHasta(1, 6).
seViajaDesdeHasta(3, 4).
seViajaDesdeHasta(3, 5).
seViajaDesdeHasta(5, 4).
seViajaDesdeHasta(5, 7).
seViajaDesdeHasta(6, 7).

% Segunda alternativa: seLlegaALaCiudadDesde(CiudadDestino, CiudadOrigen).
seLlegaALaCiudadDesde(2, 1).
seLlegaALaCiudadDesde(6, 1).
seLlegaALaCiudadDesde(4, 3).
seLlegaALaCiudadDesde(5, 3).
seLlegaALaCiudadDesde(4, 5).
seLlegaALaCiudadDesde(7, 5).
seLlegaALaCiudadDesde(7, 6).

% Tercera alternativa: viajes(CiudadOrigen, CiudadesDestinos).
viajes(1, [2, 6]).
viajes(3, [4, 5]).
viajes(5, [4, 7]).
viajes(6, [7]).


% REGLAS --> conexion(CiudadOrigen, CiudadDestino).
% Regla para primer la alternativa
conexion(A, B) :- seViajaDesdeHasta(A, B).
conexion(A, B) :- seViajaDesdeHasta(A, Z), conexion(Z, B).

% Regla para la segunda alternativa
conexion_alternativa2(A, B) :- seLlegaALaCiudadDesde(B, A).
conexion_alternativa2(A, B) :- seLlegaALaCiudadDesde(B, Y), conexion(Y, A).

% Reglas para la tercera alternativa
pertenece([H|_], H).
pertenece([_|T], Elemento) :- pertenece(T, Elemento).

conexion_alternativa3(Origen, Destino) :- viajes(Origen, Lista), pertenece(Lista, Destino).
