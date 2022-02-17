/*

SELECT  TOP 10  DISTINCT * , Spalten1, Spalte2,  Aggregate(), F(), TXT, Zahl, Sp as Aliasname
		(select ..), Mathe,...
FROM
		TABELLE, VIEWS, F(), (Select ...)  INNER , LEFT  , RIGHT, CROSS JOIN TABLLEN, SICHTEN, F()
		ON A.Sp1 = B.Sp2
WHERE
GROUP BY   HAVING
UNION
ORDER BY ALIAS 



*/



select country as Land, sum(freight)  as SummeFracht, o.OrderDate
where country = 'UK' ----freight < 10
group by country --having country = 'UK'
order by LAND



---Logischer Fluss


--> FROM --> JOINs (ALIAS)-->WHERE -->GROUP BY --> HAVING--> SELECT (Mathe, Aliase)--> order by--> TOP DISTINCT--> Ausgabe




select 100

select * 
from 


orders where orderid = 10