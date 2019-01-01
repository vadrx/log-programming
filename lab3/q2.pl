domains
	lst = integer*
	int = integer

predicates
    % алгоритм сортировки прямым вобором
    selectionsort(lst, lst)
    % поиск минимального элемента
    smallest(lst, int, int)
    % уделение элемента из списка
    remove(lst, int, lst)

clauses
selectionsort([],[]).
selectionsort([H | T], [Smallest|SortedList]) :-
	smallest(T, H, Smallest),
	remove([H | T], Smallest, NewList), !,
	selectionsort(NewList, SortedList).

smallest([], Smallest,Smallest).
smallest([H | T], CurrSmallest, Smallest) :- 
	H < CurrSmallest, smallest(T, H, Smallest).
smallest([_ | T], CurrSmallest, Smallest) :-
	smallest(T, CurrSmallest, Smallest).

remove([], _, []).
remove([H | T], H, T).
remove([H | T], Element, [H | NewList]) :- 
	remove(T, Element, NewList).

goal
	selectionsort([12, 8, 14, 6, 4, 9, 1, 8, 13, 5, 11, 3, 18, 3, 10, 9], Sort).
