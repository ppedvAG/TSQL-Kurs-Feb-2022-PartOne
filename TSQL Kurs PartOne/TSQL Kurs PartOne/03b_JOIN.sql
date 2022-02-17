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
