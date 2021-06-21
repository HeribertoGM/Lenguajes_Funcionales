-module(challenge08).
-export([test01/0, increase/0, test02/0, dynamicIncrease/1, test03/0, calculator/1, test04/0, tictac/2]).

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

% === increase ===

increase() -> 
	receive
		I when is_number(I) -> io:format("~p~n", [I+1]),
			increase();
		_ -> io:format("Process finished...~n")
	end.

test01() -> 
	io:format("=== increase ===~n"),
	Pid = spawn(fun challenge08:increase/0),
	Pid ! 5, 	% >> 6 is printed on screen.
	Pid ! 10, 	% >> 11 is printed on screen.
	Pid ! 99, 	% >> 100 is printed on screen.
	Pid ! bye, 	% The process ends.
	Pid ! 5, 	% Nothing happens since the process is already done.
	ok.			% This is the return value for test01 (it will eventually be printed on screen).

% === dynamicIncrease ===

dynamicIncrease(I) -> 
	receive
		X when is_number(X) -> io:format("~p~n", [X+I]),
			dynamicIncrease(I+1);
		_ -> io:format("Process finished...~n")
	end.

test02() -> 
	io:format("=== dynamicIncrease ===~n"),
	Pid = spawn(challenge08, dynamicIncrease, [1]),
	Pid ! 5, 	% >> 6 is printed on screen.
	Pid ! 10, 	% >> 12 is printed on screen.
	Pid ! 99, 	% >> 102 is printed on screen.
	Pid ! 1000, % >> 1004 is printed on screen.
	Pid ! bye, 	% The process ends.
	Pid ! 5, 	% Nothing happens since the process is already done.
	ok.			% This is the return value for test02 (it will eventually be printed on screen).

% === calculator ===

calculator(Curr) -> 
	receive
		{xadd, X} -> calculator(Curr+X);
		{xsub, X} -> calculator(Curr-X);
		{xmul, X} -> calculator(Curr*X);
		{xdiv, X} -> calculator(Curr/X);
		finish -> io:format("~p~n", [Curr])
	end.

test03() -> 
	io:format("=== calculator ===~n"),
	Pid = spawn(challenge08, calculator, [0]),
	Pid ! {xadd, 10},	% Nothing is printed on screen.
	Pid ! {xmul, 5}, 	% Nothing is printed on screen.
	Pid ! {xsub, 3}, 	% Nothing is printed on screen.
	Pid ! finish, 		% 47 is printed on screen.
	Pid ! bye, 			% Nothing happens since the process is already done.
	Pid ! 5, 			% Nothing happens since the process is already done.
	ok.					% This is the return value for test03 (it will eventually be printed on screen).

% === tictac ===

tictac(Text, N) -> 
	receive
		{start, Pid} -> io:format("~p...~n", [Text])
	end,
	receive
		after 1000 -> 
			Pid ! {start, self()}, 
			if
				N > 0 -> tictac(Text, N - 1);
				true -> io:format("~p has finished...~n", [Text])
			end
	end.

test04() ->
	io:format("=== tictac ===~n"),
	PidTic = spawn(challenge08, tictac, [tic, 10]),
	PidTac = spawn(challenge08, tictac, [tac, 10]),
	PidTic ! {start, PidTac},
	ok.
