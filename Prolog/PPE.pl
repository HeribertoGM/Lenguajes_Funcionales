:- use_module(library(bounds)).

% === AuxFunctions ===

right(X, Y, L) :- append(_, [X, Y|_], L).
next(X, Y, L):- right(X, Y, L) ; right(Y, X, L).
before(X, Y, Solution) :- nth1(X1, Solution, X), nth1(Y1, Solution, Y),	X1 < Y1.
after(X, Y, Solution) :- before(Y, X, Solution).

% === chess ===

chess(E, C, L, S) :-
	between(1, 4, E),
	between(1, 4, C),
	between(1, 4, L),
	between(1, 4, S),
	E > L,
	C > L,
	S < C,
	S > E.

% === classes ===

classes(S) :-
	length(S, 3),
	member([_, steve], S),
	member([_, mary], S),
	member([_, robert], S),
	member([math, _], S),
	member([logic, _], S),
	member([programming, _], S),
	after([programming, mary], [logic, _], S),
	member([_, robert], S),
	S \= [[logic, _], _, _],
	S \= [[_, robert], _, _].

% === bags ===

bags(S) :-
	length(S, 3),
	member([pink, _], S),
	member([red, _], S),
	member([white, _], S),
	member([_, corn], S),
	member([_, sorghum], S),
	member([_, wheat], S),
	\+member([pink, corn], S),
	member([white, sorghum], S), !.

% === tmnt ===

tmnt(R, L, M, D) :-
	between(1,4,R),
	between(1,4,L),
	between(1,4,M),
	between(1,4,D),
	R > L,
	M > D,
	M < L.


% === escape ===

path(a, d, 10).
path(d, f, 4).
path(d, g, 11).
path(d, e, 12).
path(d, b, 5).
path(b, c, 3).
path(c, e, 4).
path(e, h, 1).
path(f, g, 3).
path(g, h, 7).

escape(N, N, [N], 0).
escape(NO, ND, P, C) :- 
	path(NO, N1, C1),
	escape(N1, ND, PT, CT),
	P = [NO | PT],
	C is C1 + CT,
	C < 25, 
	!.

% === pert ===

time(start, t1, 0).
time(t1, t2, 3).
time(t1, t3, 3).
time(t2, t4, 8).
time(t3, t4, 5).
time(t4, end, 4).

pert(N, N, [N], 0).
pert(NO, ND, P, C) :- 
	time(NO, N1, C1),
	pert(N1, ND, PT, CT),
	P = [NO | PT],
	C is C1 + CT,
	!.

start :-
	write("Prolog Practice Exam 1"), nl,
	write("% === chess ==="), nl, 
	chess(E, C, L, S),
	write([E, C, L, S]), nl, % [2,4,1,3]
	write("% === classes ==="), nl,
	classes(Classes),
	write(Classes), nl, % [[math,steve],[logic,robert],[programming,mary]]
	write("% === bags ==="), nl,
	bags(Bags),
	write(Bags), nl,
	write("% === tmnt ==="), nl,
	tmnt(Rap, Leo, Mic, Don),
	write([Rap, Leo, Mic, Don]), nl,
	write("% === escape ==="), nl,
	escape(a, h, PathEscape, CostEscape),
	write([a, h, PathEscape, CostEscape]), nl,
	write("% === pert ==="), nl,
	pert(start, end, PathPert, CostPert),
	write([start, end, PathPert, CostPert]), nl,
	!.