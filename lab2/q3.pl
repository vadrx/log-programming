domains
    number = integer
    name = symbol

predicates
    route(number,  name)    %маршрут
    on_the_way(number, name, name, number)
    exitto(number, name, name, number)  %если можем выйти
    exitto2(number, name, number)   %если нужна пересадка   
    transfer(number, name, name, number)    %пересадка
    board(number, symbol, symbol)   %вычисление маршрута

clauses
route(6, "Московская ул.").
route(6, "Б.Московская ул.").
route(6, "ул.Розважа").
route(6, "Б.С.Петербургская ул.").
route(6, "просп.А.Корсунова").
route(6, "просп.Мира").
route(6, "Нехинская ул.").
route(6, "Нов.мельница").
route(6, "7-ой км Нехинского шоссе").
route(6, "Нов.мельница (обратно)").
route(6, "Нехинская ул. (обратно)").
route(6, "просп.Мира (обратно)").
route(6, "просп.А.Корсунова (обратно)").
route(6, "Б.С.Петербургская ул. (обратно)").
route(6, "ул.Розважа (обратно)").
route(6, "Б.Московская ул. (обратно)").
route(6, "Московская ул. (обратно)").

route(1, "Сметанинская мыза").
route(1, "ул.Советская Армия").
route(1, "Б.Московская ул.").
route(1, "ул.Розважа").
route(1, "Б.С.Петербургская ул.").
route(1, "пр.А.Корсунова").
route(1, "п.Григорово").
route(1, "пр.А.Корсунова (обратно)").
route(1, "Б.С.Петербургская ул. (обратно)").
route(1, "ул.Розважа (обратно)").
route(1, "Б.Московская ул. (обратно)").
route(1, "ул.Советская Армия (обратно)").
route(1, "Сметанинская мыза (обратно)").

on_the_way(Route, Name1, Name2, Count):-
    exitto(Route, Name1, Name2, Count);
    exitto2(Route, Name2, Count);
    transfer(Route, Name1, Name2, Count).

exitto(Route, Name1, Name2, Count):-    %если можно выйти
    route(Route, Name2), 
    write("Со станции ", Name1, " вы можете ехать без пересадок. Вам понадобилось ", Count, " пересадок"), !, nl.

exitto2(Route, Name2, Count):-  %если можно выйти с 1 пересадкой
    Z = Count + 1,
    not(route(Route, Name2)),
    route(Route, X),
    route(Route1, X), 
    Route<>Route1, 
    route(Route1, Name2),
    write("Со станции ", X, " вы можете ехать без пересадок. Вам понадобилось ", Z, " пересадок"), !, nl,
    write("Вам нужно пересесеть на станции ", X, " на ветку ", Route1), nl.

transfer(Route, Name1, Name2, Count):-  %если нельзя выйти
    Z = Count + 1,
    not(route(Route, Name2)),   % ищем место пересадки
    route(Route, X), 
    route(Route1, X), 
    Route <> Route1, 
    not(route(Route1, Name1)),
    on_the_way(Route1, X, Name2, Z),
    write("Вам нужно пересесеть на станции ", X, " на ветку ", Route1), nl.

board(Route, Name1, Name2):-
    Z = 0,
    on_the_way(Route, Name1, Name2, Z).

goal
/*с пересадками*/
    board(6, "Нов.мельница", "Сметанинская мыза"), nl,
/*без пересадок*/
    board(1, "Сметанинская мыза", "п.Григорово"), nl.