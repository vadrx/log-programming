predicates
%предикат, расчитывающий n-ый член ряда Фибоначчи
    fibPair(integer, integer)
%предикат, выводящий ряд из n первых членов ряда Фибоначчи 
    fibTask(integer)
clauses
fibPair(0, 1).
fibPair(1, 1).
fibPair(N, F):-
    N > 1, N1 = N - 1,
    fibPair(N1, F1),
    N2 = N - 2,
    fibPair(N2, F2),
    F = F1 + F2.
fibTask(1):- 
    write("1").
fibTask(N):-
    N1 = N - 1,
    fibTask(N1),
    fibPair(N1, F),
    write(F), write(" ").

goal
    fibTask(15).