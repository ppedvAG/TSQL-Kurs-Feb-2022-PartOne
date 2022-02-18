--Tag2



SELECT DISTINCT TOP 10 Percent with ties  SP, Mathe , TXT, F(), (Select) as Alias), AGG() 
FROM
		TAB A inner|Left|right|cross join  TAB B  on A.sp1 = B.sp2
					inner|Left|right|cross join  TAB C on C.Spx = A.Spy
					inner|Left|right|cross join  TAB D on D.spA = C.SPX
					(SELECT...) T 
					....
WHERE
		a.sp3 > 10  AND B.Sp3 = 10  -- AND binden stärker, daher Klammern setzen
		--WILDCARD: %   _  [] 
		sp > (Select ..)
GROUP BY SP1 , SP2 HAVING AGG() < = Wert
UNION (ALL)  | EXCEPT  INTERSECT
SELECT ...
ORDER BY SP , ALIAS desc asc | 3 desc, 2 asc




--alle Kunden aus GER oder Best von Ang nr 6 und Frachtkosten < 100
--Klammern setzen

select * from customers c inner join orders  o
			on c.customerid = o.customerid
where 
			(country='Germany' or employeeid=6) and freight < 100 ---136

select * from customers c inner join orders  o
			on c.customerid = o.customerid
where 
			country='Germany' or (employeeid=6 and freight < 100)






		select * from customers, orders


		select * from customers cross join orders
















--Aufgaben

--Suchmuster
--Suche alle Kunden aus UK und 
--deren Customerid mit A C oder E beginnt und deren 3.letzter Buchstabe aus  C , O oder S besteht

select * from customers where country = 'UK' and customerid like '[ACE]%[COS]__'

--

--SubQueries
--Augaben: 
--Orderid, Freight, und Abweichung der Frachtkosten vom Schnitt der Freight
select * from orders
select avg(freight) from orders

select orderid, freight - (select avg(freight) from orders) , freight from orders


select * from orders where freight > (select avg(freight) from orders)


select * from orders where freight > (select top 1 freight from orders)



--Alle Bestellungen deren Frachtkosten über dem Schnitt liegen


--Joins
--Haben wirklich alle Bestellungen einen Kunden in der Tabelle Customers 
--oder wurde evtl versehentlich ein Kunde gelöscht

select o.customerid, c.customerid
	from orders o left join customers c on c.customerid = o.customerid
	where c.customerid is null
	order by 2,1

	delete from customers where customerid = 'ALFKI'

	Begin tran
		delete from customers where customerid = 'FISSA'
		rollback







--UNION

--Liste aller Städte aus UK in denen Kunden oder Angestellte sind
--Augabe Merkmal : Angesteller|Kunde Stadt

--> Ausflug Except intersect

--TOP DISTINCT
--Anzeige der TOP 10 Customerids nach Frachtkosten absteigend (ohne Dubletten)


select distinct  top 10 percent  with ties  customerid, freight from orders order by freight desc






with cte as (select  Customerid , freight , rank() over (order by freight desc)as RANG from orders ) 
select * from cte where RANG between 1 and 10

select  top 10 Customerid , freight   from orders  order by freight desc


--Aggregate
--Wie hoch ist der Durchschnitt (der kleinsten Frachtkosten pro Angestellte)

select * from orders

select avg(min(freight), from orders

select avg(minfracht)
from (
	select employeeid, min(freight) as MinFracht from orders
	group by employeeid
	) t 


	select employeeid, min(freight) as MinFracht into #t from orders
	group by employeeid

	select avg(minfracht) from #t


	--CTE

;WITH cteMinFracht
AS
(select employeeid, min(freight) as MinFracht from orders group by employeeid)
SELECT avg(minfracht) from cteMinFracht

select avg(minfracht)
from (
	select employeeid, min(freight) as MinFracht from orders	group by employeeid	) t 




--Vergleiche den Weltweiten Umsatz mit dem des Landes UK
--und dann mit Graz



select country, city , sum(possumme) as Possumme , grouping_id(country, city)  as RANG
into #t
from vKundeBestellung
group by country, city with rollup

select 
(select Possumme from #t where RANG = 3) Welt , 
(select Possumme from #t where  country = 'USA' and RANG = 1) 'USA'

select * from #t where City = 'Graz'


---
with cte as
(select country, city , sum(possumme) as Possumme , grouping_id(country, city)  as RANG
from vKundeBestellung
group by country, city with rollup)
select possumme from cte where rang = 3 or (Country='USA' and RANG = 1)





--Sichten definiere eine Sicht vKundenUK, in der 
--alle Kunden aus UK enthalten sind. (Spalten Customerid, companyname, Country, city)

--Füge über die Sicht einen neuen Kunden ein
--wird das folgende klappen
-- PRINZ   Buckingham Charles	UK				London
-- ARNIS      Terminator AG				AUSTRIA		GRAZ

create view VName
as
select ....


create or alter view vKundenUK
as
select Customerid, companyname, Country, city from customers where country = 'UK'
--order by customerid

insert into vKundenUK
select 'PRINZ', 'BUckingham Palace', 'UK', 'London'

insert into vKundenUK
select 'ARNIS','Terminator AG', 'AUSTRIA','GRAZ'

select * from vKundenUK

delete from vKundenUK where customerid ='PRINZ'
delete from vKundenUK where customerid ='ARNIS'


select * from (select Customerid, companyname, Country, city from customers where country = 'UK') vKunden





