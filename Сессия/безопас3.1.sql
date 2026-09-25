USE sessia;
GO

CREATE USER Марк FOR LOGIN Марк;
GO

ALTER ROLE db_owner ADD MEMBER Марк;
GO


SELECT dp.name AS Пользователь, r.name AS Роль
FROM sys.database_role_members rm
JOIN sys.database_principals dp ON rm.member_principal_id = dp.principal_id
JOIN sys.database_principals r ON rm.role_principal_id = r.principal_id
WHERE dp.name = 'Марк';
GO