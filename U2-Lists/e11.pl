/*
    11. Ingresar una lista de enteros e informar cuál es el mayor de todos los
    números.
*/

comparar([Head| Tail], Elemento) :- Elemento > Head, comparar(Tail, Elemento).

mayor([Head| Tail], Mayor) :- mayor(Tail, Valor), Head > Valor, Mayor is Head.
mayor([Mayor| Tail], Mayor) :- mayor(Tail, Mayor).
mayor([Head| []], Head).