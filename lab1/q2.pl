predicates
	common_interests(symbol, symbol)
	who_likes_what(symbol, symbol)
	likes(symbol, symbol)
clauses
common_interests(X, Y):-
	who_likes_what(X, Z), Z<>X, 
	who_likes_what(Y, Z), X<>Y.
who_likes_what(ivan, reading). 
who_likes_what(peter, programming). 
who_likes_what(peter, reading). 
who_likes_what(mike, tennis). 
who_likes_what(mike, programming).
likes(X, Y):-
	who_likes_what(X, Y);
	common_interests(X, Y).
	
goal
	who_likes_what(X,Y).	
/* 
goal
	common_interests(X,Y).
	
goal
	who_likes_what(X,programming).*/