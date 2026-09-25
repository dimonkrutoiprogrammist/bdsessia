SELECT pr.name AS Роль,
       pe.permission_name AS Разрешение,
       pe.state_desc AS Состояние
FROM sys.server_permissions pe
JOIN sys.server_principals pr ON pe.grantee_principal_id = pr.principal_id
ORDER BY pr.name;
GO