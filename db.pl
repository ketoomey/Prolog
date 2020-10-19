not(A) :- call(A),!,fail.
not(_).

power(M,N,X) :- X is M ^ N.

my_last(X, [X]).
my_last(X, [_|T]) :- my_last(X,T).

element_at(X, [X|_], 1).
element_at(X, [_|T], Y) :- Y > 1, Y1 is Y-1, element_at(X,T,Y1).

num_elements([], 0).
num_elements([_|T], X) :- num_elements(T,X1), X is X1 + 1.

reverse_list(L1,L2) :- rev(L1,L2,[]).
rev([], L2, L2).
rev([H|T], L2, L3) :- rev(T, L2, [H|L3]).

palendrome(L1) :- reverse(L1,L1).

my_flatten([], RL).
my_flatten([H|T], RL) :- my_flatten(T, [RL|H]).

compress([],[]).
compress([H|T], Y) :- member(H,T),!, compress(T,Y).
compress([H|T],[H|Y]) :- not(member(H,T)), compress(T,Y).


split_2(X,Num,L1,L2) :- Count is 0, split_2(X,Num,L1,L2,Count).
split_2([],_,[],[],_).
split_2([H|T],Num,[H|L1],L2,Count) :- Count < Num,C is Count + 1, split_2(T,Num,L1,L2,C).
split_2([H|T],Num,L1,[H|L2],Count) :- Count >= Num,C is Count + 1, split_2(T,Num,L1,L2,C).

drop(L1, Num, X) :- Count is Num, drop(L1, Num, X, Count).
drop([H|T], Num, [H|X], Count) :- Count > 1, C is Count - 1, drop(T, Num, X, C).
drop([H|T], Num, X, Count) :- Count == 1, C is Num, drop(T, Num, X, C).
drop([],_,[],_).

slice(X,Min,Max,L) :- Count is 1, slice(X,Min,Max,L,Count).
slice([],_,_,[],_).
slice([H|T],Min,Max,[H|L],Count) :- Count =< Max, Count >= Min, !, C is Count + 1, slice(T,Min,Max,L,C).
slice([H|T],Min,Max,L,Count) :- C is Count + 1, slice(T,Min,Max,L,C).

remove_at(X,[H|T], Num, [H|R]) :- Num > 1, N is Num - 1, remove_at(X,T,N,R).
remove_at(H,[H|T], 1, R) :- N is 10, remove_at(X, T, N, R).
remove_at(X, [],_, []).

insert_at(E,[H|T], Num, [H|R]) :- Num > 1, N is Num - 1, insert_at(E,T,N,R).
insert_at(E,[H|T], 1, [E,H|R]) :- N is 10, insert_at(E, T, N, R).
insert_at(_,[],_,[]).

gcd(X,Y,F) :- gcd(X,Y,D,1,F).
gcd(X,Y,D,T,F) :- 0 is X rem T, 0 is Y rem T, X >= T, Y >= T, T1 is T + 1, gcd(X,Y,T,T1,F),!.
gcd(X,Y,D,T,F) :- X >= T, Y >= T, T1 is T + 1, gcd(X,Y,D,T1,F),!.
gcd(X,Y,F,T,F).

duplic([],[]).
duplic([H|T], [H,H|R]):- duplic(T,R).

dupliB([],[]).
dupliB([H|T], R):- append([H,H],R,R1), dupliB(T, R1).

