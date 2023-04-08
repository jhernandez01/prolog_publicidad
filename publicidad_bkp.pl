/********************************************/
/**** Nombre_archivo: publicidad.pl       ****/
/**** Practica FIA Proyecto Prolog        ****/
/**** Tema: Publicadad de una empresa     ****/
/**** Tema: CUIDEMOS NUESTRO PLANETA      ****/
/**** Curso 22/23                         ****/
/**** Autor: Jorge Hernandez Chavez       ****/
/*********************************************/


%predicados dinamicos
%dynamic abolish/2, abolish_module_tables/1, insect/1, counter/1, nivel/1, publicidad/1, accion/1, acciones/1, titulo/1, nombre/1, contiene/1, handler/1.
:- dynamic nivel/1, publicidad/1, accion/1, acciones/1.


%hechos sin variables. Son dinamicas, se iran anadiendo hechos durante la realizacion del juego
acciones([anuncios]).
accion(anuncio).
%actor(iniciar).

%hechos 
hacer(publicidad,radio).
hacer(publicidad,tv).
hacer(publicidad,online).
hacer(publicidad,carteles).
hacer(publicidad,prensa).

%hechos con variable
%Actualiza la lista de las acciones realizadas.
anadir_accion(NUEVA_ACCION,LISTA_ACCIONES,[NUEVA_ACCION|LISTA_ACCIONES]).

%Constante para borrar la pantalla
borrarPantalla :- write('\033[2J').

%Agrega el nombre de la publicidad, solo es posible en el menu de inicio. Hecho con variable
nombre(X) :- nivel(inicio), assert(publicidad(X)).

%Hace una pausa hasta que el usuario pulse enter
pausar :- write("Presione la tecla ENTER para continuar..."),
          skip(10), skip(10), nl.

%Predicado recursivo, imprime la lista de acciones de publicidad realizadas
acciones_realizadas([])     :- write("Ninguna accion publicitaria realizada"), !.
acciones_realizadas([P|[]]) :- write(P), nl, !.
acciones_realizadas([P|R])  :- acciones_realizadas(R), write(P), nl.

% comprueba si la lista de accione contiene la accion introducida como parametro
contiene(_,[])              :- fail, !.
contiene(ACCION,[ACCION|_]) :- !.
contiene(ACCION,[_|RESTO])  :- contiene(ACCION,RESTO).

%Anade una nueva accion realizada a la base del conocimiento
agregar(ACCION) :- acciones(X),
				anadir_accion(ACCION,X,Y),
				retract(acciones(_)),
				assert(acciones(Y)).

%imprime una linea de separacion
separador :- write("----------------------------------------------------------------------------"), nl.

%predicado que muestra el inicio del juego
iniciar_publicidad :- borrarPantalla,
        assert(nivel(inicio)), nl,
        write('                                         '), nl, nl,
        write("                    UNED STUDIO          "), nl,
        write("                 TE AYUDA A LOGRAR       "), nl,
        write("                   TUS OBJETIVOS         "), nl,nl,nl,
		write("                    TEMA DEL DIA:        "),nl, 		
		write("           JUNTOS, CUIDEMOS NUESTRO PLANETA!!!"),nl,
		write('                                         '), nl, nl,
		write('Te presentamos los tipos de publicidad mas usado en la actualidad.'), nl, nl,
		write('       Radio, TV, Intenet, Prensa, Carteles, YouTube y Redes Sociales'), nl, nl,nl,
		separador, separador,
		write(' Introzca un nombre de publicidad, si es mas de una palabara'),nl,
		write(' por favor hacerlo entre comillas dobles, ejemplo: "El Planeta Tierra". '), nl,
		write(' Aaaah y no olvides de finalizarlo con un punto.'), nl,
		separador, separador, nl,
		read(Titulo),
		nombre(Titulo),
		retract(nivel(inicio)),
		assert(nivel(reproducir)), !.

%predicados que se ejecutan en forma secuencial de la reproduccion de la publicidad. Para realizar el objetivo los datos de los hechos nivel(X) deben estar metidos en la Base del conocimiento BC
% donde X se va incluyendo dinamicamente en la BC según se avanza en la repuduccion
% predicado de comienzo
cabecera(ACCION,Titulo):- nivel(reproducir),
        ACCION == reproducir,nl,
		%separador,
		write("FELICITACIONES, HAS ELEGIDO UN EXCELENTE TEMA!!!"), nl, nl,
		write("Elija una opcion para reproducir el anuncio: "),
		write(Titulo),nl, nl,
		retract(nivel(reproducir)),
		assert(nivel(1)),!.

%predicado que realiza la accion de mensaje del anuncio
menu(ACCION,Titulo) :- nivel(1),
        ACCION == anunciar,
        write("Seleccione una de las siguientes opciones de publicidad:"), nl, nl,
		write(" 1. Radio AM y FM"), nl,
		write(" 2. Online por internet"), nl,
		write(" 3. Prensa escrita"), nl,
		write(" 4. Carteles"), nl, 
		write(" 5. TV television"), nl,
		write(" 6. Listar reproducciones"), nl,
		write(" 0. Salir"), nl,nl,
		read(Opcion),
		ejecutar(Opcion,Titulo,anunciar).

%Definimos una regla para el menu de presentacion de las opciones de reproduccion.
ejecutar(Opcion, Titulo,anunciar) :-
		% esta opcion indica que si es igual a 1 se reproduce el los datos del mensaje
		%al terminar regresa al menu y presenta las opciones para elegir unna nueva.
		Opcion == 1, mensaje(anunciar,radio,Titulo), menu(anunciar,Titulo);
		Opcion == 2, mensaje(anunciar,online,Titulo), menu(anunciar,Titulo);
		Opcion == 3, mensaje(anunciar,prensa,Titulo), menu(anunciar,Titulo);
		Opcion == 4, mensaje(anunciar,carteles,Titulo), menu(anunciar,Titulo);
		Opcion == 5, mensaje(anunciar,tv,Titulo), menu(anunciar,Titulo);
		Opcion == 6, mensaje(listar), menu(anunciar,Titulo);
		%si el usuario elige 0 termina la aplicacion.
		Opcion == 0, true.		 

%Define los predicados que se realizan dependiendo del tipo de publicidad seleccionada. 
%opcion seleccionada radio
mensaje(anunciar,radio,Titulo) :-
		nl,nl,
        separador,
		write("Tema: "),write(Titulo),nl,
		separador,
		write("La "), write(radio),
		write(" es el mejor medio para anunciar y llegar a la gente."), nl,nl,
		write(" ... empeceeemos, nos ayudas a cuidar el planeta todos los dias"), nl,
		write("Reciclemos juntos el...!!! "), nl,
		write("- Plastico - Vidrio - Papel - Carton, etc."), nl,
		write("- Aceite usado - Residuos organicos - Materiales electricos"), nl,nl,
		write("Usemos los medios de transporte publicos: "),
		write("Metro y autboses"), nl, nl,nl,nl,
		%añade el tipo de accion de publicidad recibido como parametro
		assert(accion(anunciar)),
		agregar(radio), !.

%Define los predicados que se realizan dependiendo del tipo de publicidad seleccionada. 
%opcion seleccionada online
mensaje(anunciar,online,Titulo):-
		nl,nl,
        separador,
		write("Tema: "),write(Titulo),nl,
		separador,
		write("Miraaaaad que bonito anuncio nos muestra INTERNET."), nl,nl,
		write("Que Hermosas fotos!!! muestran a gente reciclando y llenando los contenedores con material reciclado"), nl,
		write("Limpiemos, las calles, los rios..."), nl,
		write("dice el articulo ¿Reciclemos juntos el..?"), nl,
		write("- Plastico - Vidrio - Papel - Carton, etc."), nl,
		write("- Aceite usado - Residuos organicos - Materiales electricos"), nl,nl,
		write("Gracias a todos por tener conciencia de cuidar el planeta!!!..."), nl, nl,
		%añade el tipo de accion de publicidad recibido como parametro
		assert(accion(anunciar)),	
		agregar(online), !.

%Define los predicados que se realizan dependiendo del tipo de publicidad seleccionada. 
%opcion seleccionada prensa
mensaje(anunciar,prensa,Titulo) :-
		nl,nl,
		separador,
		write("Tema: "),write(Titulo),nl,
		separador,
		write("Tema del dia en la PRENSA."), nl,nl,
		write("Hermosas imagenes muestran los residuos reciclados en los contenedores..."), nl,
		write("Limpiemos, las calles, los rios..."), nl,
		write("dice el articulo ¿Reciclemos juntos el..?"), nl,
		write("- Plastico - Vidrio - Papel - Carton, etc."), nl,
		write("- Aceite usado - Residuos organicos - Materiales electricos"), nl,nl,
		write("Gracias a todos por tener conciencia de cuidar el planeta!!!..."), nl, nl,
		%añade el tipo de accion de publicidad recibido como parametro
		assert(accion(anunciar)),	
		agregar(prensa), !.

%Define los predicados que se realizan dependiendo del tipo de publicidad seleccionada. 
%opcion seleccionada carteles
mensaje(anunciar,carteles,Titulo) :-
		nl,nl,
        separador,
		write("Tema: "), write(Titulo),nl,
		separador,
		write("Miraaaaad esos CARTELES que muestran imagenes de como cuidar el planeta, dice: "),nl,nl,
		write("reciclemos en casa, limpiemos las calles, los rios, consumir menos plásticos...."), nl,
		write("viajemos en transporte publico, Metro y autboses."), nl,
		write("Todos lo hacemos juntos!!!..."), nl, nl,
		%aniade el tipo de accion de publicidad recibido como parametro
		assert(accion(anunciar)),	
		agregar(carteles), !.

%Define los predicados que se realizan dependiendo del tipo de publicidad seleccionada. 
%opcion seleccionada online
mensaje(anunciar,tv,Titulo) :-
		nl,nl,
        separador,
		write("Tema: "),write(Titulo),nl,
		separador,
		write("Miraaaaad el anuncio de la TELE que dice."), nl,nl,
		write("Cuidemos el planeta, reciclemos juntos, los residuos de..."), nl,
		write("- Plastico - Vidrio - Papel - Carton, etc."), nl,
		write("- Aceite usado - Residuos organicos - Materiales electricos"), nl,nl,
		write("Gracias a todos por tener conciencia de cuidar el planeta!!!..."), nl, nl,
		%aniade el tipo de accion de publicidad recibido como parametro
		assert(accion(anunciar)),	
		agregar(tv), !.

%Predicado recursivo, para escribir la lista de acciones de publicidad realizadas en el fichero txt
escribir_acciones_realizadas([])     :- write("No existe ninguna accion para escribir"), !.
escribir_acciones_realizadas([P|[]]) :- escribir_fichero(P), nl, !.
escribir_acciones_realizadas([P|R])  :- escribir_acciones_realizadas(R), escribir_fichero(P), nl.

%guardar en un fichero txt los datos historicos visitados por el usuario
escribir_fichero(ACCION) :-
		open('c:/temp/output.txt',append,Out),
		write(Out,ACCION),
		write(Out,'.\n') ,
		close(Out).

%leer y mostrar por pantalla los datos historicos	

leer_fichero:-
    open('c:/temp/output.txt',read,In),
    repeat,
    read_line_to_codes(In,X),writef(" "),
    writef(X),nl,
    X=end_of_file,!,
    nl,
    close(In).

leer_fichero1:-
 		write(" "), nl, nl,
		separador,
		write("                   MOSTRAMOS DATOS HISTORCIOS VISITADOS     "), nl,
		separador,
		open('c:/temp/output.txt',read,Source),
        leer_data(Source,Data),
        close(Source),
	    write(Data),  nl.
   
	leer_data(Stream,[]):- 
		at_end_of_stream(Stream).

	leer_data(Stream,[X|L]):-
		\+  at_end_of_stream(Stream),
		read(Stream,X),
		leer_data(Stream,L).

%opcion 6 del los mensajes a mostrar 
mensaje(ACCION) :- ACCION == listar,
		write(" "), nl, nl,
		separador,
		separador,
		write("      LISTADO DE ANUNCIOS REALIZADOS "), nl,
		separador,
		separador,
		acciones(ACCIONES),
		acciones_realizadas(ACCIONES), nl,
		separador,
		%mejoras de la pec2 2023
		%mensaje los datos historicos
		%guardamos los datos historicos
		escribir_acciones_realizadas(ACCIONES), nl,
		%leermos los datos historicos
		leer_fichero, nl,
		write(" "), nl, nl.
						
%Predicado principal. Ejecuta secuencialmete con los predicados definidos previamnente
iniciar :- iniciar_publicidad, nl,
        separador,
        publicidad(Titulo),
		cabecera(reproducir,Titulo),
		menu(anunciar,Titulo),
		separador, nl,
		escribir_fichero,
		leer_fichero,
		pausar, nl.




					 
			  