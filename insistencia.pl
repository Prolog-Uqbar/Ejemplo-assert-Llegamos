:- dynamic variableLlegamos/1.
:- dynamic variableIncremental/1.
:- dynamic gano/1.


pais(uruguay).
pais(argentina).


variableIncremental(0).

llegamos:-
    not(variableLlegamos(_)),
    random(1,10,Random),
    assert(variableLlegamos(Random)),
    fail.

llegamos:-
    variableLlegamos(CantidadIteraciones),
    variableIncremental(CantidadIteraciones),
    retractall(variableIncremental(_)),
    retractall(variableLlegamos(_)),
    assert(variableIncremental(0)).

llegamos:-
    variableLlegamos(CantidadIteraciones),
    variableIncremental(Estado),
    Estado \= CantidadIteraciones,
    Nuevo is Estado+1,
    assert(variableIncremental(Nuevo)),
    retractall(variableIncremental(Estado)),
    fail.



prueba:-

    assert((gano(X):-variableLlegamos(X),variableIncremental(X))).

dado(1).
dado(2).
dado(3).

prueba2(X,Y):-
    dado(X),
    dado(Y),
    !,fail.

