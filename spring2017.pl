%2 
twist(X,X) :- atomic(X).
twist([H|T], R) :- twist(H,A), twist(T, B), append(B, [A], R).

%3
mysqrt(N,R) :- helper(N, 0, N, R).

helper(N, X, Y, R) :- N1 is div(X+Y, 2), N1*N1 > N, C is M-1, helper(N,X,C,R),!.
helper(N, X, Y, R) :- N2 is div(X+Y, 2)+1, N1*N1 =< N, C is M-1, helper(N,N2,Y,R),!.
helper(_,X,Y,M) :- M is div(X+Y,2).

%4
factorize(N,L) :- f_h(N,2,L).
f_h(N,M,[N]) :- M^2 > N,!.
f_h(N,M,[M|L]) :- 0 is mod(N,M), Q is div(N,M), f_h(Q,M,L),!.
f_h(N,M,L) :- M1 is M + 1, f_h(N, M1, L).

%5
countall([],0).
countall(X,1) :- atomic(X), \+ (X=[]).
countall([H|T], C) :- countall(H,A), countall(T,B), C is A+B.

%6
powerset([],[[]]).
powerset([H|T],R) :- powerset(T,L), p_h(H,L,K), append(K,L,R).

p_h(_,[],[]).
p_h(X,[H|T],[[X|H]|Z]):- p_h(X,T,Z).

%7
level(_,[],[]) :- !.
level(0,X,[X]) :- atomic(X).
level(0,[_|_],[]).
level(N,X,[]) :- N > 0, atomic(X).
level(N,[H|T],C) :- N>0, M is N-1, level(M,H,A), level(N,T,B), append(A,B,C).

%8
distinct([]).
distinct([H|T]):- \+ member(H,T), distinct(T). 

disjoint([],_).
disjoint([H|T],L2) :- \+ member(H,L2), disjoint(T,L2).


%9
sibling(X,Y).
spouse(X,Y).
parent(X,Y).

parent_in_law(X,Y) :- spouse(X,Z), parent(Y,Z).
sibling_in_law(X,Y) :- spouse(X,Z), sibling(Y,Z).
sibling_in_law(X,Y) :- spouse(Y,Z), sibling(X,Z).

%ten
step_parent(X,Y) :- spouse(X,Z), parent(Z,Y), \+ parent(X,Y).
half_sibling(X,Y) :- parent(Z, X), parent(Z,Y), \+ sibling(X,Y).
step_sibling(X,Y) :- parent(A,X), parent(B,Y), spouse(A,B), \+ sibling(X,Y).