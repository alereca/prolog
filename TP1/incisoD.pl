% Hechos
% Primera alternativa: seViajaDesdeHasta(CiudadOrigen, CiudadDestino).
seViajaDesdeHasta(1, 2).
seViajaDesdeHasta(1, 6).
seViajaDesdeHasta(6, 7).
seViajaDesdeHasta(3, 4).
seViajaDesdeHasta(3, 5).
seViajaDesdeHasta(5, 4).
seViajaDesdeHasta(5, 7).
seViajaDesdeHasta(6, 8).

% Segunda alternativa: seLlegaALaCiudadDesde(CiudadDestino, CiudadOrigen).
seLlegaALaCiudadDesde(2, 1).
seLlegaALaCiudadDesde(6, 1).
seLlegaALaCiudadDesde(7, 6).
seLlegaALaCiudadDesde(4, 3).
seLlegaALaCiudadDesde(4, 5).
seLlegaALaCiudadDesde(5, 3).
seLlegaALaCiudadDesde(7, 5).
seLlegaALaCiudadDesde(8, 6).

% Reglas
% conexionDesde(CiudadOrigen, CiudadDestino).
conexion(A, B):-seViajaDesdeHasta(A, B).
conexion(A, B):-seViajaDesdeHasta(A, Z), conexion(Z, B).

% Regla con alternativa 2
% conexionDesde(CiudadOrigen, CiudadDestino).
%conexionDesde(A, B):-seLlegaALaCiudadDesde(B, A).
%conexionDesde(A, B):-seLlegaALaCiudadDesde(B, Y), seLlegaALaCiudadDesde(Y, A).







