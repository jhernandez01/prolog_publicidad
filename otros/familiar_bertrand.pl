padreomadre(katherine, bertrand). 
padreomadre(amberley, bertrand).
padreomadre(katherine, frank). 
padreomadre(amberley, frank).
padreomadre(katherine, rachel). 
padreomadre(amberley, rachel).
padreomadre(dora, kate). 
padreomadre(bertrand, kate).
padreomadre(dora, john). 
padreomadre(bertrand, john).
padreomadre(peter, conrad). 
padreomadre(bertrand, conrad).
mujer(katherine). hombre(amberley).
mujer(rachel). hombre(frank).
mujer(dora). hombre(bertrand).
mujer(peter).hombre(conrad).
mujer(kate). hombre(john).

%Supongamos que queremos definir una relacion de ancestro/2. Intuitivamente, una persona Mayor es ancestro
%de una persona Joven si estan conectados mediante una cadena de instancias de padreomadre/2 de longitud
%arbitraria. Podriamos intentar:

ancestro(Mayor, Joven):- padreomadre(Mayor, Joven).
ancestro(Mayor, Joven):- padreomadre(Mayor, Medio), padreomadre(Medio, Joven). 
ancestro(Mayor, Joven):- padreomadre(Mayor, Medio), padreomadre(Medio, Medio2), padreomadre(Medio2, Joven).

%Necesitariamos infinitas clausulas. Afortunadamente podemos definir la relacion recursivamente. Son ancestros de Joven:
ancestro(Mayor, Joven):- padreomadre(Mayor, Joven).
ancestro(Mayor, Joven):- padreomadre(Mayor, Medio), ancestro(Medio, Joven).
