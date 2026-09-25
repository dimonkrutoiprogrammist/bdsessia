USE sessia;
GO

DENY INSERT, UPDATE, DELETE ON DATABASE::sessia TO Ирина;
GO

SELECT pr.name AS Пользователь,
       pe.permission_name AS Разрешение,
       pe.state_desc AS Состояние
FROM sys.database_permissions pe
JOIN sys.database_principals pr ON pe.grantee_principal_id = pr.principal_id
WHERE pr.name = 'Ирина';
GO