--WHERE ..und das was vielleicht niht so klar ist...;-)

select * from orders --alle aus dem Jahr 1997 orderdate

--408
--datetypen: datetime (ms) wird intern als ganze Zahl gespeichert
--OTTO
--char(50): 'Otto                            ' 50
--varchar(50) 'Otto' 4

select * from orders  where orderdate between '1.1.1997' and '31.12.1997' -- schnell aber falsch
select * from orders  where orderdate between '1.1.1997' and '31.12.1997 23:59:59.999' -- schnell aber immer noch falsch
select * from orders  where orderdate between '1.1.1997' and '31.12.1997 23:59:59.997' -- schnell aber immer noch falsch

--

select * from orders  where orderdate like '%1997%' richtig aber langsam

select * from orders where year(orderdate) = 1997 --richtig aber langsam

select * from orders where year(orderdate) = '1997' --nicht viel besser


TELEFONBUCH:  A bis Z 

select * from customers where companyname like 'A%'
select * from customers where left(companyname,1) = 'A' --f() über eine Spalte im where ist immer ein komplettes durchsuchen


select * from orders where shipregion = NULL --bei NULL kein = sondern is null


--alle die ein  ' im Companyname haben...
select * from customers where companyname like '%''%' --2 Hochkommas

--Suche nach %

select * from customers where companyname like '%%%' --hmmm

select * from customers where CompanyName like '%[%]%' --besser


--[] -- matching pattern steht für genau ein Zeichen

select * from customers where customerid  like '[A-C]%'


select * from customers where customerid  like '[ABC]%[S-Z]'

--Suche alle Kunden die in Customerid als vorletzten Buchstaben ein Vokal haben   aeiou

select * from customers where customerid like  '%[^aeiou|0-9]_'  ^ist das negieren eines Bereichs


--PIN... [0-9][0-9][0-9][0-9]

select * from customers where customerid like '%[%'


--- %Wert% --> Volltextsuche  


--wie finde ich alle Maier bzw meier  bzw myer meyer bzw mayr


select soundex('Maier'),soundex('meier'), soundex('mayr')







