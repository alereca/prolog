% 8. Ingresar una lista de números enteros e informar cuánto da la
%    sumatoria de ellos.

% Se llega aqui cuando se termina de recorrer la lista
% dado que la variable Result es una var libre se le asigna el valor cero
sum([], 0).
% Luego se va a ir resolviendo la pila desde el valor Suma_hasta_anterior = 0
sum([Head| Tail], Result) :- sum(Tail, Suma_hasta_anterior), Result is Suma_hasta_anterior + Head.              

/*
    ?- sum([1],S).
    S = 1.
    ?- sum([],S).
    S = 0.
    ?- sum([1,2],S).
    S = 3.
    ?- sum([1,2,3],S).
    S = 6.
    ?- sum([1,2,3,5,-2,0,1],S).
    S = 10.
    ?- sum([-22, 0],S).
    S = -22.
*/
