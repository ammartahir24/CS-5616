
toy(flubsub).
toy(gribbet).
toy(jarix).
toy(wattin).

kid(andrew).
kid(dudley).
kid(georgina).
kid(karen).

feature(bubbles).
feature(colors).
feature(eyes).
feature(fins).

solve :-
    toy(Andrews), toy(Dudleys), toy(Georginas), toy(Karens),
    all_different([Andrews, Dudleys, Georginas, Karens]),
    
    feature(Andrewsfeat), feature(Dudleysfeat),
    feature(Georginasfeat), feature(Karensfeat),
    all_different([Andrewsfeat, Dudleysfeat, Georginasfeat, Karensfeat]),

    Triples = [ [andrew, Andrews, Andrewsfeat],
                [dudley, Dudleys, Dudleysfeat],
                [georgina, Georginas, Georginasfeat],
                [karen, Karens, Karensfeat] ],

    (  (\+ member([dudley, flubsub, _],Triples)) ;
       (\+ member([dudley, jarix, _],Triples))),

    \+ member([dudley, _, fins],Triples),

    \+ member([andrew, jarix, _],Triples),
    member([_,jarix,eyes],Triples),
    member([karen,wattin,_],Triples),
    \+ member([andrew,_,fins], Triples),
    \+ member([dudley,_,bubbles], Triples),
    
    tell(andrew, Andrews, Andrewsfeat),
    tell(dudley, Dudleys, Dudleysfeat),
    tell(georgina, Georginas, Georginasfeat),
    tell(karen, Karens, Karensfeat).

all_different([H | T]) :- member(H, T), !, fail.
all_different([_ | T]) :- all_different(T).
all_different([_]).

tell(X, Y, Z) :-
    write('Kid '), write(X), write(' got the '), write(Y),
    write(' toy with feature '), write(Z), write('.'), nl.
  