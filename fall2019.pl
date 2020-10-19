%1
count(M,M,[M]).
count(M,N,[M|L]) :- M > N, M1 is M - 1, count(M1, N, L).
count(M,N,[M|L]) :- M < N, M1 is M + 1, count(M1, N, L).

%2 
sibling(X,Y).
spouse(X,Y).
parent(X,Y).
cousin(X,Y) :- parent(C,X), parent(K,Y), sibling(C,K).

%spouses_cousin
cousin_in_law(X,Y) :- spouse(X,S), cousin(S,Y).
%cousins_spouse
cousin_in_law(X,Y) :- cousin(X,S), spouse(S,Y).
%spouses_cousins_spouse
cousin_in_law(X,Y) :- spouse(X,S), cousin(S,C), spouse(C,Y).

%3
fun(A,B,C) :- C is 10*A+B.

foldl(_,Id,[],Id).
foldl(F,Id,[H|T],R) :- call(F,Id,H,X), foldl(F,X,T,R).

foldr(_,Id,[],Id).
foldr(F,Id,[H|T],R) :- foldr(F,Id,T,X), call(F,H,X,R).

%4
not(A) :- call(A),!,fail.
not(_).

set_ops([],Y,Y,[],[]).
set_ops([H|T],Y,U,[H|I],D) :- member(H,Y), set_ops(T,Y,U,I,D).
set_ops([H|T],Y,[H|U],I,[H|D]) :- not(member(H,Y)), set_ops(T,Y,U,I,D).

%5
