CREATE FUNCTION GetMostPopularBarber()
RETURNS TABLE
AS
RETURN (
    SELECT TOP 1 b.Id, b.LastName, b.FirstName, b.MiddleName,
           COUNT(v.Id) AS КоличествоКлиентов
    FROM Barbers b
    JOIN VisitArchive v ON b.Id = v.BarberId
    GROUP BY b.Id, b.LastName, b.FirstName, b.MiddleName
    ORDER BY COUNT(v.Id) DESC
);
GO
SELECT * FROM GetMostPopularBarber();
GO