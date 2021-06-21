:- use_module(library(bounds)).

% === candy ===

candy(S) :-
	Sanjev is 15,
	Susan is 3 * Sanjev,
	Jack is 3 * ((Susan+Sanjev) div 5),
	S = [[jack,Jack], [susan,Susan], [sanjev,Sanjev]].

% === ages ===

ages(S) :-
	between(1,100,Bob),
	between(1,100,Ben),
	between(1,100,Tom),
	Tom is Bob + Ben,
	Tom2 is (Tom**2),
	Tom2 is (Bob**3) + (Ben**3),
	Tom2 is (Bob**2) + (Ben**3),
	S = [[tom, Tom], [bob, Bob], [ben, Ben]],
	!.

% === seats ===

sumEquals([], _, 0).
sumEquals([[_,H]|T], H, Sum) :- 
	sumEquals(T, H, ST),
	Sum is 1+ST.
sumEquals([[_,H]|T], Type, ST) :- 
	\+ H = Type,
	sumEquals(T, Type, ST).

seats(S) :-
	between(1, 3, PD),
	between(1, 3, PM),
	between(1, 3, PC1),
	between(1, 3, PC2),
	between(1, 3, Priest),
	between(1, 3, Robot),
	between(1, 3, Demis),
	between(1, 3, Vangelis),
	between(1, 3, Mikis),
	between(1, 3, Wilson),
	between(1, 3, Akerfeldt),
	between(1, 3, Parsons),
	between(1, 3, Gilmour),
	between(1, 3, Dickinson),
	between(1, 3, Harris),
	between(1, 3, Dio),
	between(1, 3, Summers),
	PD = PM,
	PD = PC1,
	PD = PC2,
	PD \= Priest,
	PD = Robot,
	Demis = Vangelis,
	Demis = Mikis,
	Wilson = Demis,
	Akerfeldt = Demis,
	Wilson \= Parsons,
	Parsons = Gilmour,
	Priest \= Dickinson,
	Priest \= Harris,
	Priest \= Dio,
	Priest \= Summers,
	S = [[pharaohdad,PD],[pharaohmom,PM],[pharaohchild1,PC1],[pharaohchild2,PC2],[priest,Priest],[robot,Robot],[demis,Demis],[vangelis,Vangelis],[mikis,Mikis],[wilson,Wilson],[akerfeldt,Akerfeldt],[parsons,Parsons],[gilmour,Gilmour],[dickinson,Dickinson],[harris,Harris],[dio,Dio],[summers,Summers]],
	sumEquals(S, 1, M1),
	M1 is 5,
	sumEquals(S, 2, M2),
	M2 is 6,
	sumEquals(S, 3, M3),
	M3 is 6,
	!.

% === spaceship ===

spaceship(S) :- % name, arma, color -- size 6
	length(S, 6),
	member([commando, shotgun, _], S),
	member([engineer, _, purple], S),
	member([loader, _, yellow], S),
	member([mercenary, _, blue], S),
	member([_, kyaro, white], S),
	member([huntress, bow, red], S),
	member([_, shotgun, orange], S),
	member([_, turrets, purple], S),
	member([_, katana, blue], S),
	member([artificer, kyaro, _], S),
	member([_, armor, yellow], S).

start :-
	write("Prolog Final Exam"), nl,
	write("% === candy ==="), nl, 
	candy(Candy),
	write(Candy), nl, % [[jack,36],[susan,45],[sanjev,15]]
	write("% === ages ==="), nl, 
	ages(Ages),
	write(Ages), nl, % [[tom,3],[bob,1],[ben,2]]
	write("% === seats ==="), nl, 
	seats(Seats),
	write(Seats), nl, % [[pharaohdad,1],[pharaohmom,1],[pharaohchild1,1],[pharaohchild2,1],[priest,2],[robot,1],[demis,2],[vangelis,2],[mikis,2],[wilson,2],[akerfeldt,2],[parsons,3],[gilmour,3],[dickinson,3],[harris,3],[dio,3],[summers,3]]
	write("% === spaceship ==="), nl, 
	spaceship(Spaceship),
	write(Spaceship), nl, % [[commando,shotgun,orange],[engineer,turrets,purple],[loader,armor,yellow],[mercenary,katana,blue],[artificer,kyaro,white],[huntress,bow,red]]
	!.