begin tran
select @@TRANCOUNT
update customers set city = 'Paris' 
where customerid = 'Alfki'
select * from customers
commit --Bestätigen
rollback --