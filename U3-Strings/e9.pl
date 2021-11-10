/*
    9.  Ingresar  una  cadena,  contar  e  informar  el  número  de  veces  que 
    aparece  cada  una  de  las  vocales  (a,  e,  i,  o,  u)  y  la  cantidad  de 
    veces que aparece cualquier consonante. 
*/

contar_char('', _, 0).
contar_char(Cad, Char, Count) :- 
      sub_atom(Cad, 0, 1, _, Char), sub_atom(Cad, 1, _, 0, Sub)
    , contar_char(Sub, Char, LastCount), Count is LastCount + 1.
contar_char(Cad, Char, Count) :- 
      sub_atom(Cad, 1, _, 0, Sub)
    , contar_char(Sub, Char, Count).

vocales(["a", "e", "i", "o", "u"]).
consonantes(["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "ñ", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"]).

contar_caracter_de_lista(_, []).
contar_caracter_de_lista(Cad, [Head| Tail]) :- 
      contar_char(Cad, Head, Count), write(Head), write(":"), write(Count), write(" ")
    , contar_caracter_de_lista(Cad, Tail).

contar_vocales_y_consonantes(Cad) :- 
      writeln("Vocales")
    , vocales(LV), contar_caracter_de_lista(Cad, LV)
    , writeln("\nConsonantes")
    , consonantes(LC) , contar_caracter_de_lista(Cad, LC).

/*
    Vocales
    a:1 e:1 i:0 o:0 u:0 
    Consonantes
    b:0 c:0 d:0 f:0 g:0 h:0 j:0 k:0 l:1 m:0 n:0 ñ:0 p:0 q:0 r:0 s:0 t:0 v:0 w:0 x:0 y:0 z:0 
    true.

    ?- contar_vocales_y_consonantes("aeiou abcdefghijklmñopqrstuvwxyz").
    Vocales
    a:2 e:2 i:2 o:2 u:2 
    Consonantes
    b:1 c:1 d:1 f:1 g:1 h:1 j:1 k:1 l:1 m:1 n:0 ñ:1 p:1 q:1 r:1 s:1 t:1 v:1 w:1 x:1 y:1 z:1 
    true .

    ?- contar_vocales_y_consonantes("d").
    Vocales
    a:0 e:0 i:0 o:0 u:0 
    Consonantes
    b:0 c:0 d:1 f:0 g:0 h:0 j:0 k:0 l:0 m:0 n:0 ñ:0 p:0 q:0 r:0 s:0 t:0 v:0 w:0 x:0 y:0 z:0 
    true .
*/