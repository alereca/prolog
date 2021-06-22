% Hechos
% Primera alternativa: seViajaDesdeHasta(CiudadOrigen, CiudadDestino).
seViajaDesdeHasta(1, 2).
seViajaDesdeHasta(1, 6).
seViajaDesdeHasta(6, 7).
seViajaDesdeHasta(3, 4).
seViajaDesdeHasta(3, 5).
seViajaDesdeHasta(5, 4).
seViajaDesdeHasta(5, 7).
seViajaDesdeHasta(7, 6).

% Reglas
% conexion(CiudadOrigen, CiudadDestino).
conexion(A, B):-seViajaDesdeHasta(A, B).
conexion(A, B):-seViajaDesdeHasta(A, Z), conexion(Z, B).




