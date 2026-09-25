CREATE PROCEDURE GetRegularClients
    @MinVisits INT
AS
BEGIN
    SELECT c.Id, c.LastName, c.FirstName, COUNT(v.Id) AS КоличествоПосещений
    FROM Clients c
    JOIN VisitArchive v ON c.Id = v.ClientId
    GROUP BY c.Id, c.LastName, c.FirstName
    HAVING COUNT(v.Id) >= @MinVisits;
END;
GO
EXEC GetRegularClients 2;
GO