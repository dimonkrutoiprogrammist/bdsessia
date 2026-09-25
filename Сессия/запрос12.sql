CREATE FUNCTION GetMostFrequentClient()
RETURNS TABLE
AS
RETURN (
    SELECT TOP 1 c.Id, c.LastName, c.FirstName, c.Phone,
           COUNT(v.Id) AS КоличествоПосещений
    FROM Clients c
    JOIN VisitArchive v ON c.Id = v.ClientId
    GROUP BY c.Id, c.LastName, c.FirstName, c.Phone
    ORDER BY COUNT(v.Id) DESC
);
GO
SELECT * FROM GetMostFrequentClient();
GO