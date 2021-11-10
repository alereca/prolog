/*
    1. Hacer un programa que permita definir las cuentas a pagar del mes (luz, 
    agua, alquiler, teléfono, cable, supermercado, etc.) de un grupo de 
    personas.  A  su  vez,  deberá  permitir  ingresar  el  nombre  de  una  de  ellas  e 
    informar de todos sus gastos.
*/

% gastos(grupo, servicio, mesaño, monto)
/* .txt
gastos([ale, juana, lidia], luz, 102021, 15000).
gastos([ale, marta], luz, 102021, 1010).
gastos([marta, luana], agua, 12021, 110).
gastos([ahmed, juan], luz, 102021, 457).
*/

:- dynamic gastos/4.

inicio :-
    writeln('Ingrese 1: agregar gasto, 2: obtener gasto o 3:salir'),
    read(Opt),
    Opt \= 3,
    abrir_base,
    option(Opt),
    inicio.
inicio :- write('adios').

option(1) :- agregar_gasto, guardar.
option(2) :- obtener_gasto.
option(_).

abrir_base :- consult('/home/ale/Documents/prolog/U4-Files&Functors/E1/e1-datos.txt').

ingresar_grupo([Persona| Tail]) :- read(Persona), Persona \= [], ingresar_grupo(Tail).
ingresar_grupo([]).

agregar_gasto :- 
    writeln('Ingresar grupo: '), ingresar_grupo(Grupo),
    writeln('Ingresar servicio: '), read(Servicio),
    writeln('Ingresar mes-año: '), read(MesAno),
    writeln('Ingresar monto'), read(Monto),
    assert(gastos(Grupo, Servicio, MesAno, Monto)).

pertenece(Elemento, [Elemento| _]).
pertenece(Elemento, [_| Tail]) :- pertenece(Elemento, Tail).

obtener_gasto :- 
    writeln("Ingresar persona del grupo"), read(Persona),
    gasto_persona(Persona).

gasto_persona(Persona) :-
    gastos(Grupo, Servicio, Fecha, Monto), pertenece(Persona, Grupo),
    write(Servicio),  write('-'), write(Fecha), write('-$'), writeln(Monto),
    retract(gastos(Grupo, Servicio, Fecha, Monto)),
    gasto_persona(Persona).
gasto_persona(_) :- consult('/home/ale/Documents/prolog/U4-Files&Functors/E1/e1-datos.txt').

guardar :- tell('/home/ale/Documents/prolog/U4-Files&Functors/E1/e1-datos.txt'), listing(gastos), told.

/*
    ?- inicio.
    Ingrese 1: agregar gasto, 2: obtener gasto o 3:salir
    |: 2.
    Ingresar persona del grupo
    |: marta.
    luz-102021-$1010
    agua-12021-$110
    Ingrese 1: agregar gasto, 2: obtener gasto o 3:salir
    |: 1.
    Ingresar grupo: 
    |: marta.
    |: carlos.
    |: ana.
    |: [].
    Ingresar servicio: 
    |: agua.
    Ingresar mes-año: 
    |: 112021.
    Ingresar monto
    |: 4000.
    Ingrese 1: agregar gasto, 2: obtener gasto o 3:salir
    |: 2.
    Ingresar persona del grupo
    |: marta.
    luz-102021-$1010
    agua-12021-$110
    agua-112021-$4000
    Ingrese 1: agregar gasto, 2: obtener gasto o 3:salir
    |: 2.
    Ingresar persona del grupo
    |: carlos.
    agua-112021-$4000
    Ingrese 1: agregar gasto, 2: obtener gasto o 3:salir
    |: 2.
    Ingresar persona del grupo
    |: ahmed.
    luz-102021-$457
    Ingrese 1: agregar gasto, 2: obtener gasto o 3:salir
    |: 3.
*/