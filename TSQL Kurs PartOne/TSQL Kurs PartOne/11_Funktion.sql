--Funktionen.. SQL Server macht den Untschied 2019
--erst SQL 2019 kann einfache Skalarwert f() in Unterabfragen umwandeln umso besser zu schätzen

--F()????? 
--Gerüchte zu F() ...doof zum Analysieren, könne nicht paralellisiert werden, 

--obwohl die Abfragen  nicht lief, kann der gesch Plan die Anzahl der Zeilen bereits liefern


create function fBrutto (@netto money) returns money
as
begin
	return (select @netto * 1.20)
end


select dbo.fbrutto(100)

select dbo.fbrutto(freight) from orders where dbo.fBrutto(freight) < 100

--Funktion für Rechnugsumme

--fRngSumme(orderid)

create function fRngSumme (@BestId int) returns money
as
begin
return (select sum(unitprice*quantity) from [Order Details] where orderid = @BestId)
end


select orderid, dbo.fRngsumme(orderid) from orders where dbo.fRngSumme(orderid)< 1000


alter table orders add RngSumme as dbo.fRngsumme(orderid)


select * from orders --tats Plan ist falsch, weil er die tab order details nicht anzeigt

set statistics io, time on


SELECT *
  FROM [dbo].[Orders]

GO







create function fBrutto (@netto money) returns money
as
begin
	return (select @netto * 1.20)
end










select * from customers where left(companyname,1) = 'A'




--Statistiken: 
select * from orders where freight < 100
select * from o1 where employeeid = 1 and shipcountry = 'UK'--

select * into o1 from orders
select * from o1 where freight  < 100
select * from o1 where orderid  < 10260


create function fTabelle(@par int)
returns   table               
as
return
	select ....

	select * from dbo.fTabelle(17)


create function fSkalar(@par)
returns int
as
Begin
return (select ..)
end

select fSkalar(Sp), fSkalar(100) from Tabelle where spalte > fskalar(Sp)


create function fmstatementtvf(@par1 )
returns @Tabelle (sp1 int, sp2 int..)
as
Begin
	insert into @tabelle
	select ... where @par1
	return;
end