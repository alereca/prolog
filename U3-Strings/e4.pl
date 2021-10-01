/*
    4.  Transformar una cadena en una lista de caracteres.
*/

to_list('', []).
to_list(Cadena, [Head| Tail]) :- sub_atom(Cadena, 0, 1, _, Head), sub_atom(Cadena, 1, _, 0, SubCadena) 
                                , to_list(SubCadena, Tail).


/*
    ?- to_list("Atom", L).
    L = ['A', t, o, m] .

    ?- to_list("AERRSEW", L).
    L = ['A', 'E', 'R', 'R', 'S', 'E', 'W'] .

    ?- to_list('Aqui no es', L).
    L = ['A', q, u, i, ' ', n, o, ' ', e|...] .

    ?- to_list('Aqui no es el lugar', L).
    L = ['A', q, u, i, ' ', n, o, ' ', e|...] 
*/