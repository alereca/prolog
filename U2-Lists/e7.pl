% 7. Ingresar una lista de elementos e informar cuántos elementos tiene.

% Se llega aqui cuando se termina de recorrer la lista
% dado que la variable contador es una var libre se le asigna el valor cero
size([], 0).
% Luego se va a ir resolviendo la pila desde el valor contadorHastaAnterior = 0
size([_| Tail], Contador) :- size(Tail, ContadorHastaAnterior), Contador is ContadorHastaAnterior + 1.                          



/*
    ?- size([1,2,3], S).
    S = 3.
    ?- size([1], S).
    S = 1.
    ?- size([], S).
    S = 0.
    ?- size([1,2,5, -4,88,66,454465,-889898,5,2,8,3,9], S).
    S = 13.
*/
