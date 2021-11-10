/*
    3. Desarrollar un programa que permita definir los hábitos de:  
        • alimentación (comida, cantidad)  
        • bebida (bebida, cantidad)  
        • reproducción (época de reproducción, período de gestación)  
        • horas de sueño  
    
    de un conjunto de animales de un Zoo.  
    Dicha información se guardará en una base de datos.  
    El programa, deberá permitir:  
    a. Ingresar el nombre de un animal e informar de todos sus hábitos.  
    b. Ingresar un hábito e informar todos los animales que lo tiene
*/

%alimentacion(animal, comida, cantidad)
%bebida(animal, bebida, cantidad)
%reproduccion(animal, epoca, periodo)
%horas_suenio(animal, cantidad)

:- dynamic alimentacion/3.
:- dynamic bebida/3.
:- dynamic reproduccion/3.
:- dynamic horas_suenio/2.

inicio :-
    writeln('Ingrese 1: agregar habito, 2: obtener habitos de un animal, 3:obtener animales con cierto habito o 4:salir'),
    read(Opt),
    Opt \= 4,
    abrir_base,
    option(Opt),
    inicio.
inicio :- write('adios').

abrir_base :- consult('/home/ale/Documents/prolog/U4-Files&Functors/E3/e3-data.txt').

option(1) :- writeln("Ingresar 1: alimentacion, 2: bebida, 3: reproduccion, 4: horas sueño o 5: salir"), read(Opt), Opt \= 5, agregar_habito(Opt), guardar.
option(2) :- obtener_habitos_animal.
option(3) :- obtener_animales_con_habito.
option(_).

agregar_habito(1) :- 
    writeln('Ingresar animal: '), read(Animal),
    writeln('Ingresar comida: '), read(Comida),
    writeln('Ingresar cantidad: '), read(Cantidad),
    assert(alimentacion(Animal, Comida, Cantidad)).
agregar_habito(2) :- 
    writeln('Ingresar animal: '), read(Animal),
    writeln('Ingresar bebida: '), read(Bebida),
    writeln('Ingresar cantidad: '), read(Cantidad),
    assert(bebida(Animal, Bebida, Cantidad)).
agregar_habito(3) :- 
    writeln('Ingresar animal: '), read(Animal),
    writeln('Ingresar época de reproducción: '), read(Epoca),
    writeln('Ingresar período de gestación: '), read(Periodo),
    assert(reproduccion(Animal, Epoca, Periodo)).
agregar_habito(4) :- 
    writeln('Ingresar animal: '), read(Animal),
    writeln('Ingresar horas de sueño: '), read(Horas),
    assert(horas_suenio(Animal, Horas)).

% Esta estructura mediante predicados separados (con fail al final) permite que si el animal no cuenta con alguno de los habitos cargados
% el programa siga (es decir fuerza el backtracking para ver si tiene algun habito cargado). 
% Si estuviera todo con ANDs(,) cuando no tiene uno este se detiene (debido al fallo) y no muestra los siguientes habitos aunque los tuviera)
obtener_habitos_animal :-
    writeln('Ingresar animal: '), read(Animal), obtener_habitos_animal(Animal).
obtener_habitos_animal(Animal) :-
    alimentacion(Animal, Comida, CantidadAlimento), writeln('Comida '), write(Comida), write(' '), writeln(CantidadAlimento), fail.
obtener_habitos_animal(Animal) :-
    bebida(Animal, Bebida, CantidadBebida), writeln('Bebida '), write(Bebida), write(' '), writeln(CantidadBebida), fail.
obtener_habitos_animal(Animal) :-
    reproduccion(Animal, Epoca, Periodo), writeln('Epoca de reproducción '), writeln(Epoca), writeln('Periodo de gestacion'), writeln(Periodo), fail.
obtener_habitos_animal(Animal) :-
    horas_suenio(Animal, Horas), writeln('Horas de sueño '), writeln(Horas), fail.
obtener_habitos_animal(_).

obtener_animales_con_habito :- 
    writeln("Ingresar 1: alimentacion, 2: bebida, 3: reproduccion, 4: horas sueño o 5: salir"), read(Opt), Opt \= 5, listar_animales_con_habito(Opt).

listar_animales_con_habito(1) :- writeln('Ingresar comida: '), read(Comida), listar_animales_con_comida(Comida).
listar_animales_con_habito(2) :- writeln('Ingresar bebida: '), read(Bebida), listar_animales_con_bebida(Bebida).
listar_animales_con_habito(3) :- writeln('Ingresar época de reproducción: '), read(Epoca), listar_animales_con_reproduccion(Epoca).
listar_animales_con_habito(4) :- writeln('Ingresar horas de sueño: '), read(Horas), listar_animales_con_horas_suenio(Horas).

listar_animales_con_comida(Comida) :- 
    alimentacion(Animal, Comida, _),
    writeln(Animal),
    retract(alimentacion(Animal, Comida, _)),
    listar_animales_con_comida(1).
listar_animales_con_comida(_) :- abrir_base.

listar_animales_con_bebida(Bebida) :- 
    bebida(Animal, Bebida, _),
    writeln(Animal),
    retract(bebida(Animal, Bebida, _)),
    listar_animales_con_bebida(Bebida).
listar_animales_con_bebida(_) :- abrir_base.

listar_animales_con_reproduccion(Epoca) :- 
    writeln('Ingresar época de reproducción: '), read(Epoca),
    reproduccion(Animal, Epoca, _),
    writeln(Animal),
    retract(reproduccion(Animal, Epoca, _)),
    listar_animales_con_reproduccion(Epoca).
listar_animales_con_reproduccion(_) :- abrir_base.

listar_animales_con_horas_suenio(Horas) :- 
    writeln('Ingresar horas de sueño: '), read(Horas),
    horas_suenio(Animal, Horas),
    writeln(Animal),
    retract(horas_suenio(Animal, Horas)),
    listar_animales_con_horas_suenio(Horas).
listar_animales_con_horas_suenio(_) :- abrir_base.

guardar :- tell('/home/ale/Documents/prolog/U4-Files&Functors/E3/e3-data.txt'), listing(alimentacion)
, listing(bebida), listing(reproduccion), listing(horas_suenio), told.

/*
    ?- inicio.
    Ingrese 1: agregar habito, 2: obtener habitos de un animal, 3:obtener animales con cierto habito o 4:salir
    |: 3.
    Ingresar 1: alimentacion, 2: bebida, 3: reproduccion, 4: horas sueño o 5: salir
    |: 1.
    Ingresar comida: 
    |: mani.
    elefante
    Ingrese 1: agregar habito, 2: obtener habitos de un animal, 3:obtener animales con cierto habito o 4:salir
    |: 3.
    Ingresar 1: alimentacion, 2: bebida, 3: reproduccion, 4: horas sueño o 5: salir
    |: 2.
    Ingresar bebida: 
    |: agua.
    koala
    elefante
    Ingrese 1: agregar habito, 2: obtener habitos de un animal, 3:obtener animales con cierto habito o 4:salir
    |: 2.
    Ingresar animal: 
    |: elefante.
    Comida 
    mani 20 kg
    Bebida 
    agua 100 lt
    Epoca de reproducción 
    verano
    Periodo de gestacion
    22 meses
    Horas de sueño 
    2
    Ingrese 1: agregar habito, 2: obtener habitos de un animal, 3:obtener animales con cierto habito o 4:salir
    |: 1.
    Ingresar 1: alimentacion, 2: bebida, 3: reproduccion, 4: horas sueño o 5: salir
    |: 2.
    Ingresar animal: 
    |: perro.
    Ingresar bebida: 
    |: agua.
    Ingresar cantidad: 
    |: '20 lts'.
    Ingrese 1: agregar habito, 2: obtener habitos de un animal, 3:obtener animales con cierto habito o 4:salir
    |: 3.
    Ingresar 1: alimentacion, 2: bebida, 3: reproduccion, 4: horas sueño o 5: salir
    |: 2.
    Ingresar bebida: 
    |: agua.
    koala
    elefante
    perro
    Ingrese 1: agregar habito, 2: obtener habitos de un animal, 3:obtener animales con cierto habito o 4:salir
    |: 2.
    Ingresar animal: 
    |: perro.
    Bebida 
    agua 20 lts
*/