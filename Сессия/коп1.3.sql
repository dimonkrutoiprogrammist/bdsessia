BACKUP DATABASE sessia
TO DISK = 'C:\Backup\sessia_diff.bak'
WITH DIFFERENTIAL, NAME = 'sessia - Differential Backup';
GO