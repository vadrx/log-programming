domains
title, author = symbol
pages = integer

predicates
%%предикат, показывающий размер книги
	book(title, pages)
%предикат, показывающий автора книги
	written_by(author, title)
%предикат, показывающий, является ли книга более 300 страниц
	long_novel(title)
%предикат, показывающий наименьшее количество страниц из базы
	min(pages)
%предикат, показывающий название самой тонкой книги
	minBook(title)
%предикат, показывающий наибольшее количество страниц из базы
	max(pages)
%предикат, показывающий название самой толстой книги
	maxBook(title)
%предикат, показывающий название книг, не являющихся ни толстыми, ни тонкими 
	mediumBook(title)
%предикат, показывающий наличие самой тонкой книги у заданного автора
	minBookAuthor(author)
%предикат, показывающий наличие самой толстой книги у заданного автора        
	maxBookAuthor(author)
%предикат, показывающий наибольшее количество страниц из базы для данного автора     
	maxAuth(author, pages)
%предикат, показывающий наименьшее количество страниц из базы для данного автора
	minAuth(author, pages)
%предикат, показывающий название самой толстой книги у данного автора     
	maxBookConcreteAuthor(author, title)
%предикат, показывающий название самой тонкой книги у данного автора         
	minBookConcreteAuthor(author, title)
%предикат, показывающий названия книг, которые написаны не данным автором
	byNot(author, title).

clauses
written_by(fleming, "DR NO").
written_by(melville, "MOBY DICK").
written_by(pushkin, "Evgeniy Onegin").
written_by(pushkin, "Capitan dochka").
written_by(pushkin, "Ruslan i Ludmila").
   
book("MOBY DICK", 250).
book("DR NO", 310).
book("Evgeniy Onegin", 321).
book("Capitan dochka", 522).
book("Ruslan i Ludmila", 893).
   
long_novel(Title):-
    written_by(_, Title),
    book(Title, Length),
    Length > 300.

min(Pages):-
    book(_, X), X < Pages, !, fail.
min(_).
minBook(Title):-
    book(Title,X), min(X).
      
max(Pages):-
    book(_, X), X > Pages, !, fail.
max(_).
maxBook(Title):- 
    book(Title, X), max(X).
    
mediumBook(Title):-
    book(Title, Length),
    not(min(Length)),
    not(max(Length)).
      
minBookAuthor(Author):-
    minBook(Title),
    written_by(Author, Title).

maxBookAuthor(Author):-
    maxBook(Title),
    written_by(Author, Title).
      
maxAuth(Auth, Pages):-
    written_by(Auth, Title), book(Title, X), X > Pages, !, fail.
maxAuth(_,_).
maxBookConcreteAuthor(Author, Title):-
    written_by(Author, Title),
    book(Title, Pages),
    maxAuth(Author, Pages).

minAuth(Auth, Pages):-
    written_by(Auth, Title), book(Title, X), X < Pages, !, fail.
minAuth(_,_).

minBookConcreteAuthor(Author, Title):-
    written_by(Author, Title),
    book(Title, Pages),
    minAuth(Author, Pages).

byNot(Author, Title):-
    book(Title, _),
    not(written_by(Author, Title)).
    
goal
    minBook(Min).
    
/*
goal
    maxBook(Max).
    
goal
    mediumBook(Medium).
    
goal
    minBookAuthor (fleming).
    
goal 
    maxBookAuthor (fleming).
    
goal
    maxBookConcreteAuthor(fleming, Title).
    
goal
    minBookConcreteAuthor(fleming,Title).
    
goal
    byNot(fleming,Title).
*/