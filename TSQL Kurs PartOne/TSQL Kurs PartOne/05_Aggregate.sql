
--SUM(), MIN(), MAX(), AVG(), COUNT(), Var(), Stdev()




































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
