CREATE FUNCTION GetBiggestSpender()
RETURNS TABLE
AS
RETURN (
    SELECT TOP 1 c.Id, c.LastName, c.FirstName, c.Phone,
           SUM(v.TotalCost) AS ВсегоПотрачено
    FROM Clients c
    JOIN VisitArchive v ON c.Id = v.ClientId
    GROUP BY c.Id, c.LastName, c.FirstName, c.Phone
    ORDER BY SUM(v.TotalCost) DESC
);
GO
SELECT * FROM GetBiggestSpender();
GO