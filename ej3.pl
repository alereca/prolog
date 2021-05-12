/*
    3. Escribir un programa Prolog que responda consultas acerca de cuáles son
    los rivales de una determinada selección en un campeonato mundial.
    Una selección tiene como rivales todos los otros equipos de su mismo
    grupo.
    Incluir en el programa la siguiente información:
    • El grupo 1 está formado por Brasil, España, Jamaica e Italia.
    • El grupo 2 está formado por Argentina, Nigeria, Holanda y Escocia.
    El programa debe ser capaz de responder a las siguientes consultas:
        a) ¿Son rivales Argentina y Brasil?
        b) ¿Cuáles son los rivales de un determinado equipo (por ejemplo
        Holanda)?
*/

grupo(brasil, 1).
grupo(espania, 1).
grupo(jamaica, 1).
grupo(italia, 1).


grupo(argentina, 2).
grupo(nigeria, 2).
grupo(holanda, 2).
grupo(escocia, 2).


/* \= http://www.cse.unsw.edu.au/~billw/dictionaries/prolog/comparison.html */
es_rival(Equipo, Rival) :- grupo(Equipo, NumeroEquipo), grupo(Rival, NumeroEquipo), Equipo
 \= Rival.

/*
Consultas
?- es_rival(holanda, Rival).
?- es_rival(argentina, nigeria).
?- es_rival(argentina, brasil).
*/
