/*
    Dada la siguiente estructura de hechos: 
    horoscopo(Signo,DiaInicio,MesIni,DiaFin,MesFin).  
    Por ejemplo:    horoscopo(aries,21,3,20,4).  
                    horoscopo(tauro,21,4,21,5). 
                    horoscopo(geminis,22,5,21,6).  
    Definir una regla del estilo signo(Dia, Mes, Signo) que permita:  
        a.  Ingresar  un  signo,  día  y  mes 
        y  me  informe  si  es correcto  ese  signo para esa fecha.  
        Ejemplo:  ?-signo(3,5,tauro).  ?-signo(23,4,aries).  
        b. Ingresar una fecha (día y mes) y me informe de qué signo soy.  
    Ejemplo:  ?-signo(16,12,Signo).  ?-signo(7,4,Signo).
*/
% horoscopo(Signo,DiaInicio,MesIni,DiaFin,MesFin).  
horoscopo(acuario,21,1,18,2).
horoscopo(piscis,19,2,20,3).
horoscopo(aries,21,3,20,4).
horoscopo(tauro,21,4,21,5).
horoscopo(geminis,22,5,21,6).
horoscopo(cancer,22,6,22,7).
horoscopo(leo,23,7,23,8).
horoscopo(virgo,24,8,23,9).
horoscopo(libra,24,9,23,10).
horoscopo(escorpio,24,10,22,11).
horoscopo(sagitario,23,11,21,12).
horoscopo(capricornio,22,12,20,1).

diasMes(1, 31).
diasMes(2, 29).
diasMes(3, 31).
diasMes(4, 30).
diasMes(5, 31).
diasMes(6, 30).
diasMes(7, 31).
diasMes(8, 31).
diasMes(9, 30).
diasMes(10, 30).
diasMes(11, 31).
diasMes(12, 31).



signo(Dia, Mes, Signo) :- horoscopo(Signo, DiaIni, MesIni, _, _)
                        , Mes == MesIni, Dia >= DiaIni
                        , diasMes(Mes, CantDias), Dia =< CantDias.
signo(Dia, Mes, Signo) :- horoscopo(Signo, _, _, DiaFin, MesFin)
                        , Mes == MesFin, Dia >= 1 , Dia =< DiaFin.

/*
    ?- signo(21, 12, sagitario).
    true.
    ?- signo(28, 8, Signo).
    Signo = virgo ;
    ?- signo(21, 12, Signo).
    Signo = sagitario ;
    ?- signo(22, 12, Signo).
    Signo = capricornio ;
    ?- signo(35, 8, Signo).
    false.
    ?- signo(0, 8, Signo).
    false.
    ?- signo(-2, 8, Signo).
    false.
*/