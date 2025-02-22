DECLARE @DateBackUp NVARCHAR(512)
DECLARE @TimeBackUp NVARCHAR(512)
DECLARE @dbName NVARCHAR(512)
DECLARE @pathName NVARCHAR(512)
DECLARE @jobName NVARCHAR(512)

 SET @dbName = "ERP"
 SET @jobName = 'FullDatabaseBackup-'+@dbName
 SET @DateBackUp = convert(varchar, getdate(), 23)
 SET @TimeBackUp = replace(convert(varchar, getdate(), 8),':','-')
 SET @pathName = 'E:\DBServer\SQL-BackUP\'+@DateBackUp+'-'+@dbName+'-'+@TimeBackUp+'-full-d.bak'


 BACKUP DATABASE @dbName
     TO DISK = @pathName
     WITH NOFORMAT,
     NOINIT,
     NAME = @jobName,
     SKIP,
     NOREWIND,
     NOUNLOAD,
     STATS = 10
