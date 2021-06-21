% ====================
% Complete the following programs and submit your file to Canvas.
% ====================
% Do not change the names of the programs. 
% Do not change the number of elements in the clauses.
% If your file cannot be loaded by the Prolog interpreter, your submission may be cancelled. 
% Then, submit only code that works.
% ====================
% Grading instructions:
% There is a series of test cases for each program. In order to state that your program
% "works as described", your output must be similar to the expected one in each case.

:- use_module(library(bounds)).

% === duplicate ===

duplicate([], []).
duplicate([H|T], S) :- 
	duplicate(T, ST),
	S = [H, H | ST].

% === sum ===

sum([], 0).
sum([H|T], S) :- 
	is_list(H),
	sum(T, S).
sum([H|T], S) :-
	sum(T, ST),
	S is H + ST.

% === toBinaryString ===

toBinaryString(0, "0").
toBinaryString(1, "1").
toBinaryString(N, S) :-
	N1 is (N div 2),
	toBinaryString(N1, S1),
	S2 is (N rem 2),
	string_concat(S1, S2, S).

% === isort ===

insert(X, [], [X]).
insert(X, [YH | YT], LST) :-
	X < YH,
	LST = [X, YH | YT], !. 
insert(X, [YH | YT], LST) :- 
	X >= YH,
	insert(X, YT, L),
	LST = [YH | L], !.

isort([], []).
isort([XH|XT], Y) :- isort(XT, Z), insert(XH, Z, Y), !.

% === magicSquare ===

% |-------|
% | A B C |
% | D E F |
% | G H I |
% |-------|

msAux([X, Y, Z]) :-
	L = [1, 2, 3, 4, 5, 6, 7, 8, 9],
	member(X, L),
	member(Y, L),
	member(Z, L),
	all_different([X, Y, Z]),
	15 is X + Y + Z.

magicSquare([A, B, C, D, E, F, G, H, I]) :-
	msAux([A, B, C]),
	msAux([D, E, F]),
	msAux([G, H, I]),
	msAux([A, D, G]),
	msAux([B, E, H]),
	msAux([C, F, I]),
	msAux([A, E, I]),
	msAux([C, E, G]).

% === path ===

edge(a, c, 5).
edge(c, b, 6).
edge(c, d, 8).
edge(b, e, 8).
edge(d, e, 2).
edge(e, f, 3).
edge(e, g, 7).
edge(f, g, 1).

path(N, N, [N], 0).
path(NO, ND, P, C) :- 
	edge(NO, N1, C1),
	path(N1, ND, PT, CT),
	P = [NO | PT],
	C is C1 + CT.

start :-
	write("% === duplicate ==="), nl, 
	duplicate([], X1), % []
	write(X1), nl,
	duplicate([1, 2, 3], X2), % [1,1,2,2,3,3]
	write(X2), nl,
	duplicate(X3, [a, a, b, b]), % [a,b]
	write(X3), nl,
	write("% === sum ==="), nl, 
	sum([], X4), % 0
	write(X4), nl,
	sum([1, 2, 3, 4, 5, 6], X5), % 21
	write(X5), nl,
	sum([1, [2, 3], [4, 5, 6], 7], X6), % 8
	write(X6), nl,
	write("% === toBinaryString ==="), nl, 
	toBinaryString(0, X7), % 0
	write(X7), nl,
	toBinaryString(1, X8), % 1
	write(X8), nl,
	toBinaryString(32, X9), % 100000
	write(X9), nl,
	toBinaryString(572, X10), % 1000111100
	write(X10), nl,
	write("% === isort ==="), nl, 
	isort([1, -1, 2, 10, 3], X11), % [-1,1,2,3,10]
	write(X11), nl, 
	write("% === magicSquare ==="), nl, 
	magicSquare(X12), % Many answers, check the constraints. 
	write(X12), nl,
	write("% === path ==="), nl, 
	path(a, e, PathAE, CostAE), % [a,c,b,e], 19
	write(PathAE), write(", "), write(CostAE), nl,
	path(d, g, PathDG, CostDG), % [d,e,g], 9
	write(PathDG), write(", "), write(CostDG), nl, !.