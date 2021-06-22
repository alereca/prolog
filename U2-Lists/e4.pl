% 4. Ingresar una lista de elementos y mostrar sus dos primeros elementos.

mostrar_primeros_n([Head|Tail], N) 
    :- N > 0, writeln(Head), N_next is N - 1, mostrar_primeros_n(Tail, N_next).
mostrar_primeros_n(_, 0).


