/*
    Hacer un programa que permita ingresar un número y calcule la
    sumatoria de sus términos descontados en una unidad (hasta llegar a cero)
    pares e impares.
    suma(N,SumPares,SumImpares).
    . N es el número ingresado (argumento de entrada).
    . SumPares es uno de los resultados calculados (argumento de salida).
    . SumImpares es uno de los resultados calculados (argumento de salida).
*/

/* (***)
  Es muy importante enviar el otro argumento de sumatoria tmb, 
  para mantener el contexto en la proxima llamada de la funcion. 
  No usar "_" en lugar de enviar el valor
  Ya que al llegar a suma(0,0,0) solo quedara los valores de las vars para la seccion de impares 
  y luego se pierde cuando pase a la seccion pares
*/
suma(0, 0, 0).
suma(Num, SumPares, SumImpares) :- 
      Num >= 0
    , Mod is mod(Num, 2), Mod == 0
    , NumAnt is Num - 1 
    , suma(NumAnt, SumParesAnt, SumImpares) % (***)
    , SumPares is Num + SumParesAnt.
suma(Num, SumPares, SumImpares) :- 
      Num >= 0 
    , Mod is mod(Num, 2), Mod \= 0
    , NumAnt is Num - 1
    , suma(NumAnt, SumPares, SumImparesAnt) % (***)
    , SumImpares is Num + SumImparesAnt.

/*
?- suma(-4, S, SI).
false.
?- suma(4, S, SI).
S = 6,
SI = 4 .
?- suma(5, S, SI).
S = 6,
SI = 9 .
?- suma(10, S, SI).
S = 30,
SI = 25 .
*/