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
