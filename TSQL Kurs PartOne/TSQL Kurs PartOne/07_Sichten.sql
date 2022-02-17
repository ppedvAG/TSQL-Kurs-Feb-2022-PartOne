--SICHTEN   VIEWS

/*
= hat keine Daten, sondern ist eher eine gemerkte Abfrage

Views werden behandelt wie: TABELLEN!!!!

INS UP DEL ... geht nicht mehr wenn nicht alle Pflichtfelder gefüllt werden oder bei JOINS
Security


Angestellte: email, Gehalt, Religion, GebTag

Peter muss aus Ang die Tel raussuchen , aber nur die aus Österreich

dem Peter wird der zugriff auf Ang verweigert

Peter bekommt eine Sicht  in der die Spalten Tel , Famname nur der Österrreicher ausgegeben wird
und Peter kann lesen

--> Besitzverkettung...

--> eine Sicht anlegen darf nicht wirklich jeder!!!!!!



create view vName
as
SELECT ...

*/

--Problem bei Sichten
create table slf (id int, Stadt int, Land int);
GO


insert into slf
select 1,10,100
UNION ALL
select 2,20,200
UNION ALL
select 3,30,300

select * from slf

create or alter view vslf
as
select * from slf


select * from vslf

--Frage: Ist eine Sicht eigtl schneller oder langsamer oder gleich schnell wie das Statement in der Sicht
--Sicht ist gleich schnell


alter table slf add fluss int

update slf set fluss = id *1000

select * from slf

select * from vslf --fluss fehlt

alter table slf drop column Land 

--jetzt bekommen wir Land mit Werten von Fluss ..Crazy!!!


--besser so schreiben

create table slf2 (id int, Stadt int, Land int);
GO


insert into slf2
select 1,10,100
UNION ALL
select 2,20,200
UNION ALL
select 3,30,300

select * from slf2

create or alter view vslf2 with schemabinding  --!!!!!!!--heißt: man muss sehr korrekt: kein * und alle Tabelle mit Schema
as
select id, stadt, land from dbo.slf2


select * from vslf2

--Frage: Ist eine Sicht eigtl schneller oder langsamer oder gleich schnell wie das Statement in der Sicht
--Sicht ist gleich schnell


alter table slf2 add fluss int

update slf2 set fluss = id *1000

select * from slf2

select * from vslf2 --fluss fehlt

alter table slf2 drop column Land 

--jetzt bekommen wir Land mit Werten von Fluss ..Crazy!!!


--Sicht  --> vKundeBestellung
--Customerid, Companyname, country, city aus Customers
--Orderid, freight, Orderdate aus Orders
--Quantity, Unitprice aus Order destails
--Productname, productid , UnitsinStock aus Products
--Employeeid, lastname aus Employees


create or alter view vKundeBestellung --with schemabinding
as
select 
		c.CustomerID, c.CompanyName, c.Country,c.City,		--Kunden
		o.orderid, o.freight, o.orderdate,									--Bestellungen
		od.UnitPrice, od.Quantity,	(od.UnitPrice *od.Quantity) as PosSumme,	--BestPositionen
		p.ProductName, p.ProductID, p.UnitsInStock,			--Produkt
		e.LastName, e.EmployeeID												--Angestellter
from 
customers c	 inner join orders o					on o.customerid    = c.CustomerID
						inner join [Order Details] od	on od.OrderID		= o.OrderID
						inner join products p				on p.ProductID		= od.ProductID
						inner join Employees e				on e.EmployeeID	= o.EmployeeID

select * from vKundeBestellung


--Summe der Frachtkosten pro Country

--Country, sum(freight)
--Falsches Ergebnis und mehr Aufwand 72%

select Country, sum(freight) from vKundeBestellung  --durch alle 5 Tabellen
group by Country

--27 % und richtig
select country, sum(freight) from customers c inner join orders o on c.CustomerID = o.CustomerID
		group by country




























