/*
    Definir la regla requiere_de(X,Y), la cual permite saber si para la ejecución
    de la tarea Y se requiere tener finalizada la tarea X
*/
% La tarea $1 depende directamente de $2, cambio el orden de esta manera porque me parece mas entendible
depende_directamente_de(j, i).
    depende_directamente_de(i, e).
    depende_directamente_de(e, d).
    depende_directamente_de(d, c).
        depende_directamente_de(c, a).
    depende_directamente_de(d, b).
depende_directamente_de(j, h).
    depende_directamente_de(h, e).
depende_directamente_de(j, g).
    depende_directamente_de(g, f).
    depende_directamente_de(f, b).

% permite saber si para la ejecución
% de la tarea Y se requiere tener finalizada la tarea X
requiere_de(TareaDependiente, TareaADepender) 
    :- depende_directamente_de(TareaDependiente, TareaADepender).
requiere_de(TareaDependiente, TareaADepender) 
    :- depende_directamente_de(TareaDependiente, TareaIntermedia), requiere_de(TareaIntermedia, TareaADepender).

/*
?- requiere_de(h, f).
false.
?- requiere_de(f, d).
false.
?- requiere_de(h, h).
false.
?- requiere_de(f, b).
true .
?- requiere_de(i, a).
true .
?- requiere_de(h, b).
true .
?- requiere_de(d, Quien).
Quien = c ;
Quien = b ;
Quien = a ;
?- requiere_de(Depende, b).
Depende = d ;
Depende = f ;
Depende = j ; J se repite 3 veces porque hay tres formas de llegar desde B a esta tarea
Depende = i ;
Depende = e ;
Depende = j ;
Depende = h ;
Depende = j ;
Depende = g ;
false.
*/

