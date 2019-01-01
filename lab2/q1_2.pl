predicates
%предикат, находящий соответствующий элемент треугольника Паскаля.
	triangle(integer, integer, integer)
%предикат, выводящий числа n-ого ряда треугольника Паскаля.
	outLine(integer, integer)
%предикат, выводящий n-ый ряд треугольника Паскаля.
	task(integer)
clauses
triangle(J, I, C):-
	J = 0, C = 1, !;
	J = I, C = 1, !;
	J < 0, C = 0, !;
	J > I, C = 0, !;
	J1 = J - 1,
	I1 = I - 1,
	triangle(J1, I1, C1),
	triangle(J, I1, C2),
	C = C1 + C2.

outLine(J, I):-
	J < 0, !;
	J1 = J - 1,
	outLine(J1, I),
	triangle(J, I, C),
	write(C),
	write(" ").

task(I):-
	I < 0, !;
	I1 = I - 1,
	task(I1),
	outLine(I, I), nl.

goal
	task(6).