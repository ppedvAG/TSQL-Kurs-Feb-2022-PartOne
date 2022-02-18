--zusätzliche DAtensätze ...
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