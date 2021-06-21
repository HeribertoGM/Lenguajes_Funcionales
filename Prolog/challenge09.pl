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

% === cryptarithmetic ===

cryptarithmetic(T, W, O, F, U, R) :- 
	L = [1, 2, 3, 4, 5, 6, 7, 8, 9],
	member(O, L),
	member(W, L),
	member(T, L),
	member(R, L),
	member(U, L),
	member(F, L),
	C1 is (O + O) div 10,
	R is (O + O) rem 10,
	C2 is (W + W + C1) div 10,
	U is (W + W + C1) rem 10,
	F is (T + T + C2) div 10,
	O is (T + T + C2) rem 10, ! .
	

% === oldest ===

before(X, Y, L) :- nth1(X1, L, X), nth1(Y1, L, Y), X1 < Y1.
after(X, Y, L) :- before(Y, X, L).

oldest(S) :- 
	length(S, 5),
	member(julio, S),
	member(gloria, S),
	member(pablo, S),
	member(miguel, S),
	member(silvia, S),
	before(julio, gloria, S),
	before(julio, pablo, S),
	after(miguel, silvia, S),
	after(miguel, pablo, S),
	before(miguel, gloria, S),
	after(julio, silvia, S), !.

% === farthest ===

farthest(S) :- 
	length(L, 4),
	member(mova, L),
	member(taci, L),
	member(liru, L),
	member(dape, L),
	after(mova, taci, L),
	before(dape, liru, L),
	before(liru, taci, L),
	S = [mote | L], !.


% === familyIssues ===

next(X, Y, L) :- (nth1(1, L, X), length(L, Yi), nth1(Yi, L, Y), !); (nth1(1, L, Y), length(L, Xi), nth1(Xi, L, X), !).
next(X, Y, L) :- nth1(Xi, L, X), nth1(Yi, L, Y), (Xi is Yi - 1; Xi is Yi + 1), !.

familyIssues(S) :- 
	length(S, 7),
	member(ben, S),
	member(rey, S),
	member(luke, S),
	member(leia, S),
	member(han, S),
	member(anakin, S),
	member(palpatine, S),
	next(ben, rey, S),
	\+next(ben, luke, S),
	next(luke, leia, S),
	next(luke, han, S),
	\+next(luke, palpatine, S),
	next(palpatine, anakin, S),
	\+next(palpatine, leia, S),
	next(anakin, ben, S), !.
	

% === eightTowers ===

eightTowers(X1, X2, X3, X4, X5, X6, X7, X8) :- 
	L = [1, 2, 3, 4, 5, 6, 7, 8],
	member(X1, L),
	member(X2, L),
	member(X3, L),
	member(X4, L),
	member(X5, L),
	member(X6, L),
	member(X7, L),
	member(X8, L),
	all_different([X1, X2, X3, X4, X5, X6, X7, X8]).

start :-
	write("% === cryptarithmetic ==="), nl, 
	cryptarithmetic(T, W, O, F, U, R), % [1,3,2,0,6,4]
	Solution = [T, W, O, F, U, R],
	write(Solution), nl,
	write("% === oldest ==="), nl, 
	oldest(Ages), % [silvia,julio,pablo,miguel,gloria]
	write(Ages), nl,
	write("% === farthest ==="), nl, 
	farthest(Distance), % [dape,liru,taci,mova]
	write(Distance), nl,
	write("% === familyIssues ==="), nl, 
	familyIssues(Family), % [ben,rey,leia,luke,han,palpatine,anakin]
	write(Family), nl, 
	write("% === eightTowers ==="), nl, 
	eightTowers(X1, X2, X3, X4, X5, X6, X7, X8), %
	Board = [X1, X2, X3, X4, X5, X6, X7, X8],
	write(Board), nl, !.