CREATE FUNCTION GetLongestService()
RETURNS TABLE
AS
RETURN (
    SELECT TOP 1 Id, Name, Price, DurationMinutes
    FROM Services
    ORDER BY DurationMinutes DESC
);
GO
SELECT * FROM GetLongestService();
GO