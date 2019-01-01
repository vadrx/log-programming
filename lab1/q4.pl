domains
    str = symbol
    
predicates
    shop(str)
    realShop(str)
%поиск несуществующего магазина
    findShop(str)
    products(str,str)
%поиск экзотических продуктов
    thisIsEkzot(str)
    
clauses
shop("Lenta").
shop("Magnit").
shop("Pyaterochka").
shop("Snegovik").
realShop("Lenta").
realShop("Magnit").
realShop("Pyaterochka").

findShop(X):-
    shop(X), 
    not(realShop(X)),!.

products("pineapple", "ekzot").
products("bread", "ne ekzot").
products("kokos", "ekzot").
products("milk", "ne ekzot").

thisIsEkzot(Prod):-
    products(Prod, "ekzot").

goal
    findShop(Magazin).