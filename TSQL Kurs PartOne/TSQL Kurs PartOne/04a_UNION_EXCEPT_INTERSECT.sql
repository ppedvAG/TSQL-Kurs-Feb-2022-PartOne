--ABC Analyse


UNION

select 100 as Sp1
UNION 
select 200 as Sp2

select '100'
UNION 
select 'A'

select 100
union
select 100.12

select 100, 200
UNION
select 300, NULL

--gleich viele Spalten und komptabler Datentyp

select 100
UNION
select 200
UNION 
select 300

--nur 2 Zeilen
select 'A'
UNION
select 'B'
UNION 
select 'A'


--UNION ALL.. keine Filterung nach doppelten Zeilen... unbedingt: nicht union , wenn es keine doppleten gibt
select 'A'
UNION ALL
select 'B'
UNION  ALL
select 'A' 


--ABC Analyse:  0 - 100 A Kunden     101 -500 B Kunde   >500 C Kunde

select * from orders


--Ausgabe:
--Customerid, freight, ABC


select Customerid, freight , 'A' from orders where freight <= 100
UNION ALL
select Customerid, freight , 'B' from orders where freight between 100.01 and 500
UNION ALL
select Customerid, freight , 'C' from orders where freight > 500


CASE
	when wert = 1 then A --wie ein Where
	when wert = 2 then B
	else
END


select customerid, freight,
	CASE
		when freight <=100 then 'A Kunde'
		when freight > 500 then 'C Kunde'
		else 'B Kunde'
	END as KundenTYP
from orders



----






