CREATE PROCEDURE GetBarbersWithExperience
    @Years INT
AS
BEGIN
    SELECT b.Id, b.LastName, b.FirstName, b.HireDate,
           DATEDIFF(YEAR, b.HireDate, GETDATE()) AS Стаж
    FROM Barbers b
    WHERE DATEDIFF(YEAR, b.HireDate, GETDATE()) > @Years;
END;
GO
EXEC GetBarbersWithExperience 3;
GO