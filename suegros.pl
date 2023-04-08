%SIMULACION DE PREGUNTAS AUTOR: JORDI RAMON TUR*/

%HECHOS
temas([suegros, celos, vario, amor]).

% PREDICADOS
% PREDICADOS DE DESCRIPCION
descripcion(suegros):- 
    write('1. [suegros] Este tema es muy delicado,'),nl,
    write('debes tener cuidado!'),nl,!.
descripcion(celos):-
    write('2. [celos] Preguntas sobre la "amiguita",'),nl,
    write('vigila tus respuestas'),nl,!.
descripcion(vario):- write('3. [vario] Un poco de variedad!'),nl,!.
descripcion(amor):-
    write('4. [amor] De verdad?'),nl, write('---------------------------------------------'),nl,!.

%PREDICADO INICIAL
jugar:- inicio, menu.

%PREDICADO INICIO
inicio :- nl,nl,
    write(' PREGUNTAS Y RESPUESTAS DE PAREJA '),nl,
    write(' Gracias a la Inteligencia artificial, por fin podemos'),nl,
    write('hacer una simulacion de que deberiamos responder'),nl,
    write('en caso de ciertas preguntas complicadas de pareja'),nl,nl.

%PREDICADO MENU
menu:- nl,nl,
    write('---MENU PRINCIPAL---'),nl,
    write(' 1 - Listar preguntas'),nl,
    write(' 2 - Salir'),nl,
    read(M), opcion(M).
    
opcion(1):- tema.
opcion(2):- halt.
opcion(_):-write('Indique una opcion correcta'),nl,menu.

%PREDICADO TEMA
tema:-
    write('-----------------------------------'),nl,
    write('----------------TEMAS--------------'),nl,
    write('-----------------------------------'),nl,
    write('Elige un tema para la simulacion'),nl,nl,
    write('0. [atras]'),nl,nl,
    temas(P),
    mostrar(P),nl,
    read(TE), pregunta(TE).

%PREDICADO PARA MOSTRAR
mostrar([]).
mostrar([X|M]):- descripcion(X),nl,
mostrar(M).

% PREDICADOS TEMA VARIO
%------------------------------------------------------------------------------
inicioVario:-
    write('Huy, aqui hay una foto de tu ex. Que hago con ella?'),nl,
    write('1. Mujer, las fotos no se rompen, guardala'),nl,
    write('2. Rompela'),nl,
    read(PU), respuestaVarioU(PU).
mostrar(pregunta2VarioMal):-
    write('Que pasa?Que todavia te afecta cuando la ves?'),nl,
    write('1. No, pero para que guardar algo tan feo'),nl,
    write('2. Un poco si, solo hace 2 años y 36 dias de la ruptura'),nl,
    read(PD), respuestaVarioMD(PD).
mostrar(pregunta2VarioBien):-
    write('Ah no? Pues no se para que la quieres. Que pasa? Que te'),nl,
    write('vas a hacer un poster? Pues en esta foto esta horrible, ella'),nl,
    write('nunca ha sido mona, pero aqui tiene una cara pan..'),nl,
    write('Cariño, tu crees que estoy mas gorda?'),nl,
    write('(Cuidado, aqui debes reaccionar deprisa y sin dudas'),nl,
    write('1. Pueeeeees... no se, no.'),nl,
    write('2. No! No estas mas gorda!'),nl,
    read(PD), respuestaVarioBD(PD).
mostrar(pregunta3VarioMal):-
    write('Como que no lo sabes? Es que no se ve? Pues yo si que veo'),nl,
    write('que tu estas mas gordo! Que se te ha puesto la papada'),nl,
    write('como una saca de correos!'),nl.


    %PREDICADOS TEMA AMOR
%------------------------------------------------------------------------------
inicioAmor:-
    write('Me quieres como antes?'),nl,
    write('1. Claro, como desde el primer dia que te vi'),nl,
    write('2. Te quiero mas'),nl,
    read(PU), respuestaAmorU(PU).
mostrar(pregunta2Amor):-
    write('O sea, que no me quieres como antes, que no'),nl,
    write('podias vivir sin mi?'),nl,
    write('1. Estas exagerando un poco, claro que te quiero. Buenas noches'),nl,
    write('2. Siii'),nl,
    read(PD), respuestaAmorD(PD).
mostrar(pregunta3Amor):-
    write('Sii, que?'),nl,
    write('1. Que te quiero'),nl,
    write('2. De verdad, ya vale, quiero dormir'),nl,
    read(PT), respuestaAmorT(PT).

%PREDICADOS TEMA SUEGRO
%------------------------------------------------------------------------------
inicioSuegro :-
    write('Que intenciones tienes con mi hij@?'),nl,
    write('1. Quiero hacerl@ feliz'),nl,
    write('2. Es un rollo a corto plazo.'),nl,
    read(PU), respuestaSuegrosU(PU).
mostrar(pregunta2Suegro):-
    write('En que trabajas?'),nl,
    write('1. No trabajo actualmente, pero estoy estudiando'),nl,
    write('2. Ni trabajo ni estudio ni quiero'),nl,
    read(PD), respuestaSuegrosD(PD).
mostrar(pregunta3Suegro):-
    write('Fumas o bebes?'),nl,
    write('1. Una copita en fin de anno, soy sano'),nl,
    write('2. Fumo e intento beber siempre que tengo dinero'),nl,
    read(PT), respuestaSuegrosT(PT).

%PREDICADOS TEMA CELOS
%------------------------------------------------------------------------------
inicioCelos:-
    write('Te gusto el vestido que llevaba Maria?'),nl,
    write('1. Como era? No me fije'),nl,
    write('2. Si, me ha encantado'),nl,
    read(PU), respuestaCelosU(PU).
mostrar(pregunta2CelosMal):-
    write('-Entonces, te parece guapa?'),nl,
    write('(Danger! Peligro! Calavera con dos palitos!'),nl,
    write('1. Si, me parece un encanto'),nl,
    write('2. Ah, has dicho Marta? Pero si parece un calamar..'),nl,
    read(PD), respuestaCelosD(PD).
mostrar(pregunta2CelosBien):-
    write('Ah si? Y como iba yo vestida?'),nl,
    write('(A veces, no hay respuesta valida'),nl.
mostrar(pregunta3Celos):-
    write('Pues ahora que ha adelgazado está muy bien'),nl,
    write('1. Ya me he fijado, ahora esta guapisima'),nl,
    write('2. Que ha adelgazado? Pues como no sea de los codos!'),nl,
    read(PT), respuestaCelosT(PT).
mostrar(pregunta4Celos):-
    write('Pues la han elegido Miss Mundo'),nl,
    write('1. Estara comprado el jurado...'),nl,
    write('2. Vaya, y como dices que se apellida? Asi la busco en Facebook'),nl,
    read(PC), respuestaCelosC(PC).

    
%REGLAS CELOS
%------------------------------------------------------------------------------
preguntaCelos(inicioCelos):-inicioCelos.
preguntaCelos(inicioCelos, 1, pregunta2CelosBien):-  write('Respuesta buena'),nl, assert(acierto(1)), mostrar(pregunta2CelosBien), tema.
preguntaCelos(inicioCelos, 2, pregunta2CelosMal):- write('Respuesta mala'),nl, mostrar(pregunta2CelosMal).
preguntaCelos(pregunta2CelosMal, 2, pregunta3Celos):- write('Respuesta buena'),nl, assert(acierto(2)), mostrar(pregunta3Celos).
preguntaCelos(pregunta2CelosMal, 1, _):- write('Respuesta mala'),nl, retract(acierto(1)), tema.
preguntaCelos(pregunta3Celos, 1, _):- write('Respuesta mala'),nl, tema.
preguntaCelos(pregunta3Celos, 2, pregunta4Celos):- write('Respuesta buena'),nl,mostrar(pregunta4Celos).

preguntaCelos(pregunta4Celos, 1, tema):- write('Respuesta buena'),nl,tema.
preguntaCelos(pregunta4Celos, 2, tema):- write('Respuesta mala'),nl,tema.

% REGLAS AMOR
%------------------------------------------------------------------------------
preguntaAmor(inicioAmor):- inicioAmor.
preguntaAmor(inicioAmor, 1, tema):-
    write('Respuesta mala'),nl, assert(acierto(1)),tema.
preguntaAmor(inicioAmor, 2, pregunta2Amor):-
    write('Respuesta buena'),nl, assert(acierto(2)), mostrar(pregunta2Amor).
preguntaAmor(pregunta2Amor, 1, tema):-
    write('Respuesta mala'),nl, retract(acierto(2,1)), tema.
preguntaAmor(pregunta2Amor, 2, pregunta3Amor):-
    write('Respuesta buena'),nl, assert(acierto(3)), mostrar(pregunta3Amor).
preguntaAmor(pregunta3Amor, 1, inicioAmor):-
    write('Respuesta buena... y otra vez'),nl,inicioAmor.
preguntaAmor(pregunta3Amor, 2, tema):-
    write('Respuesta mala'), retract(acierto(3,2)),tema.

%REGLAS SUEGROS
%------------------------------------------------------------------------------
preguntaSuegros(inicioSuegro):-inicioSuegro.
preguntaSuegros(inicioSuegro, 1, pregunta2Suegro):-
    write('Respuesta buena'),nl, assert(acierto(1)),mostrar(pregunta2Suegro).
preguntaSuegros(inicioSuegro, 2, pregunta2Suegro):-
    write('Respuesta mala'),nl,mostrar(pregunta2Suegro).
preguntaSuegros(pregunta2Suegro, 1, pregunta3Suegro):-
    write('respuesta buena'),nl, assert(acierto(2)),mostrar(pregunta3Suegro).
preguntaSuegros(pregunta2Suegro, 2, pregunta3Suegro):-
    write('respuesta mala'),nl, retract(acierto(2, 1)),mostrar(pregunta3Suegro).
preguntaSuegros(pregunta3Suegro, 1, tema):-
    write('respuesta buena'),nl,tema.
preguntaSuegros(pregunta3Suegro, 2, tema):-
    write('respuesta mala'),nl,tema.

%REGLAS VARIOS
%------------------------------------------------------------------------------
%preguntaVarios(inicioVario):- inicioVario.
preguntaVarios(inicioVario, 1, pregunta2VarioBien):-
    write('Respuesta buena'),nl, assert(acierto(1)), mostrar(pregunta2VarioBien).
preguntaVarios(inicioVario, 2, pregunta2VarioMal):-
    write('Respuesta mala'),nl,mostrar(pregunta2VarioMal).
preguntaVarios(pregunta2VarioBien, 1, pregunta3VarioMal):-
    write('Respuesta mala'),nl, retract(acierto(1)),mostrar(pregunta3VarioMal),tema.
preguntaVarios(pregunta2VarioBien, 2, tema):-
    write('Respuesta buena'),nl, assert(acierto(2)),tema.
preguntaVarios(pregunta2VarioMal, 1, tema):-
    write('Respuesta buena'),nl, assert(acierto(3)),tema.
preguntaVarios(pregunta2VarioMal, 2, tema):-
    write('Respuesta mala'),nl, retract(acierto(2,1)),tema.

%REGLAS TIPO PREGUNTAS
%------------------------------------------------------------------------------
pregunta(0):- menu.
pregunta(1):-
    write('-----------------------------------------'),nl,
    write('------------- TEMA SUEGROS --------------'),nl,
    preguntaSuegros(inicioSuegro).
respuestaSuegrosU(1):- preguntaSuegros(inicioSuegro, 1, pregunta2Suegro).
respuestaSuegrosU(2):- preguntaSuegros(inicioSuegro, 2, pregunta2Suegro).
respuestaSuegrosD(1):- preguntaSuegros(pregunta2Suegro, 1, pregunta3Suegro).
respuestaSuegrosD(2):- preguntaCelos(pregunta2CelosMal, 2, pregunta3Celos).
respuestaSuegrosT(1):- preguntaCelos(pregunta3Celos, 1,_).
respuestaSuegrosT(2):- preguntaCelos(pregunta3Celos, 2, pregunta4Celos).
pregunta(2):-
    write('-----------------------------------------'),nl,
    write('------------- TEMA CELOS --------------'),nl,
    preguntaCelos(inicioCelos).
respuestaCelosU(1):- preguntaCelos(inicioCelos, 1, pregunta2CelosBien).
respuestaCelosU(2):- preguntaCelos(inicioCelos, 2, pregunta2CelosMal).
respuestaCelosD(1):- preguntaCelos(pregunta2CelosMal, 1, _).
respuestaCelosD(2):- preguntaCelos(pregunta2CelosMal, 2, pregunta3Celos).
respuestaCelosT(1):- preguntaCelos(pregunta3Celos, 1, tema).
respuestaCelosT(2):- preguntaCelos(pregunta3Celos, 2, pregunta4Celos).
respuestaCelosC(1):- preguntaCelos(pregunta4Celos, 1, tema).
respuestaCelosC(2):- preguntaCelos(pregunta4Celos, 2, tema).
pregunta(3):-
    write('-----------------------------------------'),nl,
    write('------------- TEMAS VARIOS --------------'),nl,
    preguntaVarios(inicioVario).
respuestaVarioU(1):- preguntaVarios(inicioVario, 1, pregunta2VarioBien).
respuestaVarioU(2):- preguntaVarios(inicioVario, 2, pregunta2VarioMal).
respuestaVarioMD(1):- preguntaVarios(pregunta2VarioMal, 1, tema).
respuestaVarioMD(2):- preguntaVarios(pregunta2VarioMal, 2, tema).
respuestaVarioBD(1):- preguntaVarios(pregunta2VarioBien, 1, pregunta3VarioMal).
respuestaVarioBD(2):- preguntaVarios(pregunta2VarioBien, 2, tema).
pregunta(4):-
    write('-----------------------------------------'),nl,
    write('------------- TEMA AMOR --------------'),nl,
    preguntaAmor(inicioAmor).
respuestaAmorU(1):- preguntaAmor(inicioAmor, 1, tema).
respuestaAmorU(2):- preguntaAmor(inicioAmor, 2, pregunta2Amor).
respuestaAmorD(1):- preguntaAmor(pregunta2Amor, 1, tema).
respuestaAmorD(2):- preguntaAmor(pregunta2Amor, 2, pregunta3Amor).
respuestaAmorT(1):- preguntaAmor(pregunta3Amor, 1, inicioAmor).
respuestaAmorT(2):- preguntaAmor(pregunta3Amor, 2, tema).
    
    