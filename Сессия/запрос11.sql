CREATE PROCEDURE GetTopBarberByPeriod
    @DateFrom DATE,
    @DateTo DATE
AS
BEGIN
    SELECT TOP 1 b.Id, b.LastName, b.FirstName, b.MiddleName,
           COUNT(v.Id) AS КоличествоКлиентов
    FROM Barbers b
    JOIN VisitArchive v ON b.Id = v.BarberId
    WHERE v.VisitDate BETWEEN @DateFrom AND @DateTo
    GROUP BY b.Id, b.LastName, b.FirstName, b.MiddleName
    ORDER BY COUNT(v.Id) DESC;
END;
GO
EXEC GetTopBarberByPeriod '2026-01-01', '2026-12-31';
GO