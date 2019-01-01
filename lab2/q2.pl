domains
    number = real

predicates
    func(number, number, number)

clauses
func(0, 0, 0):- !.
func(X, Y, N):-
    N1 = N - 1,
    func(X1, Y1, N1),
    X = X1 + Y1,
    Y = 1 / (N * N * (N + 1) * (N + 1) * (N + 2) * (N + 2)).

goal
    func(X, _, 10).