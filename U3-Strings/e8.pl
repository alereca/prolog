/*
    9.  Ingresar  una  cadena,  contar  e  informar  el  número  de  veces  que 
    aparece  cada  una  de  las  vocales  (a,  e,  i,  o,  u)  y  la  cantidad  de 
    veces que aparece cualquier consonante. 
*/

count_char('', _, 0).
count_char(Cad, Char, Count) :- 
      sub_atom(Cad, 0, 1, _, Char), sub_atom(Cad, 1, _, 0, Sub)
    , count_char(Sub, Char, LastCount), Count is LastCount + 1.
count_char(Cad, Char, Count) :- 
      sub_atom(Cad, 1, _, 0, Sub)
    , count_char(Sub, Char, Count).

/*
?- count_char("armando ki", "e", C).
false.

?- count_char("armando kñqw", "e", C).
false.

?- count_char("aleee", "e", C).
C = 3 .

?- count_char("ealejandro e recalde", "e", C).
C = 5 .

?- count_char("alejandro e recalde", "e", C).
C = 4 .

?- count_char("alejandro recalde", "e", C).
C = 3 .

?- count_char("armando kie", "e", C).
C = 1 .
*/