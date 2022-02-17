
--SUM(), MIN(), MAX(), AVG(), COUNT(), Var(), Stdev()

select customerid, min(freight) from orders
group by customerid


select country as Land, count(*) from customers
group by country


--Summe der Frachtkosten pro Land und Stadt Kunden
--Customers Country, city    Orders freight
--sortieren nach Summe der Frachtkosten aufsteigend

select country, city , sum(freight) as SummeFracht
	from  
				customers c inner join orders o on c.CustomerID = o.CustomerID
group by country, city 
order by Summefracht asc

--Eingrenzen.. nur noch die , die mehr als 500 Summe haben

select country, city , sum(freight) as SummeFracht
	from  
				customers c inner join orders o on c.CustomerID = o.CustomerID
group by country, city having sum(freight) > 500
order by Summefracht asc

-- in deinem Having nie etwas reinschrieben, was ein where kann!!
--Im Havig stehen eigtl immer nur Aggregate


--Umsatz pro Angestellter

--Employeeid, Umsatz( order details : Unitprice * quantity)

select employeeid, sum(unitprice*quantity)
from
	orders o inner join [Order Details] od on od.OrderID=o.OrderID
group by EmployeeID
order by 1

--Rechnungsumme

--Die höchste Rechnungsumme pro Kunde

--Companyname, höchste RngSumme

select companyname, max(	RngSumme) from 
	(			select companyname, o.orderid, sum(unitprice * quantity) as RngSumme
			from customers c
												inner join orders o on c.CustomerID = o.CustomerID
												inner join [Order Details] od on od.orderid = o.OrderID
			group by companyname, o.orderid
	) t 
		group by Companyname

--Alternative:

--Über die Sicht nicht viel besser
select Companyname, orderid, sum(possumme) from vKundeBestellung
group by companyname, orderid


--temp Tabellen: mehrere Schritte

			select companyname, o.orderid, sum(unitprice * quantity) as RngSumme
			into #t
			from customers c
												inner join orders o on c.CustomerID = o.CustomerID
												inner join [Order Details] od on od.orderid = o.OrderID
			group by companyname, o.orderid


			select companyname, max(	RngSumme)  from #t group by CompanyName


-- 3te Möglichgkeit
--wenn die RngSumme schon drin wäre.. in Orders
--> Neue Spalt RngSumme money befüllen. .. wer aktualisiert die RngSumme, wenn sich was bei einer Best ändert
--> Trigger = perf schlecht

--Neue Spalte RngSumme = F()  Perf noch viel schlechter


--Den Umsatz des fleissigsten Angestellten 
--und den Umsatz des schlechtesten Mitarbeiter

--Lastname, Umsatz
select * from (
select top 1  lastname , sum(unitprice*quantity) as Umsatz
	from orders o 
								inner join employees e on o.EmployeeID=e.EmployeeID
								inner join [order details] od on od.OrderID=o.OrderID 
	group by lastname order by Umsatz asc ) t1
UNION
select * from (
select top 1  lastname , sum(unitprice*quantity) as Umsatz
	from orders o 
								inner join employees e on o.EmployeeID=e.EmployeeID
								inner join [order details] od on od.OrderID=o.OrderID 
	group by lastname order by Umsatz desc) t2

--per #Tabelle
	select top 1  lastname , sum(unitprice*quantity) as Umsatz
	into #1
	from orders o 
								inner join employees e on o.EmployeeID=e.EmployeeID
								inner join [order details] od on od.OrderID=o.OrderID 
	group by lastname order by Umsatz asc

	insert into #1
	select top 1  lastname , sum(unitprice*quantity) as Umsatz
	from orders o 
								inner join employees e on o.EmployeeID=e.EmployeeID
								inner join [order details] od on od.OrderID=o.OrderID 
	group by lastname order by Umsatz desc

	select * from #1

	drop table #1


	--Alternative : @Table  max 1000 DS, tmpTabelle fixe tabelle































select Shipcountry, shipcity , sum(freight) ,
case
	when grouping_id(Shipcountry,Shipcity)=3 then 'Weltweit'
	when grouping_id(Shipcountry,Shipcity)=1 then 'Total : ' + Shipcountry
	when grouping_id(Shipcountry,Shipcity)=0  then 'Gesamt in: ' + Shipcity + ' (' + Shipcountry+')'
end as Frachtkostensumme
from orders
group by shipcountry, shipcity
with rollup
order by 1,2,3
