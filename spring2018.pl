%1
fun([],0).
fun([H|T], R) :- H > 0, 1 is H rem 2, fun(T,R1), R is R1+(H^4),!.
fun([H|T], R) :- fun(T,R).

%2
evalpoly([],_, 0).
evalpoly(P,V,R) :- evalpoly(P,V,0,R).
evalpoly([],_,_,0).
evalpoly([H|T],V,X,R) :- X1 is X + 1, evalpoly(T,V,X1,R1), R is H*(V^X) + R1.

%3
transpose([],[]).
transpose(M,[X|Y]):-  help(H,X,C), transpose(C,Y).

help([],_,_).

%5
parent(X,Y).
sibling(X,Y) = parent(Z,X), parent(Z,Y), \+ (X=Y).
%first_find_ancestor_at_K
ancestor(0,X,X).
ancestor(K,X,Y) :- K>0, parent(X,Z), K1 is K + 1, ancestor(K1,Z,Y)
%then_check_if_parents_are_sibling
cousin(K,X,Y) :- ancestor(K,A,X), ancestor(K,B,Y), sibling(A,B).

%6
evaluate(X,X) :- number(X).
evaluate(mul(X,Y), R) :- evaluate(X,A), evaluate(Y,B), R is A*B.
evaluate(add(X,Y), R) :- evaluate(X,A), evaluate(Y,B), R is A + B.
evaluate(sub1(X,Y), R) :- evaluate(X,A), evaluate(Y,B), R is A - B.
evaulate(neg(X), R) :- evaluate(X,A),  R is 0-A.
