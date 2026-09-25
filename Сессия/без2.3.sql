SELECT p.name AS Член_роли
FROM sys.server_role_members rm
JOIN sys.server_principals p ON rm.member_principal_id = p.principal_id
JOIN sys.server_principals r ON rm.role_principal_id = r.principal_id
WHERE r.name = 'sysadmin';
GO