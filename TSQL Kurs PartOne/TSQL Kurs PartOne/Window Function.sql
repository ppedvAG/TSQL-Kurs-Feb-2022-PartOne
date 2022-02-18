--Window Functions

select orderid, orderdate,  freight ,
		sum(freight) over (partition by orderdate order by orderdate),
		sum(freight) over ( order by orderdate)
from orders

select orderid , employeeid, freight, rank() over (partition by employeeid order by freight) from orders

------------------------weiter Window Functions

/*
Window functions
R�nge

*/

select orderid, employeeid, customerid, freight
from orders

select orderid, employeeid, customerid, freight,
		row_number() over (order by freight asc)	
from orders
order by customerid



with cte
as
(
select orderid, employeeid, customerid, freight,
		row_number() over 	(partition  by employeeid 	order by freight asc) as Rang	
from orders)
----Unterabrage
select * from cte where Rang = 1

--Spalte Fracht f�r jeden Tag aufaddieren

select orderdate, freight, sum(freight) over (order by orderdate asc rows unbounded preceding) from orders

--pro Tag aufaddieren

select orderdate, freight, sum(freight) over (partition by orderdate order by orderdate asc rows unbounded preceding) from orders



--RANK.. gleiche R�nge ..n�chster Rang wird �bersprungen
--wie im Sport

select orderid, employeeid, customerid, freight,
		rank() over (order by freight asc)	
from orders



--ABC Analyse

--NTILE  gleiche Teile

select NTILE(3) over (order by freight)
, freight from orders



select orderid, 
	sum(unitprice*quantity)
		over ( order by orderid ROWS UNBOUNDED PRECEDING) ,
	sum(unitprice*quantity)
		over ( order by orderid RANGE UNBOUNDED PRECEDING),
	sum(unitprice*quantity)
		OVER(ORDER BY orderid ROWS Between CURRENT ROW and 2 Following )    	
  ,sum(unitprice*quantity)
		OVER(ORDER BY orderid ROWS Between 2 FOLLOWING and 3 Following )    
  ,sum(unitprice*quantity)
		OVER(ORDER BY orderid ROWS Between 2 Preceding and 2 Following ) 
from [order details]


--LAG

select EmployeeID, YEAR(orderdate),
		sum(freight) as aktFracht,
		LAG(sum(Freight),1,0) over (partition by employeeid 
									order by year(orderdate)) 
									as VorJahr,
		sum(freight) -LAG(sum(Freight),1,0) over (partition by employeeid 
									order by year(orderdate)) 
from orders 
group by EmployeeID, YEAR(OrderDate)
order by 1
amsgo.com
RANK


select EmployeeID, YEAR(orderdate),
		sum(freight) as aktFracht,
		LAG(sum(Freight),1,0) over (partition by employeeid 
									order by year(orderdate)) 
									as VorJahr,
		sum(freight) -LAG(sum(Freight),1,0) over (partition by employeeid 
									order by year(orderdate)) 
from orders 
group by EmployeeID, YEAR(OrderDate)
order by 1

row_number()

ntile()

Lag()