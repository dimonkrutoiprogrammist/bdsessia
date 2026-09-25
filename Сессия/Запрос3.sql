CREATE FUNCTION GetBarbersByServiceName(@ServiceName NVARCHAR(100))
RETURNS TABLE
AS
RETURN (
    SELECT b.Id, b.LastName, b.FirstName, b.MiddleName
    FROM Barbers b
    JOIN BarberServices bs ON b.Id = bs.BarberId
    JOIN Services s ON bs.ServiceId = s.Id
    WHERE s.Name = @ServiceName
);
GO
SELECT * FROM GetBarbersByServiceName('Традиционное бритьё бороды');
GO