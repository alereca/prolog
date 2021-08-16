% 6. Ingresar una lista de números enteros y calcular la diferencia entre el
%    primero y el último de ellos.

diferencia_primer_ultimo(Lista, Diff) :- obtener_primero(Lista, Primero), obtener_ultimo(Lista, Ultimo)
                                , Diff is Primero - Ultimo.

obtener_primero([Head|_], Head).
obtener_ultimo([_|Tail], Elemento) 
    :- Tail \= [], obtener_ultimo(Tail, Elemento).
obtener_ultimo([Head|[]], Head).                                  

/*
    ?- diferencia_primer_ultimo([1,2,3], D).
    D = -2 .
    ?- diferencia_primer_ultimo([1,1], D).
    D = 0 .
    ?- diferencia_primer_ultimo([], D).
    false.
    ?- diferencia_primer_ultimo([3,1], D).
    D = 2 .
    ?- diferencia_primer_ultimo([-3,1], D).
    D = -4 .
    ?- diferencia_primer_ultimo([-3,1,2,-2], D).
    D = -1 .
*/
