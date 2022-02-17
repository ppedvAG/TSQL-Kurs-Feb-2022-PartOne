--Temp Tabellen

--mal wieder  ABC Analyse 

select var(freight), avg(freight), stdev(freight) from orders








with cte
as
(
select employeeid , sum(freight) as Frachtsumme , 
rank()  over (order by sum(freight)) as Rang1,
rank()  over (order by sum(freight) desc) as Rang2
from orders group by employeeid
) 
select * from cte where Rang1 = 1 or Rang2 = 1





