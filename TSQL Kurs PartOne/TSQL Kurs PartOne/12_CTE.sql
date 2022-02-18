--zusätzliche DAtensätze ...


;WITH CTENAMEN
AS
(select employeeid, min(freight) as MinFracht from orders group by employeeid)
SELECT * from CTENAMEN


--CTE

--Unterabfragen 

with cte
as
(select ......)
select * from cte


with cte
as
(select employeeid, sum(freight) as SUMMEFRACHT from orders
 group by employeeid)
 select avg(summefracht) from cte


 --Rekursion

 select * from employees
 select lastname, employeeid, reportsto from Employees where reportsto is null

  select e.lastname, e.employeeid, e.reportsto 
 from employees e   where reportsto = 2inner join cte cte.employeeid = e.reportsto
 --Hierarchieausgabe

 with CTE
 as
 (SELECT --... ANKER .. einstiegspunkt
 UNION ALL
 select e.lastname, e.employeeid, e.reportsto 
 from employees e inner join cte cte.employeeid = e.reportsto

 with cteANG
 as
 ( select lastname, employeeid, reportsto from Employees where reportsto is null
 UNION ALL
   select e.lastname, e.employeeid, e.reportsto 
 from employees e   inner join cteAng on cteAng.employeeid = e.reportsto
 ) select * from cteAng


;with cteAngestellte
as
(
select Lastname, employeeid, reportsto, 1 as Rang from employees where reportsto is null --der Einstiegspunkt
UNION ALL
select e.Lastname, e.employeeid, e.reportsto, RANG+1 from employees  e
										inner join cteAngestellte c on c.EmployeeID=e.ReportsTo
	)
select * from cteAngestellte where rang = 2





--CTE

--Unterabfragen 

with cte
as
(select ......)
select * from cte


with cte
as
(select employeeid, sum(freight) as SUMMEFRACHT from orders
 group by employeeid)
 select avg(summefracht) from cte


 --Rekursion

 select * from employees
 select lastname, employeeid, reportsto from Employees where reportsto is null

  select e.lastname, e.employeeid, e.reportsto 
 from employees e   where reportsto = 2inner join cte cte.employeeid = e.reportsto
 --Hierarchieausgabe

 with CTE
 as
 (SELECT --... ANKER .. einstiegspunkt
 UNION ALL
 select e.lastname, e.employeeid, e.reportsto 
 from employees e inner join cte cte.employeeid = e.reportsto

 with cteANG
 as
 ( select lastname, employeeid, reportsto from Employees where reportsto is null
 UNION ALL
   select e.lastname, e.employeeid, e.reportsto 
 from employees e   inner join cteAng on cteAng.employeeid = e.reportsto
 ) select * from cteAng


;with cteAngestellte
as
(
select Lastname, employeeid, reportsto, 1 as Rang from employees where reportsto is null --der Einstiegspunkt
UNION ALL
select e.Lastname, e.employeeid, e.reportsto, RANG+1 from employees  e
										inner join cteAngestellte c on c.EmployeeID=e.ReportsTo
	)
select * from cteAngestellte where rang = 2

select * from Kunden c inner join orders2 o on c.CustomerID = o.customerid

































with cte as
(
select employeeid , lastname , Reportsto ,1 as Rang, lastname as Chef from employees where reportsto is null
UNION all
select e.employeeid, e.lastname,e.reportsto, Rang+1,cte.lastname from employees e inner join cte on e.reportsto = cte.employeeid)
select * from cte


;with cte (orderid, summe, PrNummer,Proz)
as
(select top 100 percent orderid, SUM(unitprice*quantity) over (partition by orderid) SUMME, ProductID,
				convert(varchar(50),((UnitPrice*Quantity)/SUM(unitprice*quantity) over (partition by orderid))*100) +'%' as PROZ
from [Order Details]
order by 1,3 desc)
select *,rank() over  (partition by orderid order by proz)  from cte 