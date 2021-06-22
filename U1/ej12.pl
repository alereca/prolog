/*
    Hacer un programa que permita ingresar un número y calcule su
    sumatoria, es decir, la suma de sus términos descontados en una unidad
    hasta llegar a cero. Por ejemplo, si el número ingresado fuera 5, se deberá
    calcular la sumatoria 5+4+3+2+1 e informar como resultado 15.
    suma(N,Sum).
    . N es el número ingresado (argumento de entrada).
    . Sum es el resultado calculado (argumento de salida).
*/

suma(0, 0).
suma(Num, SumatoriaHastaNum) 
    :- Num >= 0,
       NumAnt is Num - 1, 
       suma(NumAnt, SumatoriaHastaNumAnt), 
       SumatoriaHastaNum is Num + SumatoriaHastaNumAnt.
suma(Num, SumatoriaHastaNum) :-  Num < 0, SumatoriaHastaNum = 'Null'.

program :- 
    writeln('Hasta que numero desea calcular la sumatoria'), read(Num),
    suma(Num, SumatoriaHastaNum),
    writeln('Su sumatoria es: '), writeln(SumatoriaHastaNum),
    writeln('Indique si no desea continuar escribiendo "n" o "y" en caso contrario'), read(Cont),
    Cont \== n,
    program.

/*
    ?- program.
    Hasta que numero desea calcular la sumatoria
    |: -2.
    Su sumatoria es: 
    Null
    Indique si no desea continuar escribiendo "n" o "y" en caso contrario
    |: y.
    Hasta que numero desea calcular la sumatoria
    |: 0.
    Su sumatoria es: 
    0
    Indique si no desea continuar escribiendo "n" o "y" en caso contrario
    |: y.
    Hasta que numero desea calcular la sumatoria
    |: 1.
    Su sumatoria es: 
    1
    Indique si no desea continuar escribiendo "n" o "y" en caso contrario
    |: y.
    Hasta que numero desea calcular la sumatoria
    |: 2.
    Su sumatoria es: 
    3
    Indique si no desea continuar escribiendo "n" o "y" en caso contrario
    |: y.
    Hasta que numero desea calcular la sumatoria
    |: 3.
    Su sumatoria es: 
    6
    Indique si no desea continuar escribiendo "n" o "y" en caso contrario
    |: y.
    Hasta que numero desea calcular la sumatoria
    |: 4.
    Su sumatoria es: 
    10
    Indique si no desea continuar escribiendo "n" o "y" en caso contrario
    |: y.
    Hasta que numero desea calcular la sumatoria
    |: 10.
    Su sumatoria es: 
    55
    Indique si no desea continuar escribiendo "n" o "y" en caso contrario
    |: n.
    false.
*/