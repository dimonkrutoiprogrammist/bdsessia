USE sessia;
GO

CREATE USER Ирина FOR LOGIN Ирина;
GO

ALTER ROLE db_datareader ADD MEMBER Ирина;
GO


 SELECT dp.name AS Пользователь, r.name AS Роль
FROM sys.database_role_members rm
JOIN sys.database_principals dp ON rm.member_principal_id = dp.principal_id
JOIN sys.database_principals r ON rm.role_principal_id = r.principal_id
WHERE dp.name = 'Ирина';
GO 