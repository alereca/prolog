/*
    3.  Ingresar una cadena de texto e informar cuántos caracteres tiene. 
    En  primer  lugar  haciendo  uso  del  predicado  atom_length/2  y  en 
    una segunda instancia utilizando sub_atom/5 de forma recursiva.  
*/

contar_caracteres_sa(Cadena, Cant) :- sub_atom(Cadena, 0, Cant, 0, _).

contar_caracteres(Cadena, Cant) :- atom_length(Cadena, Cant).

contar_caracteres_recursivo('', 0).
contar_caracteres_recursivo(Cadena, Cant) :- sub_atom(Cadena, 1, _, 0, SubCadena) ,contar_caracteres_recursivo(SubCadena, CantAcum), Cant is CantAcum + 1.


/*
    ?- contar_caracteres_recursivo('', C).
    C = 0 .

    ?- contar_caracteres_recursivo("a", C).
    C = 1 .

    ?- contar_caracteres_recursivo("Atom", C).
    C = 4 .

    ?- contar_caracteres_recursivo("Atomicccccccc", C).
    C = 13 .
*/