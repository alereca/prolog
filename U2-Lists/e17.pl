/*
    17. En una base de hechos hay un registro de personas y viajes realizados:
    persona(nombre, [lista ciudades visitó])
    Construir una regla que permita verificar si una persona visitó una
    determinada ciudad (datos de entrada: nombre persona y ciudad)
*/

persona(jaime, [rosario, parana, resistencia]).
persona(eduardo, [rosario, capital-federal, la-plata]).
persona(german, [salta, tucuman]).
persona(hernan, [salta, la-paz, quito, jujuy]).
persona(javier, [san-nicolas]).

pertenece([ItemBuscado| _], ItemBuscado).
pertenece([_| Tail], ItemBuscado) :- pertenece(Tail, ItemBuscado).

visito(Persona, Ciudad) :- persona(Persona, CiudadesVisitadas), pertenece(CiudadesVisitadas, Ciudad).

/*
    ?- visito(hernan, tucuman).
    false.

    ?- visito(hernan, salta).
    true .

    ?- visito(jaime, resistencia).
    true .

    ?- visito(javier, rosario).
    false.

    ?- visito(hernan, la-paz).
    true .
    ?- visito(P, salta).
    P = german ;
    P = hernan ;
*/