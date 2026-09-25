RESTORE LOG sessia
FROM DISK = 'C:\Backup\sessia_log.trn'
WITH RECOVERY;
GO
USE sessia;
GO

SELECT * FROM Clients;
SELECT * FROM Services;
SELECT * FROM Barbers;
GO