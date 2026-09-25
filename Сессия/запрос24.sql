CREATE FUNCTION GetInactiveClients()
RETURNS TABLE
AS
RETURN (
    SELECT c.Id, c.LastName, c.FirstName, c.Phone,
           MAX(v.VisitDate) AS ПоследнийВизит
    FROM Clients c
    JOIN VisitArchive v ON c.Id = v.ClientId
    GROUP BY c.Id, c.LastName, c.FirstName, c.Phone
    HAVING MAX(v.VisitDate) < DATEADD(YEAR, -1, GETDATE())
);
GO
SELECT * FROM GetInactiveClients();
GO