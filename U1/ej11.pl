/*
    Hacer un programa para calcular el factorial de un número.
    factorial(N,Fact).
    . N es el número ingresado (argumento de entrada).
    . Fact es el resultado calculado (argumento de salida).
*/
factorial(0, 1).
factorial(Num, FactorialDelNum) 
    :- Num >= 0,
       NumAnt is Num - 1
    ,  factorial(NumAnt, FactorialDelNumAnterior)
    ,  FactorialDelNum is Num * FactorialDelNumAnterior.

/*
?- factorial(-2, F).
false.
?- factorial(1, F).
F = 1 .
?- factorial(0, F).
F = 1 .
?- factorial(2, F).
F = 2 .
?- factorial(3, F).
F = 6 .
?- factorial(5, F).
F = 120 .
?- factorial(12, F).
F = 479001600 .
*/