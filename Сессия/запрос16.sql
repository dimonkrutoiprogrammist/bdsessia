CREATE PROCEDURE GetTop3BarbersByMonth
    @Year INT,
    @Month INT
AS
BEGIN
    SELECT TOP 3 b.Id, b.LastName, b.FirstName, b.MiddleName,
           SUM(v.TotalCost) AS Выручка
    FROM Barbers b
    JOIN VisitArchive v ON b.Id = v.BarberId
    WHERE YEAR(v.VisitDate) = @Year AND MONTH(v.VisitDate) = @Month
    GROUP BY b.Id, b.LastName, b.FirstName, b.MiddleName
    ORDER BY SUM(v.TotalCost) DESC;
END;
GO
EXEC GetTop3BarbersByMonth 2026, 10;
GO