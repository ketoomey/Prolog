%1
inner([],[],0).
inner([X|Xs],[Y|Ys],Z) :- inner(Xs,Ys,Z1), Z is X * Y + Z1.

%2
outer([],_,[]).
outer([X|Xs],Y,[C|D]) :- helper(X,Y,C), outer(Xs,Y,D).  

helper(_, [], []).
helper(X,[Y|Ys],[A|B]) :- A is X*Y, helper(X,Ys,B).

%3
scan([],[0]).
scan([H|T],[0|Q]):- scan(T,Y), add2(H,Y,Q).

add2(_,[],[]).
add2(X, [Y|Ys], [Z|Zs]):- Z is X+Y, add2(X,Ys,Zs).

%4
parent(x,y).
child(A,B) :- parent(B,A).
grandchild(A,B) :- parent(Y,A), parent(B,Y).
sibling(A,B) :- parent(Z,A), parent(Z,B), \+ A=B.
cousin(A,B) :- parent(X,A), parent(Y,B), sibling(X,Y).
ancestor(A,B) :- parent(A,B).
ancestor(A,B) :- parent(A,C), ancestor(C,B).
descendant(A,B) :- child(A,B).
descendant(A,B) :- child(A,C), descendant(C,B).

%6
prime(1).
prime(2).
prime(N) :- helper(2, N).

helper(N,N).
helper(X,N) :- X =< N, \+ (0 is rem(N,X)), X1 is X + 1, helper(X1,N).

%7 
selection_sort([H|T],Y).

%8
sublistSum(L,N,S).

%9
disjoint([],_).
disjoint([X|Xs],Y) :- help(X,Y), disjoint(Xs,Y).

help(_,[]).
help(X,[Y|Ys]):- \+ (X=Y), help(X,Ys).

%ten
diagonal([],[]).
diagonal(M,N) :- diagonal(M,N,0).

diagonal([M|Ms],N,0):- append([M],[],N), diagonal(Ms,N,1).
diagonal([M|Ms],N,X) :- X.


%eleven
eval1(num(X),X).
eval1(add(X,Y),Z) :- eval1(X,A), eval1(Y,B), Z is A+B.
eval1(sub1(X,Y),Z) :- eval1(X,A), eval1(Y,B), Z is A - B.
eval1(mul(X,Y),Z) :- eval1(X,A), eval1(Y,B), Z is A*B.
eval1(div(X,Y),Z) :- eval1(X,A), eval1(Y,B), Z is A/B.