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

% === travelTime ===

travelTime(T) :- 
	A is 4,
	C is A - 1,
	B is 4 * C,
	T is 2 * B.


% === cellGames ===

before(X, Y, Solution) :- nth1(X1, Solution, X), nth1(Y1, Solution, Y),	X1 < Y1.
after(X, Y, Solution) :- before(Y, X, Solution).

cellGame(S) :- 
	length(S, 3),
	member(goku, S),
	member(gohan, S),
	member(vegeta, S),
	after(vegeta, gohan, S),
	before(goku, gohan, S).

% === ages ===

ages(J, L, F, Y) :- 
	between(1, 50, J), 
	between(1, 50, L),
	between(1, 50, F),
	J > 12,
	L > 12,
	F > 12,
	all_different([J, L, F]),
	46 is J + L + F,
	Y is (85 - (J + L + F)) div 3.

% === gardeningContest ===

gardeningContest(S) :- 
	length(S, 3),
	member([_, brooke], S),
	after([_, brooke], [vanity, _], S),
	after([_, brooke], [goldbush, _], S),
	S = [_, _, [quietness, _]],
	member([vanity, virginia], S),
	member([goldbush, tricia], S),
	S = [_, [_, tricia], _].

% === tournament ===

tournament(CA, A, T, R, C) :- 
	CA is 28,
	between(20, 28, A),
	between(20, 28, T),
	between(20, 28, R),
	between(20, 28, C),
	C > R,
	C > T,
	C < A,
	C is CA - 5,
	CA is A + 2 * (R - T).


% === zebra ===

right(X, Y, L) :- append(_, [X, Y|_], L).
next(X, Y, L):- right(X, Y, L) ; right(Y, X, L).

zebra(S) :- % color, owner, animal, cig, drink
	length(S, 5),
	member([red, english, _, _, _], S),
	member([_, spanish, dog, _, _], S),
	member([green, _, _, _, coffee], S),
	member([_, ukrainian, _, _, tea], S),
	next([green, _, _, _, _], [white, _, _, _, _], S),
	member([_, _, serpent, winston, _], S),
	member([yellow, _, _, kool, _], S),
	S = [_, _, [_, _, _, _, milk], _, _],
	S = [[_, norwegian, _, _, _], _, _, _, _],
	next([_, _, _, chesterfield, _], [_, _, fox, _, _], S),
	next([_, _, horse, _, _], [_, _, _, kool, _], S),
	member([_, _, _, lucky, juice], S),
	member([_, japanese, _, kent, _], S),
	next([_, norwegian, _, _, _], [blue, _, _, _, _], S),
	member([_, _, _, _, water], S),
	member([_, _, zebra, _, _], S), !.

start :-
	write("% === travelTime ==="), nl, 
	travelTime(Time), % 24
	write(Time), nl,
	write("% === cellGames ==="), nl, 
	cellGame(Order), % [goku,gohan,vegeta]
	write(Order), nl,
	write("% === ages ==="), nl, 
	ages(J, L, F, Y), % [14,17,15,13]
	Names = [J, L, F, Y], 
	write(Names), nl,
	write("% === gardeningContest ==="), nl, 
	gardeningContest(Results),
	write(Results), nl,
	write("% === tournament ==="), nl, 
	tournament(CruzAzul, America, Tigres, Rayados, Chivas), % [28,24,20,22,23]
	Teams = [CruzAzul, America, Tigres, Rayados, Chivas],
	write(Teams), nl,
	write("% === zebra ==="), nl, % [[norwegian,fox,kool,water,yellow],[ukrainian,horse,chesterfield,tea,blue],[english,snake,winston,milk,red],[japonese,zebra,kent,coffee,green],[spanish,dog,lucky,juice,white]]
	zebra(Solution),
	write(Solution), nl, !.