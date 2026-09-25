CREATE PROCEDURE GetBarbersCountByPosition
AS
BEGIN
    SELECT p.Name AS Позиция, COUNT(b.Id) AS Количество
    FROM Positions p
    LEFT JOIN Barbers b ON p.Id = b.PositionId
    WHERE p.Name IN ('Синьор-барбер', 'Джуниор-барбер')
    GROUP BY p.Name;
END;
GO
EXEC GetBarbersCountByPosition;
GO