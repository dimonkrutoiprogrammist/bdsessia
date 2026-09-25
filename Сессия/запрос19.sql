CREATE PROCEDURE GetFreeSlotsForWeek
    @BarberId INT,
    @WeekStart DATE
AS
BEGIN
    SELECT s.WorkDate,
           s.StartTime,
           s.EndTime,
           CASE
               WHEN a.Id IS NULL THEN 'Свободно'
               ELSE 'Занято'
           END AS Статус
    FROM Schedules s
    LEFT JOIN Appointments a
        ON s.BarberId = a.BarberId
        AND s.WorkDate = a.AppointmentDate
        AND a.Status <> 'Отменён'
    WHERE s.BarberId = @BarberId
      AND s.WorkDate BETWEEN @WeekStart AND DATEADD(DAY, 6, @WeekStart);
END;
GO
EXEC GetFreeSlotsForWeek 1, '2026-09-28';
GO