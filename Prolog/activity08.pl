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

% === square ===

square([], []).
square([H|T], [H2|T2]) :- 
	H2 is (H * H),
	square(T, T2).

% === sumFirst ===

sumFirst(0, 0).
sumFirst(N, X0) :- 
	N1 is N - 1,
	sumFirst(N1, X1),
	X0 is N + X1.

% === xLength ===

xLength([], 0).
xLength([_|T], L) :- 
	xLength(T, LT),
	L is 1 + LT.

% === nLength ===

nLength([], 0).
nLength([H|T], L) :-
	is_list(H),
	nLength(H, LH),
	nLength(T, LT),
	L is LH + LT.
nLength([_|T], L) :- 
	nLength(T, LT),
	L is 1 + LT.

% === dotProduct ===

dotProduct([], [], 0).
dotProduct([H1|T1], [H2|T2], S) :- 
	dotProduct(T1, T2, ST),
	S is (H1 * H2) + ST.

start :-
	write("% === square ==="), nl, 
	square([1, 2, 3, 4], X1), % [1,4,9,16]
	write(X1), nl,
	square([1], X2), % [1]
	write(X2), nl,
	square([1, 2, 3, 4, 5, 6], X3), % [1,4,9,16,25,36]
	write(X3), nl,
	write("% === sumFirst ==="), nl, 
	sumFirst(100, X4), % 5050
	write(X4), nl,
	sumFirst(1000, X5), % 500500
	write(X5), nl,
	write("% === xLength ==="), nl, 
	xLength([10, 20, [30, 40], 50, 60], X6), % 5
	write(X6), nl,
	xLength([], X7), % 0
	write(X7), nl,
	xLength([1, [2, 3], [4, 5, 6], 7], X8), % 4
	write(X8), nl,
	write("% === nLength ==="), nl, 
	nLength([10, 20, [30, [40, 50]], 60], X9), % 6
	write(X9), nl,
	nLength([1, [2, 3], [4, 5, 6], 7], X10), % 7
	write(X10), nl,
	write("% === dotProduct ==="), nl, 
	dotProduct([10, 20, 30], [4, 5, 6], X11), % 320
	write(X11), nl,
	dotProduct([1, 2], [3, 4], X12), % 11
	write(X12), nl, !.