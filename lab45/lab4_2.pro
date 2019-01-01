domains 
  s_lst = symbol*
  str = string
  int = integer
predicates
  near(s_lst, s_lst) %��������� 0 � ������ ��������� ������� ������
  % �������� ����� �� ��������
  line(str, str, str, str, str, str, str, str, str, str)
  % ���� ���� ����� �� ���� ��������� ��� ������� � ������ ����� ��������, �� �������� ��������� 0 � ������ ����
  put(str, str, str, str, str, str)
  % ������� ���
  makego(str, str, str, str, str, str, str, str, str, str, str, str, str, str, str, str, str, str, int)
  % �������� �� ������ (������ �������� �����)
  checkwin(str, str, str, str, str, str, str, str, str, int) 
clauses
%������� �������� �����
  line(C,S1,S2,S3,S4,S5,S6,S7,S8,S9):-
    S1=C,S2=C,S3=C;
    S4=C,S5=C,S6=C;
    S7=C,S8=C,S9=C;
    S1=C,S4=C,S7=C;
    S2=C,S5=C,S8=C;
    S3=C,S6=C,S9=C;
    S1=C,S5=C,S9=C;
    S3=C,S5=C,S7=C.
    
%���� ���� ����� �� ���� ��������� ��� ������� � ������ ����� ��������, �� �������� ��������� 0 � ������ ����
  put(S1,S2,S3, Q1,Q2,Q3):-
    S1="X", S2="X", S3="",  Q1=S1, Q2=S2,  Q3="0",!; 
    S1="X", S2="",  S3="X", Q1=S1, Q2="0", Q3=S3, !; 
    S1="" , S2="X", S3="X", Q1="0", Q2=S2,  Q3=S3,!;
    S1="0", S2="0", S3="",  Q1=S1, Q2=S2,  Q3="0",!; 
    S1="0", S2="",  S3="0", Q1=S1, Q2="0", Q3=S3, !; 
    S1="" , S2="0", S3="0", Q1="0", Q2=S2,  Q3=S3,!
    /*!, fail*/.

%��������� 0 � ������ ��������� ������� ������
  near([],[]):-!, fail.
  near([H1|T1],Res):-H1="", Res=["0"|T1], !; near(T1,RT), Res=[H1|RT].
  
  checkwin(S1,S2,S3,S4,S5,S6,S7,S8,S9,Res):-
	line("0",S1,S2,S3,S4,S5,S6,S7,S8,S9),Res=2,!; Res=0.
  
%���
  makego(S1,S2,S3,S4,S5,S6,S7,S8,S9, Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Res):-
    line("X",S1,S2,S3,S4,S5,S6,S7,S8,S9),Res=1, Q1=S1, Q2=S2, Q3=S3, Q4=S4, Q5=S5, Q6=S6, Q7=S7, Q8=S8, Q9=S9, !;
    S1<>"",S2<>"",S3<>"",S4<>"",S5<>"",S6<>"",S7<>"",S8<>"",S9<>"",
    Res=3, Q1=S1, Q2=S2, Q3=S3, Q4=S4, Q5=S5, Q6=S6, Q7=S7, Q8=S8, Q9=S9,!;
    %�������� �� �� ��� ��� �������� ��� ������ ����� � ���
    put(S1,S2,S3, Q1,Q2,Q3),Q4=S4, Q5=S5, Q6=S6, Q7=S7, Q8=S8, Q9=S9, checkwin(Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Res), !;
    put(S4,S5,S6, Q4,Q5,Q6),Q1=S1, Q2=S2, Q3=S3, Q7=S7, Q8=S8, Q9=S9, checkwin(Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Res), !;
    put(S7,S8,S9, Q7,Q8,Q9),Q1=S1, Q2=S2, Q3=S3, Q4=S4, Q5=S5, Q6=S6, checkwin(Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Res), !;
    put(S1,S4,S7, Q1,Q4,Q7),Q2=S2, Q3=S3, Q5=S5, Q6=S6, Q8=S8, Q9=S9, checkwin(Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Res), !;
    put(S2,S5,S8, Q2,Q5,Q8),Q1=S1, Q3=S3, Q4=S4, Q6=S6, Q7=S7, Q9=S9, checkwin(Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Res), !;
    put(S3,S6,S9, Q3,Q6,Q9),Q1=S1, Q2=S2, Q4=S4, Q5=S5, Q7=S7, Q8=S8, checkwin(Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Res), !;
    put(S1,S5,S9, Q1,Q5,Q9),Q2=S2, Q3=S3, Q4=S4, Q6=S6, Q7=S7, Q8=S8, checkwin(Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Res), !;
    put(S3,S5,S7, Q3,Q5,Q7),Q1=S1, Q2=S2, Q4=S4, Q6=S6, Q8=S8, Q9=S9, checkwin(Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Res), !;
    %������� ������ � �������� ���� ����� ������� ������
    S1="0", near([S2,S3,S4,S5,S7,S9],[Q2,Q3,Q4,Q5,Q7,Q9|_]), Q1=S1, Q6=S6, Q8=S8, Res=0, !;
    S2="0", near([S1,S3,S5,S8],[Q1,Q3,Q5,Q8|_]), Q2=S2, Q4=S4, Q6=S6, Q7=S7, Q9=S9, Res=0, !;
    S3="0", near([S1,S2,S5,S6,S7,S9],[Q1,Q2,Q5,Q6,Q7,Q9|_]), Q3=S3, Q4=S4, Q8=S8, Res=0, !;
    S4="0", near([S1,S7,S5,S6],[Q1,Q7,Q5,Q6|_]), Q4=S4, Q2=S2, Q3=S3, Q8=S8, Q9=S9, Res=0, !;
    S5="0", near([S1,S2,S3,S4,S6,S7,S8,S9],[Q1,Q2,Q3,Q4,Q6,Q7,Q8,Q9|_]), Q5=S5, Res=0, !;
    S6="0", near([S3,S4,S5,S9],[Q3,Q4,Q5,Q9|_]), Q6=S6, Q1=S1, Q2=S2, Q7=S7, Q8=S8, Res=0, !;
    S7="0", near([S1,S3,S4,S5,S8,S9],[Q1,Q3,Q4,Q5,Q8,Q9|_]), Q7=S7, Q2=S2, Q6=S6, Res=0, !;
    S8="0", near([S2,S5,S7,S9],[Q2,Q5,Q7,Q9|_]), Q8=S8, Q1=S1, Q3=S3, Q4=S4, Q6=S6, Res=0, !;
    S9="0", near([S1,S3,S5,S6,S7,S8],[Q1,Q3,Q5,Q6,Q7,Q8|_]), Q9=S9, Q2=S2, Q4=S4, Res=0, !;
    %������� ������ � ��������� ����
    S1="", Q1="0", Q2=S2, Q3=S3, Q4=S4, Q5=S5, Q6=S6, Q7=S7, Q8=S8, Q9=S9, Res=0, !;
    S2="", Q1=S1, Q2="0", Q3=S3, Q4=S4, Q5=S5, Q6=S6, Q7=S7, Q8=S8, Q9=S9, Res=0, !;
    S3="", Q1=S1, Q2=S2, Q3="0", Q4=S4, Q5=S5, Q6=S6, Q7=S7, Q8=S8, Q9=S9, Res=0, !;
    S4="", Q1=S1, Q2=S2, Q3=S3, Q4="0", Q5=S5, Q6=S6, Q7=S7, Q8=S8, Q9=S9, Res=0, !;
    S5="", Q1=S1, Q2=S2, Q3=S3, Q4=S4, Q5="0", Q6=S6, Q7=S7, Q8=S8, Q9=S9, Res=0, !;
    S6="", Q1=S1, Q2=S2, Q3=S3, Q4=S4, Q5=S5, Q6="0", Q7=S7, Q8=S8, Q9=S9, Res=0, !;
    S7="", Q1=S1, Q2=S2, Q3=S3, Q4=S4, Q5=S5, Q6=S6, Q7="0", Q8=S8, Q9=S9, Res=0, !;
    S8="", Q1=S1, Q2=S2, Q3=S3, Q4=S4, Q5=S5, Q6=S6, Q7=S7, Q8="0", Q9=S9, Res=0, !;
    S9="", Q1=S1, Q2=S2, Q3=S3, Q4=S4, Q5=S5, Q6=S6, Q7=S7, Q8=S8, Q9="0", Res=0.