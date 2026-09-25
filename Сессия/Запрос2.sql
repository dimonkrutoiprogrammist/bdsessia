CREATE PROCEDURE GetSeniorBarbers
AS
BEGIN
    SELECT b.Id, b.LastName, b.FirstName, b.MiddleName, b.Phone, b.Email
    FROM Barbers b
    JOIN Positions p ON b.PositionId = p.Id
    WHERE p.Name = 'Синьор-барбер';
END;
GO 
EXEC GetSeniorBarbers;
GO