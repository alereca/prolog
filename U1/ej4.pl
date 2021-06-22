/*
    4. Dados los siguientes predicados:
    hombre(unHombre).
    mujer(unaMujer).
    padres(persona, madre, padre).
        a. Construya una base de hechos con los miembros de su familia.
        b. Defina las siguientes reglas:
        • hermana/2, donde hermana(A,B) significa que A es hermana de B.
        • nieto/2, donde nieto(A,B) significa que A es el nieto de B.
        • abuelo/2, donde abuelo(A,B) significa que A es el abuelo de B.
        • tia/2, donde tia(A,B) significa que A es la tía de B. Esta regla
        definirla, en una primera instancia, valiéndose sólo de los hechos
        disponibles. En una segunda instancia, valiéndose de alguna otra
        regla que pudieron haber definido previamente.
*/
hombre(abraham).
hombre(homero).
hombre(herbert).
hombre(bart).
hombre(clancy).
mujer(mona).
mujer(jacqueline).
mujer(marge).
mujer(patty).
mujer(selma).
mujer(lisa).
mujer(maggie).
mujer(ling).
padres(homero, mona, abraham).
padres(herbert, mona, abraham).
padres(marge, jacqueline, clancy).
padres(patty, jacqueline, clancy).
padres(selma, jacqueline, clancy).
padres(bart, marge, homero).
padres(lisa, marge, homero).
padres(maggie, marge, homero).
padres(ling, selma, selma).

hermana(Hermana,Persona) :- mujer(Hermana), padres(Hermana, Madre, Padre), padres(Persona, Madre, Padre), Hermana \= Persona.

abuelo(Abuelo, Nieto) :- hombre(Abuelo), padres(Nieto, _, Padre), padres(Padre, _, Abuelo), Nieto \= Abuelo.
abuelo(Abuelo, Nieto) :- hombre(Abuelo), padres(Nieto, Madre, _), padres(Madre, _, Abuelo), Nieto \= Abuelo.

abuela(Abuela, Nieto) :- mujer(Abuela), padres(Nieto, _, Padre), padres(Padre, Abuela, _), Nieto \= Abuela.
abuela(Abuela, Nieto) :- mujer(Abuela), padres(Nieto, Madre, _), padres(Madre, Abuela, _), Nieto \= Abuela.

nieto(Nieto, Persona) :- hombre(Nieto), abuelo(Persona, Nieto). 
nieto(Nieto, Persona) :- hombre(Nieto), abuela(Persona, Nieto).

/*
tia(Tia, Sobrino) :- mujer(Tia), padres(Sobrino, Madre, _), padres(Madre,  Abuela, Abuelo), padres(Tia, Abuela, Abuelo), Madre \= Tia.
tia(Tia, Sobrino) :- mujer(Tia), padres(Sobrino, _, Padre), padres(Padre,  Abuela, Abuelo), padres(Tia, Abuela, Abuelo), Padre \= Tia.
*/

tia(Tia, Sobrino) :- mujer(Tia), padres(Sobrino, Madre, _), hermana(Tia, Madre), Madre \= Tia.
tia(Tia, Sobrino) :- mujer(Tia), padres(Sobrino, _, Padre), hermana(Tia, Padre), Padre \= Tia.


