CREATE PROCEDURE GetTop3BarbersByRating
AS
BEGIN
    SELECT TOP 3 b.Id, b.LastName, b.FirstName, b.MiddleName,
           AVG(CAST(f.RatingId AS FLOAT)) AS СредняяОценка,
           COUNT(f.Id) AS КоличествоОценок
    FROM Barbers b
    JOIN Feedbacks f ON b.Id = f.BarberId
    GROUP BY b.Id, b.LastName, b.FirstName, b.MiddleName
    HAVING COUNT(f.Id) >= 1
    ORDER BY AVG(CAST(f.RatingId AS FLOAT)) DESC;
END;
GO
EXEC GetTop3BarbersByRating;
GO