domains
 i = integer
 il = i*
predicates
% ������������ ���� �����
move_horse(i, i, i, i)
% �������� ������ ����
outborder(i)
% ������� �������� ����� �� ����
move_rule(i, i)
% ������ ����������� �������� � ������
elem(i, i, il)
% ������ �� ��������
walk(il, il, i)

clauses
move_rule(2, 1).
move_rule(2, -1).
move_rule(1, 2).
move_rule(1, -2).
move_rule(-1, 2).
move_rule(-1, -2).
move_rule(-2, 1).
move_rule(-2, -1).

outborder(X):- X > 0, X < 9.

elem(X, Y, [X, Y | List]).
elem(X, Y, [_, _ | Tail]):-
	elem(X, Y, Tail).

move_horse(X, Y, X1, Y1):-
	move_rule(Dx, Dy), X1 = X + Dx, Y1 = Y + Dy,
	% ��������� ���������� ����������
	OutBorder(X1), OutBorder(Y1).

walk(List, List, 1).
walk([X, Y | Past], Res, N):-
	move_horse(X, Y, X1, Y1),
	not(elem(X1, Y1, Past)),
	N1 = N - 1,
	walk([X1, Y1, X, Y | Past], Res, N1).
%goal
	%solve([8,8],Res,63).