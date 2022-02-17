create function fTabelle(@par int)
returns   table               
as
return
	select ....


create function fSkalar(@par)
returns int
as
Begin
return (select ..)
end

create function fmstatementtvf(@par1 )
returns @Tabelle (sp1 int, sp2 int..)
as
Begin
	insert into @tabelle
	select ... where @par1
	return;
end