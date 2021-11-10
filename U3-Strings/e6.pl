/*
    6.  Hacer un programa que transforme un número entero a binario. 
*/

presentar([]).
presentar([Head| Tail]) :- write(Head), presentar(Tail).

to_bin(Num) :- to_bin_list(Num, BinList), reverse(BinList, CorrectOrderBin), presentar(CorrectOrderBin).

to_bin_list(1, [Head]) :- Head is 1.
to_bin_list(Num, [Head| Tail]) :- Div is Num // 2, Mod is mod(Num, 2), Head is Mod , to_bin_list(Div, Tail).

/*
    ?- to_bin(12).
    1100
    true .

    ?- to_bin(13).
    1101
    true .

    ?- to_bin(32).
    100000
    true .
*/