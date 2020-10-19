%1
invfact(F,R) :- invfact(F, 1, R).
invfact(F, A, A) :- F =< A, !.
invfact(F, A, R) :- F > A, B is A + 1, C is div(F,B), invfact(C,B,R).

%2
even_length([]).
even_length([_|T]) :- odd_length(T).

odd_length([_|T]) :- even_length(T).

%3
removeDup([],[]).
removeDup([H|T], Y) :- member(H,T),!, removeDup(T,Y).
removeDup([H|T],[H|Y]) :- not(member(H,T)), removeDup(T,Y).

%4
levelorder([],[]).
levelorder(X,X) :- atomic(X).
levelorder([H|T], L) :- levelorder(H,A), levelorder(T,B), append([A],B,L).

%5
convert(0,0).
convert(s(X), N) :- convert(X, M), N is M+1.

less(X,Y) :- convert(X, A), convert(Y,B), A < B.

add(X,0,0).
add(X,Y,R) :- convert(X,A), convert(Y,B).
