--ABC Analyse
--@var: lokale Lebenszeit: nur während des Batches  GO!!!!
--@@var globale-- systemvariablen
select @@

declare @var1 int
set @var1 = 100
GO
select @var1


declare @var1 int =1
select @var1
set @var1 = 100
select @var1


declare @var2 as int

select @var2= count(*) from customers where country = 'UK'
select @var2
select country, @var2= count(*) from customers where country = 'USA' --error


declare @var2 as int

select @var2= count(*) from customers where country = 'UK'
select @var2


select * from orders where employeeid = @var2


--Alle Bestellungen, deren Frachtkosten unter dem Schnitt der Frachtkosten lagen

declare @schnitt as money
select @schnitt = avg(freight) from orders
select @schnitt

select freight -@schnitt from orders where freight < @schnitt

select orderid, freight - (select avg(freight) from orders) , freight from orders


declare @var2 varchar(125)









