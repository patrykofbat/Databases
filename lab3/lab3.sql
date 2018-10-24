########################################3.1########################################
między 12 i 20 listopada 2013,
SELECT idzamowienia, datarealizacji FROM zamowienia WHERE datarealizacji BETWEEN '2013-11-12' AND '2013-11-20';


między 1 i 6 grudnia lub między 15 i 20 grudnia 2013

SELECT idzamowienia, datarealizacji FROM zamowienia WHERE (datarealizacji BETWEEN '2013-12-1' AND '2013-12-6') OR (datarealizacji BETWEEN '2013-12-15' AND '2013-12-20');

w grudniu 2013 (nie używaj funkcji date_part ani extract),
SELECT idzamowienia, datarealizacji FROM zamowienia WHERE datarealizacji BETWEEN '2013-12-1' AND '2013-12-31';

w listopadzie 2013 (w tym i kolejnych zapytaniach użyj funkcji date_part lub extract),
SELECT idzamowienia, datarealizacji FROM zamowienia WHERE EXTRACT(MONTH FROM datarealizacji)=11 AND EXTRACT(YEAR FROM datarealizacji)=2013; 


★ w listopadzie lub grudniu 2013,
SELECT idzamowienia, datarealizacji FROM zamowienia WHERE EXTRACT(MONTH FROM datarealizacji)=11 AND EXTRACT(YEAR FROM datarealizacji)=2013
UNION
SELECT idzamowienia, datarealizacji FROM zamowienia WHERE EXTRACT(MONTH FROM datarealizacji)=12 AND EXTRACT(YEAR FROM datarealizacji)=2013;


★ 17, 18 lub 19 dnia miesiąca,
SELECT idzamowienia, datarealizacji FROM zamowienia WHERE EXTRACT(DAY FROM datarealizacji) IN (17,18,19);

★ 46 lub 47 tygodniu roku.
SELECT idzamowienia, datarealizacji FROM zamowienia WHERE EXTRACT(WEEK FROM datarealizacji) IN (46, 47);


Napisz zapytanie w języku SQL wyświetlające informacje na temat czekoladek (idCzekoladki, nazwa, czekolada, orzechy, nadzienie), których nazwa:

rozpoczyna się na literę 'S',
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki WHERE nazwa LIKE 'S%';

rozpoczyna się na literę 'S' i kończy się na literę 'i',
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki WHERE nazwa LIKE 'S%i';

rozpoczyna się na literę 'S' i zawiera słowo rozpoczynające się na literę 'm',
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki WHERE nazwa LIKE 'S% m%';

rozpoczyna się na literę 'A', 'B' lub 'C',
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki WHERE nazwa SIMILAR TO '[A,B,C]%';

zawiera rdzeń 'orzech' (może on wystąpić na początku i wówczas będzie pisany z wielkiej litery),
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki WHERE nazwa SIMILAR TO '%[O,o]rzech%';

★ rozpoczyna się na literę 'S' i zawiera w środku literę 'm',
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki WHERE nazwa SIMILAR TO '%[O,o]rzech%';

★ zawiera słowo 'maliny' lub 'truskawki',
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki WHERE nazwa SIMILAR TO '%(maliny|truskawki)%';

★ nie rozpoczyna się żadną z liter: 'D'-'K', 'S' i 'T',
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki WHERE nazwa SIMILAR TO '[^D-K,^S,^T]%';

★ rozpoczyna się od 'Slod' ('Słod'),
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki WHERE nazwa LIKE 'Słod%';

★ składa się dokładnie z jednego słowa.
SELECT idczekoladki, nazwa, czekolada, orzechy, nadzienie FROM czekoladki WHERE nazwa SIMILAR TO '[A-Za-z]+';


Napisz zapytanie w języku SQL oparte na tabeli Klienci, które:

wyświetla nazwy miast, z których pochodzą klienci cukierni i które składają się z więcej niż jednego słowa,
SELECT miejscowosc FROM klienci WHERE miejscowosc LIKE '% %';


wyświetla nazwy klientów, którzy podali numer stacjonarny telefonu,
SELECT nazwa FROM klienci WHERE telefon SIMILAR TO '[0-9 ]{13}';

★ wyświetla nazwy klientów, którzy podali numer komórkowy telefonu,
SELECT nazwa FROM klienci WHERE telefon SIMILAR TO '[0-9 ]{11}';


Korzystając z zapytań z zadania 2.4 oraz operatorów UNION, INTERSECT, EXCEPT napisz zapytanie w języku SQL 
wyświetlające informacje na temat czekoladek (idCzekoladki, nazwa, masa, koszt), których:

masa mieści się w przedziale od 15 do 24 g lub koszt produkcji mieści się w przedziale od 15 do 24 gr,

SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE masa BETWEEN 15 AND 24
UNION
SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE koszt BETWEEN 0.15 AND 0.24;


masa mieści się w przedziale od 25 do 35 g, ale koszt produkcji nie mieści się w przedziale od 25 do 35 gr,

SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE masa BETWEEN 25 AND 35
EXCEPT
SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE KOSZT BETWEEN 0.25 AND 0.35;

masa mieści się w przedziale od 15 do 24 g i koszt produkcji mieści się w przedziale od 15 do 24 gr lub 
masa mieści się w przedziale od 25 do 35 g i koszt produkcji mieści się w przedziale od 25 do 35 gr,
SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE masa BETWEEN 15 AND 24
INTERSECT
SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE koszt BETWEEN 0.15 AND 0.24
UNION
SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE masa BETWEEN 25 AND 35
INTERSECT
SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE koszt BETWEEN 0.25 AND 0.35;

★ masa mieści się w przedziale od 15 do 24 g i koszt produkcji mieści się w przedziale od 15 do 24 gr,
SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE masa BETWEEN 15 AND 24
INTERSECT
SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE koszt BETWEEN 0.15 AND 0.24


★ masa mieści się w przedziale od 25 do 35 g, ale koszt produkcji nie mieści się ani w przedziale od 15 do 24 gr, ani w przedziale od 29 do 35 gr.
SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE masa BETWEEN 25 AND 35
EXCEPT
SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE koszt BETWEEN 0.15 AND 0.24
EXCEPT
SELECT idczekoladki, nazwa, masa, koszt FROM czekoladki WHERE koszt BETWEEN 0.29 AND 0.35;

identyfikatory klientów, którzy nigdy nie złożyli żadnego zamówienia,

SELECT idklienta FROM klienci
EXCEPT
SELECT idklienta FROM zamowienia;


identyfikatory pudełek, które nigdy nie zostały zamówione,
SELECT idpudelka FROM artykuly
EXCEPT
SELECT idpudelka FROM pudelka;



★ nazwy klientów, czekoladek i pudełek, które zawierają rz (lub Rz),
SELECT nazwa FROM 
(SELECT nazwa FROM klienci
UNION
SELECT nazwa FROM czekoladki
UNION
SELECT nazwa FROM pudelka) as tabela WHERE nazwa SIMILAR TO '%(rz|Rz)%';

★ identyfikatory czekoladek, które nie występują w żadnym pudełku.
SELECT idczekoladki FROM czekoladki
EXCEPT
SELECT idczekoladki FROM zawartosc;



    identyfikator meczu, sumę punktów zdobytych przez gospodarzy i sumę punktów zdobytych przez gości,
    SELECT gospodarze[1] + gospodarze[2] + gospodarze[3] + coalesce(gospodarze[4], 0) + coalesce(gospodarze[5], 0) AS "Suma punktów gospodarzy", goscie[1]+ goscie[2]+ goscie[3]+ coalesce(goscie[4], 0) + coalesce(goscie[5], 0) AS "Suma punktów gości" from statystyki;

    identyfikator meczu, sumę punktów zdobytych przez gospodarzy i sumę punktów zdobytych przez gości, dla meczów, które skończyły się po 5 setach i zwycięzca ostatniego seta zdobył ponad 15 punktów,
    SELECT idmeczu, gospodarze[1] + gospodarze[2] + gospodarze[3] + coalesce(gospodarze[4], 0) + coalesce(gospodarze[5], 0), goscie[1]+ goscie[2]+ goscie[3]+ coalesce(goscie[4], 0) + coalesce(goscie[5], 0) 
    FROM 
    (SELECT idmeczu, gospodarze, goscie FROM statystyki WHERE array_length(gospodarze, 1)=5 AND array_length(goscie, 1)=5 AND (gospodarze[5]>15 OR goscie[5]>15)) as k;

    identyfikator i wynik meczu w formacie x:y, np. 3:1 (wynik jest pojedynczą kolumną – napisem),
    SELECT idmeczu, FORMAT('%s:%s',array_length(gospodarze,1), array_length(goscie,1)-1) from statystyki WHERE gospodarze[array_length(gospodarze,1)] > goscie[array_length(goscie,1)];
    UNION
    SELECT idmeczu, FORMAT('%s:%s',array_length(goscie,1)), array_length(gospodarze,1)) from statystyki WHERE gospodarze[array_length(gospodarze,1)] < goscie[array_length(goscie,1)];
    ★ identyfikator meczu, sumę punktów zdobytych przez gospodarzy i sumę punktów zdobytych przez gości, dla meczów, w których gospodarze zdobyli ponad 100 punktów,
    ★ identyfikator meczu, liczbę punktów zdobytych przez gospodarzy w pierwszym secie, sumę punktów zdobytych w meczu przez gospodarzy, dla meczów, w których pierwiastek kwadratowy z liczby punktów zdobytych w pierwszym secie jest mniejszy niż logarytm o podstawie 2 z sumy punktów zdobytych w meczu. ;)

