/*
    7.  Hacer un reconocedor de palabras de la forma a^nb^n. 
*/

all_same_char('', _).
all_same_char(Cad, ReqChar) :- sub_atom(Cad, 0, 1, _, Char), Char == ReqChar, sub_atom(Cad, 1, _, 0, Sub), all_same_char(Sub, ReqChar).

has_aNbN_format(Cad) :- 
      sub_atom(Cad, BStart, _, _, "b"), sub_atom(Cad, 0, BStart, _, SubBeforeB), all_same_char(SubBeforeB, 'a')
    , sub_atom(Cad, BStart, _, 0, SubAfterB), all_same_char(SubAfterB, 'b')
    , atom_length(SubBeforeB, LengthBeforeB), atom_length(SubAfterB, LengthAfterB), LengthBeforeB = LengthAfterB.

/*
    ?- has_aNbN_format("aaaabbb").
    false.

    ?- has_aNbN_format("aabbb").
    false.

    ?- has_aNbN_format("abbb").
    false.

    ?- has_aNbN_format("aaab").
    false.

    ?- has_aNbN_format("aaabbbbbbbbbbbbbbbbbbbbbbb").
    false.

    ?- has_aNbN_format("aaaaaaabbbbaaabbb").
    false.

    ?- has_aNbN_format("aaaaaaabbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaa").
    false.

    ?- has_aNbN_format("bbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").
    false.

    ?- has_aNbN_format("ab").
    true .

    ?- has_aNbN_format("aabb").
    true .

    ?- has_aNbN_format("aaaaaaabbbbbbb").
    true .
*/