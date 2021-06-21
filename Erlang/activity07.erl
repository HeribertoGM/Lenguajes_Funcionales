-module(activity07).
-import(lists, [map/2, filter/2]).
-export([start/0]).

% ====================
% Complete the following functions and submit your file to Canvas.
% ====================
% Do not change the names of the functions. 
% Do not change the number of arguments in the functions.
% If your file cannot be loaded by the Erlang compiler, your submission may be cancelled. 
% Then, submit only code that works.
% ====================
% Grading instructions:
% There is a series of test cases for each function. In order to state that your function
% "works as described", your output must be similar to the expected one in each case.

% === multiplesR ===

multiplesR(Lst, N) -> if
	Lst == [] -> [];
	hd(Lst) rem N == 0 -> [hd(Lst)|multiplesR(tl(Lst), N)];
	true -> multiplesR(tl(Lst), N)
	end.

% === multiplesHOF ===

multiplesHOF(Lst, N) -> lists:filter(fun(X) -> X rem N == 0 end, Lst).

% === take ===

take([H|T], I) -> if
	I == 0 -> [];
	true -> [H|take(T, I-1)]
	end.

% === drop ===

drop(Lst, I) -> if
	Lst == [] -> [];
	I > 0 -> drop(tl(Lst), I-1);
	true -> [hd(Lst)|drop(tl(Lst), I)]
	end.

% === unique ===

unique(Lst) -> if
	Lst == [] -> [];
	true -> [hd(Lst)|unique(lists:filter(fun(X) -> X /= hd(Lst) end, tl(Lst)))]
	end.

% === transpose ===

transpose([[H1|T1],[H2|T2],[H3|T3]]) -> if
	T1 == [] -> [[H1, H2, H3]];
	true -> [[H1, H2, H3]|transpose([T1, T2, T3])]
	end.

% === qsort ===

qsort(Lst) -> if
	Lst == [] -> [];
	true -> qsort(lists:filter(fun(X) -> X =< hd(Lst) end, tl(Lst)))
		++[hd(Lst)]++
		qsort(lists:filter(fun(X) -> X > hd(Lst) end, tl(Lst)))
	end.

% === Test cases ===

start() -> 
	io:format("=== multiplesR ===~n"),
	io:format("~p~n", [multiplesR([1, 4, 6, 7, 23, 39, 19, 3], 3)]), % [6,39,3]
	io:format("~p~n", [multiplesR([1, 4, 6, 8, 7, 12, 19, 3], 2)]), % [4,6,8,12]
	io:format("=== multiplesHOF ===~n"),
	io:format("~p~n", [multiplesHOF([1, 4, 6, 7, 23, 39, 19, 3], 3)]), % [6,39,3]
	io:format("~p~n", [multiplesHOF([1, 4, 6, 8, 7, 12, 19, 3], 2)]), % [4,6,8,12]
	io:format("=== take ===~n"),
	io:format("~p~n", [take([1, 4, 6, 7, 23, 39, 19, 3], 5)]), % [1,4,6,7,23]
	io:format("~p~n", [take([1, 4, 6, 8, 7, 12, 19, 3], 7)]), % [1,4,6,8,7,12,19]
	io:format("~p~n", [take([10, 20, 30, 40, 50, 60, 70, 80], 6)]), % [10,20,30,40,50,60]
	io:format("=== drop ===~n"),
	io:format("~p~n", [drop([1, 4, 6, 7, 23, 39, 19, 3], 5)]), % [39,19,3]
	io:format("~p~n", [drop([1, 4, 6, 8, 7, 12, 19, 3], 7)]), % [3]
	io:format("~p~n", [drop([10, 20, 30, 40, 50, 60, 70, 80], 6)]), % "FP"
	io:format("=== unique ===~n"),
	io:format("~p~n", [unique([1, 4, 4, 2, 1, 6, 7, 6, 4, 2, 7, 6, 2, 1])]), % [1,4,2,6,7]
	io:format("~p~n", [unique([3, 6, 5, 4, 3, 3, 5, 6, 4, 2, 9, 1, 2, 2, 4, 3, 8, 9])]), % [3,6,5,4,2,9,1,8]
	io:format("=== transpose ===~n"),
	io:format("~p~n", [transpose([[1, 2, 3], [4, 5, 6], [7, 8, 9]])]), % [[1,4,7],[2,5,8],[3,6,9]]
	io:format("=== qsort ===~n"),
	io:format("~p~n", [qsort([1, 4, 6, 7, 23, 39, 19, 3])]), % [1,3,4,6,7,19,23,39]
	io:format("~p~n", [qsort([1, 4, 4, 2, 1, 6, 7, 6, 4, 2, 7, 6, 2, 1])]). % [1,1,1,2,2,2,4,4,4,6,6,6,7,7]