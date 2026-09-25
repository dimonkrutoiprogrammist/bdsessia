CREATE PROCEDURE MoveCompletedToArchive
AS
BEGIN
    INSERT INTO VisitArchive (ClientId, BarberId, ServiceId, VisitDate, TotalCost, RatingId, Comment)
    SELECT a.ClientId, a.BarberId, a.ServiceId, a.AppointmentDate,
           s.Price, NULL, NULL
    FROM Appointments a
    JOIN Services s ON a.ServiceId = s.Id
    WHERE a.AppointmentDate < CAST(GETDATE() AS DATE)
      AND a.Status = 'Завершён';

    DELETE FROM Appointments
    WHERE AppointmentDate < CAST(GETDATE() AS DATE)
      AND Status = 'Завершён';
END;
GO
EXEC MoveCompletedToArchive;
SELECT * FROM VisitArchive;
GO