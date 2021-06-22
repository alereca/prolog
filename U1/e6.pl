/*
Escribir  un  programa  Prolog  que  ayude  a  un  organizador  a  armar  un festival,  
considerando  las  diferentes  bandas  de  música  que  se  pueden formar en cada ciudad.
  Para  formar  una  banda  son  necesarios  un  guitarrista,  un  cantante  y  un baterista.
 Se dispone de la siguiente información: 
    •Carolina y José son guitarristas y viven en Rosario.
    •Miguel es guitarrista y vive en Funes. 
    •Mariano es un cantante que vive en Rosario.  
    •Silvia es una cantante que vive en Funes. 
    •Eduardo es un baterista que vive en Roldán.  
    •Diego es un baterista que vive en Casilda.  
    •Laura es una baterista que vive en Rosario. 
    •Mauro es cantante y vive en Funes.
 El programa debe responder si en una ciudad (dato de entrada), se puede o no formar una banda. 
*/

/*
    Ya que es mas probable que una persona viva en un solo lugar y sepa tocar mas de un instrumento,
    de modo de no repetir la ciudad separe los hechos
*/

viveEn(carolina, rosario).
viveEn(jose, rosario).
viveEn(laura, rosario).
viveEn(mariano, rosario).
viveEn(miguel, funes).
viveEn(silvia, funes).
viveEn(mauro, funes).
viveEn(eduardo, roldan).
viveEn(diego, casilda).

es(carolina, guitarrista).
es(jose, guitarrista).
es(miguel, guitarrista).
es(mariano, cantante).
es(silvia, cantante).
es(mauro, cantante).
es(eduardo, baterista).
es(diego, baterista).
es(laura, baterista).

% Asumo que integrante 1,2 y 3 deben ser personas distintas
sePuedeFormarUnaBanda(Ciudad, Integrante1, Integrante2, Integrante3) :- viveEn(Integrante1, Ciudad), es(Integrante1, guitarrista)
                                , viveEn(Integrante2, Ciudad), es(Integrante2, cantante)
                                , viveEn(Integrante3, Ciudad), es(Integrante3, baterista)
                                , Integrante1 \= Integrante2, Integrante2 \= Integrante3
                                , Integrante1 \= Integrante3.


/*
?- sePuedeFormarUnaBanda(funes, I1, I2, I3).
false.

?- sePuedeFormarUnaBanda(rosario, I1, I2, I3).
I1 = carolina,
I2 = mariano,
I3 = laura ;
I1 = jose,
I2 = mariano,
I3 = laura ;
*/