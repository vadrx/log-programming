domains
	st_lst = string*
	wgc = wgc(string,st_lst,st_lst)
	history = wgc*
predicates
	member(wgc, history)		% Определение принадлежности списку 
	member(string, st_lst)
	initial_state(wgc)		% Начальное и коненое состояние
	final_state(wgc)
	update_boat(string, string)	% Изменение местонахождения лодки 
	update_banks(string, string, st_lst, st_lst, st_lst, st_lst)	% Перевозка
	select(string, st_lst, st_lst)	% Выбор груза для перевозки 
	insert(string, st_lst, st_lst)	% Вставка элемента 
	precedes(string, string)		% Вставка с учетом порядка сортировки
	legal(wgc)			% Допустимость состояния 
	illegal(st_lst)
	move(wgc, string)		% Определение возможности перехода
	update(wgc, string, wgc)		% Поиск достижимого состояния 
	solve_dfs(wgc, history, st_lst)	% Построение последовательности состояний
	test_dfs(st_lst)			% Поиск в графе поиском в глубину 
clauses
	% Определение принадлежности списку 
	member(H,[H|_]).
	member(Elem,[_|T]):-
		member(Elem,T).
	% Начальное и коненое состояние
initial_state(wgc("Лодка на левом берегу.",["Волк","Коза","Капуста"],[])).
final_state(wgc("Лодка на правом берегу.",[],["Волк","Коза","Капуста"])).
	% Изменение местонахождения лодки 
	update_boat("Лодка на левом берегу.","Лодка на правом берегу.").
	update_boat("Лодка на правом берегу.","Лодка на левом берегу.").
	% Выбор груза для перевозки 
	select(X,[X|T],T).
	select(X,[H|T],[H|D]):-
		select(X,T,D).
	% Вставка с учетом порядка сортировки
	% Порядок сортировки 
	precedes("Волк",X).
	precedes(X,"Капуста").
	% Вставка элемента 
	insert(X,[Y|Ys],[X,Y|Ys]):-
		precedes(X,Y).
	insert(X,[Y|Ys],[Y|Zs]):-
		precedes(Y,X),insert(X,Ys,Zs).
		insert(X,[],[X]).
	% Изменение состава тех, кто на берегу. 
	% Фермер едет без груза
		update_banks("Без груза",B,L,R,L,R).
	
% Перевозка
	update_banks(Cargo,"Лодка на левом берегу.",L,R,L1,R1):-
		select(Cargo,L,L1),insert(Cargo,R,R1).
	update_banks(Cargo,"Лодка на правом берегу.",L,R,L1,R1):-
		select(Cargo,R,R1),insert(Cargo,L,L1).
	% Допустимость состояния 
	legal(wgc("Лодка на левом берегу.",L,R)):-
		not(illegal(R)).
	legal(wgc("Лодка на правом берегу.",L,R)):-
		not(illegal(L)).
	illegal(List):-
		member("Волк",List),
		member("Коза",List).
	illegal(List):-
		member("Коза",List),
		member("Капуста",List).
	% Определение возможности перехода
	move(wgc("Лодка на левом берегу.",L,R),Cargo):-
		member(Cargo,L).
	move(wgc("Лодка на правом берегу.",L,R),Cargo):-
		member(Cargo,R).
	move(wgc(B,L,R),"Без груза").
	% Поиск достижимого состояния 
	update(wgc(B,L,R),Cargo,wgc(B1,L1,R1)):-
		update_boat(B,B1),
		update_banks(Cargo,B,L,R,L1,R1).
	% Построение последовательности состояний
	solve_dfs(State,History,[]):-
		final_state(State).
	solve_dfs(State,History,[Move|Moves]):-
		move(State,Move),
		update(State,Move,State1),
		legal(State1),
		not(member(State1,History)),
		solve_dfs(State1,[State1|History],Moves).
	% Поиск в графе поиском в глубину 
	test_dfs(Moves):-
		initial_state(State),
		solve_dfs(State,[State],Moves),!.