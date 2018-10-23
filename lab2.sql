###############################2.1###################################

wyświetla listę klientów (nazwa, ulica, miejscowość) posortowaną według nazw klientów,
SELECT nazwa, ulica, miejscowosc FROM klienci ORDER BY nazwa; 

wyświetla listę klientów posortowaną malejąco według nazw miejscowości, a w ramach tej samej miejscowości rosnąco według nazw klientów,
SELECT nazwa, ulica, miejscowosc FROM klienci ORDER BY miejscowosc DESC, nazwa ASC;

wyświetla listę klientów z Krakowa lub z Warszawy posortowaną malejąco według nazw miejscowości, 
a w ramach tej samej miejscowości rosnąco weług nazw klientów (zapytanie utwórz na dwa sposoby stosując w kryteriach or lub in).

SELECT nazwa, ulica, miejscowosc FROM klienci WHERE miejscowosc='Kraków' OR miejscowosc='Warszawa' ORDER BY miejscowosc DESC;

SELECT nazwa, ulica, miejscowosc FROM klienci WHERE miejscowosc IN ('Kraków', 'Warszawa') ORDER BY miejscowosc DESC;


★ wyświetla listę klientów posortowaną malejąco według nazw miejscowości,
SELECT * FROM klienci ORDER BY miejscowosc DESC


★ wyświetla listę klientów z Krakowa posortowaną według nazw klientów.
SELECT * FROM klienci WHERE miejscowosc='Kraków' ORDER BY nazwa;

###############################2.2###################################


wyświetla nazwę i masę czekoladek, których masa jest większa niż 20 g,
SELECT nazwa, masa FROM czekoladki WHERE masa<=20;

wyświetla nazwę, masę i koszt produkcji czekoladek, których masa jest większa niż 20 g i koszt produkcji jest większy niż 25 gr,
SELECT nazwa, masa,koszt FROM czekoladki WHERE masa<=20 AND koszt<=0.25;



j.w. ale koszt produkcji musi być podany w groszach,
 SELECT nazwa, masa,koszt*100 FROM czekoladki WHERE masa<=20 AND koszt<=0.25;

wyświetla nazwę oraz rodzaj czekolady, nadzienia i orzechów dla czekoladek, które są w mlecznej czekoladzie i nadziane malinami
lub są w mlecznej czekoladzie i nadziane truskawkami lub zawierają orzechy laskowe, ale nie są w gorzkiej czekoladzie,
SELECT nazwa, czekolada, nadzienie, orzechy FROM czekoladki WHERE (czekolada='mleczna' AND nadzienie IN ('maliny', 'truskawki')) OR (orzechy='laskowe' AND czekolada<>'gorzka');

★ wyświetla nazwę i koszt produkcji czekoladek, których koszt produkcji jest większy niż 25 gr,
SELECT nazwa, koszt FROM czekoladki WHERE koszt>0.25;

★ wyświetla nazwę i rodzaj czekolady dla czekoladek, które są w białej lub mlecznej czekoladzie.
    SELECT nazwa, czekolada FROM czekoladki WHERE czekolada IN ('biała', 'mleczna');




###############################2.3###################################
124 * 7 + 45,
SELECT 124 * 7 + 45
2 ^ 20,
SELECT 2 ^ 20;
★ √3,
SELECT SQRT(3);
★ π.
SELECT PI();


###############################2.4###################################


Napisz zapytanie w języku SQL wyświetlające informacje na temat czekoladek (IDCzekoladki, Nazwa, Masa, Koszt), których:

masa mieści się w przedziale od 15 do 24 g,
SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE masa BETWEEN 15 AND 24;


koszt produkcji mieści się w przedziale od 25 do 35 gr,

SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE koszt BETWEEN 0.25 AND 0.35;

★ masa mieści się w przedziale od 25 do 35 g lub koszt produkcji mieści się w przedziale od 15 do 24 gr.

SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE (koszt BETWEEN 0.25 AND 0.35) OR (masa BETWEEN 15 AND 24);


###############################2.5###################################



Napisz zapytanie w języku SQL wyświetlające informacje na temat czekoladek (idCzekoladki, nazwa, czekolada, orzechy, nadzienie), które:

zawierają jakieś orzechy,

SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki WHERE orzechy is NOT NULL;

nie zawierają orzechów,

SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki WHERE orzechy is NULL;
zawierają jakieś orzechy lub jakieś nadzienie,

są w mlecznej lub białej czekoladzie (użyj IN) i nie zawierają orzechów,
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki WHERE czekolada IN ('mleczna', 'biała') AND orzechy IS NULL;

nie są ani w mlecznej ani w białej czekoladzie i zawierają jakieś orzechy lub jakieś nadzienie,
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki WHERE NOT(czekolada IN ('mleczna', 'biała')) AND (orzechy IS NOT NULL OR nadzienie IS NOT NULL);

★ zawierają jakieś nadzienie,
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki WHERE nadzienie is NOT NULL;

★ nie zawierają nadzienia,

SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki WHERE nadzienie is NULL;
★ nie zawierają orzechów ani nadzienia,

SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki WHERE nadzienie is NULL and orzechy is NULL;

★ są w mlecznej lub białej czekoladzie i nie zawierają nadzienia.

SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki WHERE czekolada IN ('mleczna', 'biała') AND nadzienie is NULL;

###############################2.6###################################

masa mieści się w przedziale od 15 do 24 g lub koszt produkcji mieści się w przedziale od 15 do 24 gr,
SELECT * FROM czekoladki WHERE (masa BETWEEN 15 AND 24) OR (koszt BETWEEN 0.15 AND 0.24);

masa mieści się w przedziale od 15 do 24 g i koszt produkcji mieści się w przedziale od 15 do 24 gr lub 
masa mieści się w przedziale od 25 do 35 g i koszt produkcji mieści się w przedziale od 25 do 35 gr,
SELECT * FROM czekoladki WHERE ((masa BETWEEN 15 AND 24) AND (koszt BETWEEN 0.15 AND 0.24)) OR ((masa BETWEEN 25 AND 35) AND (koszt BETWEEN 0.25 AND 0.35));

★ masa mieści się w przedziale od 15 do 24 g i koszt produkcji mieści się w przedziale od 15 do 24 gr,
SELECT * FROM czekoladki WHERE (masa BETWEEN 15 AND 24) AND (koszt BETWEEN 0.15 AND 0.24);

★ masa mieści się w przedziale od 25 do 35 g, ale koszt produkcji nie mieści się w przedziale od 25 do 35 gr,
SELECT * FROM czekoladki WHERE (masa BETWEEN 15 AND 24) AND NOT(koszt BETWEEN 0.15 AND 0.24);

★ masa mieści się w przedziale od 25 do 35 g, ale koszt produkcji nie mieści się ani w przedziale od 15 do 24 gr, ani w przedziale od 25 do 35 gr.
SELECT * FROM czekoladki WHERE (masa BETWEEN 15 AND 24) AND NOT(koszt BETWEEN 0.15 AND 0.24) AND NOT(koszt BETWEEN 0.25 AND 0.35);