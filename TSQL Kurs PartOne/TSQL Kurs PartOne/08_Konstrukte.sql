--CASE WHEN
--LOOP break continue
--IF


--WHILE

WHILE 1=1
	BEGIN
				select 100
	END

	declare @i as int =0

	WHILE @i< 10
	BEGIN
				select @i
				set @i+=1
				IF @i =5 continue
				select @i
				IF @i = 5 break	
	END


	WHILE  (Select count(*) from customers) > 50 AND (select avg(freigt) from orders) < 10
	BEGIN
				select @i
				set @i+=1
				IF @i =5 continue
				select @i
				IF @i = 5 break	
	END


	IF 1=0 select 100


	IF 1=1
		begin
			select 100
		end
	ELSE
		begin
			select 200
			select 300
		end

	select max(freight), sum(freight) from orders2

	--1007,64 --66666,6583

	--Erhöhe die Frachtkosten um 10% solange bis: max Frachtkosten = 1500 ist 
	--und summe der Frachtkosten darf auch nicht 100000

	begin tran
	while

	select 
	rollback

begin tran
set nocount on
declare @i as int = 1

while	(select max(freight) from orders2) <=1500/1.1			or 
			(select sum(freight) from orders2) <=100000/1.1
	begin 
			update orders2 set freight = freight *1.1
			--print convert( varchar(2), @i) + 'x erhöht' 
			--set @i+=1
	end

select max(freight) , sum(freight) from orders2
rollback