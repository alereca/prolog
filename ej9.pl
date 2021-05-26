/*
    Se tiene la siguiente base de hechos
    Donde hijo(X,Y) indica que X es hijo de Y.
    Definir la regla descendiente(A,B), la cual permite determinar si A es
    descendiente de B.
*/
hijo(roberto,carlos).
hijo(julio,roberto).
hijo(miguel,roberto).
hijo(juan,miguel).
hijo(jose,miguel).

descendiente(PersonaDescendiente, PersonaADescenderDe) :- hijo(PersonaDescendiente, PersonaADescenderDe).
descendiente(PersonaDescendiente, PersonaADescenderDe) 
    :- hijo(PersonaDescendiente, PadreDelDescendiente), descendiente(PadreDelDescendiente, PersonaADescenderDe).

/*
    ?- descendiente(miguel,juan).
    false.
    ?- descendiente(carlos, carlos).
    false.
    ?- descendiente(miguel,carlos).
    true .
    ?- descendiente(roberto, carlos).
    true .
    ?- descendiente(jose, carlos).
    true .
*/