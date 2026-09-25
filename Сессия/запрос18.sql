CREATE PROCEDURE GetBarberScheduleForDay
    @BarberId INT,
    @WorkDate DATE
AS
BEGIN
    SELECT s.Id, b.LastName + ' ' + b.FirstName AS Барбер,
           s.WorkDate, s.StartTime, s.EndTime
    FROM Schedules s
    JOIN Barbers b ON s.BarberId = b.Id
    WHERE s.BarberId = @BarberId AND s.WorkDate = @WorkDate;
END;
GO
EXEC GetBarberScheduleForDay 1, '2026-10-01';
GO