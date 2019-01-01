domains
    number = integer
predicates
    number_list(number) 
    rebus(number, number, number, number)
    
clauses
number_list(0).
number_list(1).
number_list(2).
number_list(3).
number_list(4).
number_list(5).
number_list(6).
number_list(7).
number_list(8).
number_list(9).
rebus(A, B, C, D):-
    number_list(A), number_list(B), number_list(C), number_list(D), 
    (A * 1000) + (B * 100) + (B * 10) + B - C = (C * 1000) + (D * 100) + (D * 10) + D , /* ABBB - C = CDDD */ 
    A <> B, A <> C, A <> D,
    B <> C, B <> D,
    C <> D.

goal
	rebus(A, B, C, D).