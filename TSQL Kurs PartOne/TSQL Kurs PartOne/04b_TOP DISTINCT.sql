--TOP 1  10 %


--die wilde 13 
select * from orders order by freight  --top 13

--Top 13 Kunden nach Frachtkosten gemessen.. je weniger Frachtkosten desto besser

select top 13 customerid , freight from orders--welche DS... so wie die auf der Platte gerade rumliegen

select top 3 * from customers--  eigt weiss man ohne order by nicht was rauskommt.... 

--wenn man alle haben möchte 
select top 100 percent * from orders


select top 13 customerid , freight from orders order by freight

--LONEP beschwert sich, da er gleich viele Frachtkosten hatte wie der 13.te

select top 13 with ties customerid , freight from orders order by freight --mit Krawatte..


--DISTINCT filter doppelte Ergebniszeilen-- nie einsetzen wenn es keine doppelten gibt
select distinct  customerid from orders






