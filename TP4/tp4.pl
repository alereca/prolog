% caracteristica(Codigo, Descripcion)
caracteristica(1, 'Su uso será para juegos?').
caracteristica(2, 'Su uso será para trabajo?').
caracteristica(3, 'Su uso será para tareas simples como navegar en la web u ofimática básica?').
caracteristica(4, 'Se busca algo gama baja al mínimo costo posible?').
caracteristica(5, 'Se busca algo gama media con la mejor relación costo/rendimiento?').
caracteristica(6, 'Se busca algo gama alta que cuente con el mayor rendimiento posible?').
caracteristica(7, 'Se prefiere una mayor velocidad para el arranque y en general?').
caracteristica(8, 'Se antepone mayor capacidad de almacenamiento de menor costo?').
caracteristica(9, 'Se requieren realizar tareas de arquitectura y diseño?').
caracteristica(10, 'Son necesarias amplias capacidades de virtualización?').
caracteristica(11, 'Se cuenta con poco espacio físico para ubicar la computadora?').
caracteristica(12, 'Se cuenta con bastante espacio físico para ubicar la computadora?').

% disco_duro(MarcaModelo, Caracteristicas)
disco_duro('hdd 500 gb', [3, 8, 4]).
disco_duro('hdd 1 tb', [3, 8, 5]).
disco_duro('ssd 240 gb + hdd 1tb', [1, 2, 5, 8]).
disco_duro('ssd 1 TB', [1, 2, 6, 7]).

% cpu(MarcoModelo, Caracteristicas)
cpu('i3 10105F', [3, 4]).
cpu('ryzen 3600', [1, 3, 5]).
cpu('xeon E5 2407', [2, 5]).

% mother(MarcaModelo, Cpu, Factor, Caracteristicas) 
mother('am4', 'ryzen 3600', 'atx', [12]).
mother('am4', 'ryzen 3600', 'micro atx', [11]).
mother('fcla1200', 'i3 10105F', 'micro atx', [11]).
mother('fcla1200', 'i3 10105F', 'atx', [12]).
mother('lga 1356', 'xeon E5 2407', 'atx', [12]).

% gabinete(MarcaModelo, Factor)
gabinete('coolermaster Masterbox Q500l', 'atx').
gabinete('thermaltake Versa H17', 'micro atx').

% placa_video(MarcaModelo, Caracteristicas)
placa_video('GTX 750 ti',[1,4]).
placa_video('GTX 1050 ti',[1,5]).
placa_video('RTX 3080',[1,2,6,9]).

% fuente(Fuente, PlacaVideo)
fuente('450w', 'GTX 750 ti').
fuente('500w', 'GTX 1050 ti').
fuente('600w', 'RTX 3080').

% ram(Capacidad, Caracteristicas)
ram('8 gb', [3, 4]).
ram('16 gb', [1, 2, 5]).
ram('32 gb', [1, 2, 6, 10]).

pertenece([ItemBuscado| _], ItemBuscado).
pertenece([_| Tail], ItemBuscado) :- pertenece(Tail, ItemBuscado).

es_sublista([], _).
es_sublista([Head1|Tail1], List2) :- pertenece(List2, Head1), es_sublista(Tail1, List2).

% computadora([Gamer, Work, Casual, Gama, Almacenamiento, GranVirtualizacion, TareasDiseño, EspacioFisico, Gabinete, ConMonitor, ConPerifericos]) := disco_duro(Resultado, 
computadora(Usos, Gama, Almacenamiento, TareasAvanzadas, EspacioFisico) :- 
      disco_duro(Disco, CDisco), es_sublista(Usos, CDisco), pertenece(CDisco, Gama), pertenece(CDisco, Almacenamiento)
    , cpu(Cpu, CCpu), es_sublista(Usos, CCpu), pertenece(CCpu, Gama)
    , mother(Mother, Cpu, Factor, CMother), pertenece(CMother, EspacioFisico)
    , gabinete(Gabinete, Factor)
    , placa_video(Gpu, CGpu), es_sublista(Usos, CGpu), pertenece(CGpu, Gama)
    , fuente(Fuente, Gpu)
    , ram(Ram, CRam), es_sublista(Usos, CRam), pertenece(CRam, Gama)
    , write('PC recomendada: '), write(Mother), write(Cpu), write(Gpu), write(Disco), write(Ram), write(Fuente), write(Gabinete).

