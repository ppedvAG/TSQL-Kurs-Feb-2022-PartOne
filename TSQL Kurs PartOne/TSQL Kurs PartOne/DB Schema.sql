create table ma.projekte (mapro int)
create table ma.Mitrbeiter (MAmit int)

create table it.projekte (itpro int)
create table it.Mitrbeiter (itmit int)

use master

use Northwind

sp_setApprole 'Gehaltsrolle' , 'ppedv2019!'

select * from orders

--DML (I U D)   DDL (CR DR AL)


create trigger trgMonitor on DATABASE
for DDL_database_level_events
as
select eventdata()



