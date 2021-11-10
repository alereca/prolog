/*
    5.  Transformar  una  cadena  de  texto  en  una  lista  de  palabras, 
    tomando como divisor el espacio. 
*/

to_word_list(Cadena, [Head| Tail]) :- sub_atom(Cadena, C, _, _, ' '), sub_atom(Cadena, 0, C, _, Head), NextWordIndex is C + 1
                                    ,  sub_atom(Cadena, NextWordIndex, _, 0, CadenaRestante), to_word_list(CadenaRestante, Tail).
to_word_list(Word, [Word]) :- Word \= ''.

/*
    ?- to_word_list("aqui no es", L).
    L = [aqui, no, es] .

    ?- to_word_list("aqui no es ", L).
    L = [aqui, no, 'es '] .

    ?- to_word_list("aqui no es el bendito lugar", L).
    L = [aqui, no, es, el, bendito, lugar] .
*/