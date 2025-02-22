DECLARE @DateBackUp NVARCHAR(512)
DECLARE @TimeBackUp NVARCHAR(512)
DECLARE @dbName NVARCHAR(512)
DECLARE @pathName NVARCHAR(512)
DECLARE @jobName NVARCHAR(512)

 SET @DateBackUp = convert(varchar, getdate(), 23)
 SET @TimeBackUp = replace(convert(varchar, getdate(), 8),':','-')
 SET @DateBackUp = convert(varchar, @DateBackUp, 112)
 SET @dbName = "ERP"
 SET @pathName = 'E:\DBServer\SQL-BackUP\'+@DateBackUp+'-'+@dbName+'-'+@TimeBackUp+'-txlog-d.bak'
 SET @jobname = 'DatabaseLogBackup-'+@dbName

BACKUP LOG @dbName
    TO DISK = @pathName
    WITH NAME = @jobname
GO
