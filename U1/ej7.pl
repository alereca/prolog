menu :- writeln('Que opeacion desea realizar?'),
        writeln('1 - Suma'),
        writeln('2 - Resta'),
        writeln('3 - Multiplicacion'),
        writeln('4 - Division'),
        writeln('5 - Salir'),
        read(Opc),
        Opc \= 5,
        requerirNumeros(Opc),
        menu.
menu :- writeln('Adios').

requerirNumeros(Opc) :- Opc < 5, 
                        writeln('Ingrese el primer numero: '), read(N1),
                        writeln('Ingrese el segundo numero: '), read(N2),
                        opcion(Opc, N1, N2, Resultado),
                        writeln(Resultado).
requerirNumeros(Opc) :- Opc > 5, 
                        writeln('Operacion invalida').

opcion(1, N1, N2, Suma) :- Suma is N1 + N2.
opcion(2, N1, N2, Resta) :- Resta is N1 - N2.
opcion(3, N1, N2, Multiplicacion) :- Multiplicacion is N1 * N2.
opcion(4, N1, N2, Division) :- N2 \= 0, Division is N1 / N2.
opcion(4, _, _, Division) :- Division = 'Error: Division por cero'.

/*
?- menu.Division
    Que opeacion desea realizar?
    1 - Suma
    2 - Resta
    3 - Multiplicacion
    4 - Division
    5 - Salir
    |: 1.
    Ingrese el primer numero: 
    |: 1.
    Ingrese el segundo numero: 
    |: 0.
    1
    Que opeacion desea realizar?
    1 - Suma
    2 - Resta
    3 - Multiplicacion
    4 - Division
    5 - Salir
    |: 4.
    Ingrese el primer numero: 
    |: 1.
    Ingrese el segundo numero: 
    |: 0.
    Error: Division por cero
    Que opeacion desea realizar?
    1 - Suma
    2 - Resta
    3 - Multiplicacion
    4 - Division
    5 - Salir
    |: 6.
    Operacion invalida
    Que opeacion desea realizar?
    1 - Suma
    2 - Resta
    3 - Multiplicacion
    4 - Division
    5 - Salir
    |: 5.
    Adios
    true .
*/