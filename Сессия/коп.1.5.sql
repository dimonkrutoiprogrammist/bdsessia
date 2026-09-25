BACKUP LOG sessia
TO DISK = 'C:\Backup\sessia_log.trn'
WITH NAME = 'sessia - Transaction Log Backup';
GO
ALTER DATABASE sessia SET RECOVERY FULL;
GO