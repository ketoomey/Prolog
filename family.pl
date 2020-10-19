parent(kris, kennedy).
parent(kris, keegan).
parent(kris, brennan).

parent(paul, kennedy).
parent(paul, keegan).
parent(paul, brennan).

parent(jean, paul).
parent(thomas, paul).

parent(annette, kris).
parent(harry, kris).

male(paul).
male(thomas).
male(harry).
male(keegan).
male(brennan).

female(kennedy).
female(kris).
female(jean).
female(annette).

mother(X, Y) :- parent(X,Y), female(X).
father(X, Y) :- parent(X,Y), male(X).

child(X, Y) :- parent(Y,X), female(X).
daughter(X, Y) :- parent(Y,X), female(X).
son(X, Y) :- parent(Y,X), male(X).

sibling(X,Y) :- parent(Z,Y), parent(Z,X).
brother(X,Y) :- parent(Z,Y), parent(Z,X), male(X).
sister(X,Y) :- parent(Z,Y), parent(Z,X), female(X).

grandparent(X,Y) :- parent(X,Z), parent(Z,Y).
grandchild(X,Y) :- parent(Z,X), parent(Y, Z).