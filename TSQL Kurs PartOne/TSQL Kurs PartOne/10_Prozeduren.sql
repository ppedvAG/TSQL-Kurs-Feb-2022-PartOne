--ohne Parameter
--mit Parameter
--mit Übergabe

--Was sind Prozeduren?
--wie Windows Batch 
--Prozedur kann viele versch Statements ausführen
--BI Logik
--schneller weil der Plan auch nach Neustart vorliegt

exec procName


create proc procname 
as
select 100


exec procname


--Vorsiocht ohne GO.. rekursiver Aufruf

create or alter proc gpdemo1
as
select getdate()
GO


exec gpdemo1

---------------

create proc gpdemo2 @par1 int, @par2 int
as
select @par1*@par2
GO

exec gpdemo2 100, 200

--erhöhe die Frachtkosten um 10% bei allen Bestellungen , die weniger als 50 Frachtkosten

exec gpFrachtplus 30, 1.2

create proc gpFrachtplus @Frachtkosten money, @plus decimal(2,1)
as
update orders2 set freight = freight * @plus
--select * 
from orders2 where freight < @Frachtkosten
GO

exec gpSucheKunden 'ALFKI' --1 DS

exec gpSucheKunden 'A' --4 DS  alle mit A beginnend

exec gpSucheKunden   --alle  --- '%'

--1 Hürde.. das Ding muss grundsätzlich funktionieren
--customerid nchar 5

create or alter proc gpSucheKunden @kdid nvarchar(5) = '%' -- 'A----'
as
IF  exec gpSuchewenigeelse
exec gpSuchenviele
select * from customers where customerid like @kdid  +'%'






--Kunden ´Löschen

exec gpDelKunde 'ALFKI'

select * into kunden from customers
--orders2
select * into od from [Order Details]





create proc gpDelKunden @KdId  @realy bit =0
as
IF @realy = 0
--Orderdatails
select * from od 
--Orders
select * from orders2
--Customers
select * from kunden

else



create or alter proc gpDelKunden @KdId nvarchar(10), @realy bit=0
as
IF @realy = 0
BEGIN 
select * from od where orderid in (select orderid from orders2 where customerid = @Kdid)
select * from orders2 where customerid = @Kdid
select *  from customers where customerid = @Kdid
END
ELSE
BEGIN
--Orderdetails
delete from  --select *
od where orderid in (select orderid from orders2 where customerid = @Kdid)
--Orders
delete   --select customerid 
from orders2 where customerid = @Kdid
--Customers#
delete from 
--select * 
kunden where customerid = @Kdid
END



gpdelKunden 'ALFKI',1



set statistics io, time on
select * into oxy from nwindbig..orders

select * from oxy where orderid < 10

--49000 900ms 120ms Dauer

--mit IX 0 ms und 12 Seiten

create proc gpdemo10 @id int
as
select * from oxy where orderid < @id

exec gpdemo10 1000000


dbcc freeproccache



select * from oxy where orderid < 1000000 --49000 1,1 CPU 5 Sek Dauer

exec gpdemo10 1000000


create or alter proc gpdemo20 @par1 int=0, @par2 int, @par3 int output --auch input
as
select @par3= @par1*@par2
GO

declare @varx as int=0
exec gpdemo20 10, 20, @par3 = @varx output
select @varx

exec gpdemo20 @par2=10, @par1=90, @par3 = @varx output

select * from orders where freight < @varx

--Proz soll den Schnitt der Frachtkosten aus einem best Land herausfinden
--shipcountry



create or alter procedure gpSchnittland @Land varchar(50), @landschnitt money output
as
select @landschnitt=avg(freight) from orders where shipcountry = @Land
select @landschnitt
print @landschnitt
GO

declare @schnitt as money
exec gpSchnittland 'UK' , @landschnitt = @schnitt output
select * from orders where freight < @schnitt
--und welche Orders liegen unter diesen Schnitt




