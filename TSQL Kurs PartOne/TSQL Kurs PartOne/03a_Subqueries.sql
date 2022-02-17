--Unterabfragen

select  * from tabelle

select * from (select ...) t --hier muss ein Alias stehen

select spalte, (select ...) from tabelle --es muss gelten: das Ergebnis des Suquery darf nur eine Wert zurückgeben

select * from tabelle 
where sp = (select ..) -- es muss gelten:  darf nur eine Spalte mit einem Wert sein)


select * from tabelle 
where sp in (select ..) -- es muss gelten:  darf nur eine Spalte , aber mehr Werte


--alle Bestellungen, die unterhalb des Durchschnitts der Frachtkosten liegen
select * from orders where freight < (select avg(freight) from orders)


--Alternative: Variablen

--Angestellter mit höchstern Frachten
--Angestellten mir niedrigsten Frachtkosten
--am besten zu einem Ergebnis

select * from (
						select top 1 employeeid  from orders order by freight desc
						) t1
UNION
select * from (
						select top 1 employeeid  from orders order by freight asc
						) t2
									






select 100
UNION 
select 200




