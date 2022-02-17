--SICHTEN   VIEWS

/*
= hat keine Daten, sondern ist eher eine gemerkte Abfrage

Views werden behandelt wie: TABELLEN!!!!

INS UP DEL ... geht nicht mehr wenn nicht alle Pflichtfelder gefüllt werden oder bei JOINS
Security


Angestellte: email, Gehalt, Religion, GebTag

Peter muss aus Ang die Tel raussuchen , aber nur die aus Österreich

dem Peter wird der zugriff auf Ang verweigert

Peter bekommt eine Sicht  in der die Spalten Tel , Famname nur der Österrreicher ausgegeben wird
und Peter kann lesen

--> Besitzverkettung...

--> eine Sicht anlegen darf nicht wirklich jeder!!!!!!



create view vName
as
SELECT ...

*/

--Problem bei Sichten
create table slf (id int, Stadt int, Land int);
GO


insert into slf
select 1,10,100
UNION ALL
select 2,20,200
UNION ALL
select 3,30,300

select * from slf


















