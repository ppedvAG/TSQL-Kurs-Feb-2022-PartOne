	create table procrunning (Procrunning varchar(50), spid int)

	create or alter proc gptest 
	as
	insert into ##procrunning
	select 'gptest' , @@spid as SPID 
	waitfor delay '00:00:50'
	delete from ##procrunning where Procrunning = 'gptest' and spid = @@spid



sp_who

 SELECT PRO.spid, PRO.loginame, PRO.hostname, PRO.program_name, 
  DB.name AS DatabaseName, PRO.open_tran, PRO.blocked, 
  REQ.command, SQL.text AS SqlStatement, 
  SES.prev_error, SES.row_count,  
  REQ.wait_resource, REQ.wait_time 
 FROM sys.sysprocesses AS PRO 
  CROSS APPLY sys.dm_exec_sql_text(PRO.sql_handle) AS SQL 
  LEFT JOIN sys.sysdatabases AS DB 
   ON SQL.dbid = DB.dbid 
   LEFT JOIN sys.dm_exec_requests AS REQ 
  ON PRO.request_id = REQ.request_id 
   AND PRO.spid = REQ.session_id 
   LEFT JOIN sys.dm_exec_sessions AS SES 
   ON REQ.session_id = SES.session_id 
   where waittime > 1000

   select * from sys.dm_exec_requests
   select * from sys.dm_exec_sessions
   select * from sys.dm_exec_sql_text(0x03000700A4FDD31ADAEDD30040AE000001000000000000000000000000000000000000000000000000000000) 