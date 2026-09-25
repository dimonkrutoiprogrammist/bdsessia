CREATE FUNCTION GetAllBarbers()
--запрос1
RETURNS TABLE
AS
RETURN (
    SELECT LastName + ' ' + FirstName + ' ' + ISNULL(MiddleName,'') AS ФИО
    FROM Barbers
);
GO
SELECT * FROM GetAllBarbers();
GO