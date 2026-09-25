USE master;
GO

CREATE LOGIN Олег WITH PASSWORD = 'Oleg123!';
GO

USE sessia;
GO

CREATE USER Олег FOR LOGIN Олег;
GO

ALTER ROLE db_ddladmin ADD MEMBER Олег;
GO

SELECT dp.name AS Пользователь, r.name AS Роль
FROM sys.database_role_members rm
JOIN sys.database_principals dp ON rm.member_principal_id = dp.principal_id
JOIN sys.database_principals r ON rm.role_principal_id = r.principal_id
WHERE dp.name = 'Олег';
GO