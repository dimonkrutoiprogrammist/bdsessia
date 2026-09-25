USE master;
GO

ALTER DATABASE sessia SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

RESTORE DATABASE sessia
FROM DISK = 'C:\Backup\sessia_full.bak'
WITH REPLACE, NORECOVERY;
GO
SELECT name, state_desc FROM sys.databases WHERE name = 'sessia';
GO