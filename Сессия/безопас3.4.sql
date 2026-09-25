USE master;
GO

CREATE LOGIN Марат WITH PASSWORD = 'Marat123!';
GO

USE sessia;
GO

CREATE USER Марат FOR LOGIN Марат;
GO

ALTER ROLE db_backupoperator ADD MEMBER Марат;
GO

SELECT dp.name AS Пользователь, r.name AS Роль
FROM sys.database_role_members rm
JOIN sys.database_principals dp ON rm.member_principal_id = dp.principal_id
JOIN sys.database_principals r ON rm.role_principal_id = r.principal_id
WHERE dp.name = 'Марат';
GO