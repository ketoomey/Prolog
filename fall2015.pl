%3
male(X).
female(X).
sibling(X,Y).
spouse(X,Y).
parent(X,Y).

nephew(X,Y) :- male(X), parent(Z,X), sibling(Z,Y).
nephew(X,Y) :- spouse(B,Y), nephew(X,B).

niece(X,Y) :- female(X), parent(Z,X), sibling(Z,Y).
niece(X,Y) :- spouse(B,Y), niece(X,B).

uncle(X,Y) :- male(X), parent(A,Y), sibling(A,X).
uncle(X,Y) :- male(X), aunt(A,Y), spouse(A,X).

aunt(X,Y) :- female(X), parent(A,Y), sibling(A,X).
aunt(X,Y) :- female(X), uncle(A,Y), spouse(A,X).

%4
cognate(X,Y) :- parent(X,Y).
cognate(X,Y) :- parent(A,X), cognate(A,Y).
cognate(X,Y) :- parent(A,Y), cognate(A,X).

%5
function(N,Z) :- function(N, 1, 0, F).
function(0,_,F,F).
function(N, E, Z, F) :- N > 0, Z1 is N*E+Z, N1 is N-1, E1 is E + 1, function(N1,E1,Z1,F).

%6
power(_,0,1).
power(M,N,Q) :- N>0, N1 is N-1, power(M, N1, Z), Q is M*Z.

log1(_,Q,0) :- Q=<1.
log1(M,Q,N) :- Q > 1, Q1 is Q div M, log1(M, Q1, Z), N is Z+1.

%7
eval1(true,true).
eval1(false,false).


%eleven
merge_sort([],[]).