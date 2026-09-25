SELECT name AS Серверная_роль, type_desc AS Тип
FROM sys.server_principals
WHERE type = 'R';
GO