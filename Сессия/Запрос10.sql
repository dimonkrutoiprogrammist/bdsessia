CREATE FUNCTION GetLongestWorkingBarber()
RETURNS TABLE
AS
RETURN (
    SELECT TOP 1 Id, LastName, FirstName, MiddleName, HireDate,
           DATEDIFF(YEAR, HireDate, GETDATE()) AS Стаж
    FROM Barbers
    ORDER BY HireDate ASC
);
GO
SELECT * FROM GetLongestWorkingBarber();
GO