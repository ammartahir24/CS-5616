
first_name(donald).
first_name(emily).
first_name(gregory).
first_name(hannah).
first_name(iris).

surname(didduck).
surname(lombardi).
surname(purpuri).
surname(swaboda).
surname(wong).

picture(shrub).
picture(horse).
picture(lighthouse).
picture(tugboat).
picture(sunset).

gender(male).
gender(female).

solve :-
    surname(Donalds), surname(Emilys), surname(Gregorys),surname(Hannahs), surname(Iriss),
    all_different([Donalds, Emilys, Gregorys, Hannahs, Iriss]),
    
    picture(Donaldspic), picture(Emilyspic),
    picture(Gregoryspic), picture(Hannahspic), picture(Irisspic),
    all_different([Donaldspic, Emilyspic, Gregoryspic, Hannahspic, Irisspic]),

    Triples = [ [donald, Donalds, Donaldspic, male],
                [emily, Emilys, Emilyspic, female],
                [gregory, Gregorys, Gregoryspic, male],
                [iris, Iriss, Irisspic, female],
                [hannah, Hannahs, Hannahspic, female] ],

    \+ member([iris,didduck,_,female],Triples),
    member([_,didduck,tugboat,_],Triples),
    \+ member([_,purpuri,sunset,female],Triples),
    member([_,_,sunset,female],Triples),
    \+ member([hannah, lombardi,_,female],Triples),
    \+ member([iris, lombardi,_,female],Triples),
    member([_,lombardi,horse,_],Triples),
    member([gregory, swaboda, _,male],Triples),
    \+ member([iris, _, shrub,female],Triples),
    \+ member([iris, _, sunset,female],Triples),
    \+ member([hannah, _, sunset,female],Triples),



    tell(donald, Donalds, Donaldspic),
    tell(emily, Emilys, Emilyspic),
    tell(gregory, Gregorys, Gregoryspic),
    tell(hannah, Hannahs, Hannahspic),
    tell(iris, Iriss, Irisspic).

all_different([H | T]) :- member(H, T), !, fail.
all_different([_ | T]) :- all_different(T).
all_different([_]).

tell(X, Y, Z) :-
    write('First name: '), write(X), write(' Last name: '), write(Y),
    write(' had picture '), write(Z), write('.'), nl.
  