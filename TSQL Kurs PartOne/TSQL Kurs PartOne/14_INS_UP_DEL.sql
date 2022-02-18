--INSERT

--select into

select * into tabOrders from orders

--Spaltennamen, Datentypen, Identity
select * from taborders


insert into taborders (CustomerID,EmployeeID, OrderDate)
values
									('ALFKI', 3, Getdate())


insert into tabOrders
select   [CustomerID]
      ,[EmployeeID]
      ,[OrderDate]
      ,[RequiredDate]
      ,[ShippedDate]
      ,[ShipVia]
      ,[Freight]
      ,[ShipName]
      ,[ShipAddress]
      ,[ShipCity]
      ,[ShipRegion]
      ,[ShipPostalCode]
      ,[ShipCountry]
      ,[RngSumme] from orders where shipcity = 'London'

	  select * into #Kunden from customers

	  select * from #Kunden  --Cid, Coty, Country, Companyname)

	  -- Datensätze einfügen per insert und valuies

	  -- insert und select


	  insert into #Kunden (customerid, CompanyName, Country, city)
	  values
											 ('PPEAG', 'Fa ppedv ag', 'Austria', 'Salzburg')
											, ('PPEAH', 'Fa ppedv gmbh', 'Austria', 'Linz')

	  insert into #Kunden (customerid, CompanyName, Country, city)
	  select 'PPEAX', 'Fa ppedv ag', 'Austria', 'Salzburg'
	  UNION ALL
	   select 'PPEAY', 'Fa ppedv ag', 'Austria', NULL


--UPDATE

update tabelle set sp = Wert
				where sp = ...

select * from #Kunden

update #kunden set ContactName = 'Arnold Shcw.',
where customerid = 'ARNIS'


select * from orders order by CustomerID asc

--Alle Kunden die von 1 kauften , sollen im ContactTtel ein X dazu bekommen
update #kunden set ContactTitle = 'X'
--select distinct k.customerid 
from #kunden k inner join orders o on k.CustomerID=o.CustomerID
	where o.EmployeeID=1


--Kopie der Tabelle orders

select * into orders2 from orders


--Alle Frachtkosten um 10 % erhöhen, bei denen der Chai  verkauft wurde

--Alle DS suchen in orders2 die Chai enthielten
begin tran
update orders2 set freight = freight *1.1
--select distinct o.orderid  
from
orders2 o inner join [order details] od on o.orderid = od.orderid 
				inner join Products p on p.ProductID= od.ProductID
				where p.ProductName like 'Chai%'
rollback
commit


---delete 

delete from #kunden where customerid = 'ALFKI'

--Lösche Kunden, die nichts kauften
delete  #kunden
--select distinct k.customerid
from #kunden k 
			left join orders o on k.CustomerID=o.CustomerID
			where o.CustomerID is null

select * from #kunden

--lösche alle X dort wo X in contacttitle

update #kunden set ContactTitle = NULL where ContactTitle = 'X'
























