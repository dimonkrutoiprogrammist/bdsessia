CREATE TRIGGER trg_PreventDoubleBooking
ON Appointments
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Appointments a
            ON i.BarberId = a.BarberId
            AND i.AppointmentDate = a.AppointmentDate
            AND i.StartTime = a.StartTime
            AND a.Status <> 'Отменён'
    )
    BEGIN
        RAISERROR('Это время уже занято у данного барбера', 16, 1);
        RETURN;
    END

    INSERT INTO Appointments (ClientId, BarberId, ServiceId, AppointmentDate, StartTime, Status)
    SELECT ClientId, BarberId, ServiceId, AppointmentDate, StartTime, Status
    FROM inserted;
END;
GO
INSERT INTO Appointments (ClientId, BarberId, ServiceId, AppointmentDate, StartTime)
VALUES (1, 1, 1, '2026-10-01', '10:00');
GO