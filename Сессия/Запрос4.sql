CREATE PROCEDURE GetBarbersByServiceId
    @ServiceId INT
AS
BEGIN
    SELECT b.Id, b.LastName, b.FirstName, b.MiddleName
    FROM Barbers b
    JOIN BarberServices bs ON b.Id = bs.BarberId
    WHERE bs.ServiceId = @ServiceId;
END;
GO
EXEC GetBarbersByServiceId 1;
GO