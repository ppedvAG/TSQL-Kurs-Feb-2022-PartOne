-- LEFT RIGHT INNER CROSS


SELECT * FROM TABELLE A INNER|LEFT|RIGHT|CROSS|FULL JOIN TABELLE B
						ON A.spx = B.spx
											 INNER|LEFT|RIGHT|CROSS|FULL JOIN TABELLE C
						ON B.sp2 = C.sp3
											 INNER|LEFT|RIGHT|CROSS|FULL JOIN TABELLE D
						ON C.sp4 = D.sp5
						....


select * from customers c inner join orders o on c.CustomerID=o.CustomerID


select * from customers c left join orders o on c.CustomerID=o.CustomerID

--Aufgabe.. Suche alle Kunden die nichts kauften

select * 
			from 
						customers c left join orders o 
											on c.CustomerID=o.CustomerID
			where
						o.customerid is null
	
	
	select * 
			from 
				orders o right  join customers c
											on c.CustomerID=o.CustomerID
			where
						o.customerid is null


select * from customers where customerid not in (select customerid from orders)


--Join über mehrere Tabellen


--Welcher Kunde (Companyname) hat welches Produkt gekauft?

--Customers--> Orders--> Order details --> Products

--91                         830     2155                               90


--eindeutigkeit durch Distinct--eliminieren von doppeten 
select distinct c.CompanyName, p.ProductName
				from 
				customers c inner join orders o					on c.CustomerID   = o.CustomerID
											 inner join [Order Details] od	on od.OrderID		=o.OrderID
											 inner join Products p				on p.ProductID		= od.ProductID
order by  1,2 ---c.CompanyName, p.ProductName




select lastname, city from employees


--Ergebnisse untereinander: UNION EXCEPT INTERSECT
--.. nebenbei immer ein :		 JOIN

--Ausgabe: Lastname, City, City , Lastname
--Liste aller Angestellten und deren Stellvertreter

--Join auf sich selber
select e.lastname, e.city, e2.city, e2.lastname from employees e inner join Employees e2
		on e.city = e2.city 
		where e.lastname != e2.lastname


--Liste aller Angestellten und deren Verkäufe
--Lastname, Produktname, Verkaufpreis, Menge (unitprice quantity)


select distinct
		  e.Lastname							 -- alle Spalten aus Employees
		, p.Productname					-- alle Spalten aus Products
		, od.Unitprice  , od.Quantity --alle Spalten aus Order Details
from 
		Employees e inner join orders o on o.EmployeeID=e.EmployeeID
							   inner join [Order Details] od on od.OrderID=o.OrderID
							   inner join Products p on p.ProductID = od.ProductID
			







