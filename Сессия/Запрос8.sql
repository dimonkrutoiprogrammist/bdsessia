CREATE TRIGGER trg_PreventDeleteChief
ON Barbers
INSTEAD OF DELETE
AS
BEGIN
    DECLARE @ChiefPositionId INT;
    SELECT @ChiefPositionId = Id FROM Positions WHERE Name = 'Чиф-барбер';

    IF EXISTS (SELECT 1 FROM deleted WHERE PositionId = @ChiefPositionId)
    BEGIN
        DECLARE @ChiefCount INT;
        SELECT @ChiefCount = COUNT(*) FROM Barbers WHERE PositionId = @ChiefPositionId;

        IF @ChiefCount < 2
        BEGIN
            RAISERROR('Нельзя удалить чиф-барбера, пока нет второго чиф-барбера', 16, 1);
            RETURN;
        END
    END
    DELETE FROM Barbers WHERE Id IN (SELECT Id FROM deleted);
END;
GO
DELETE FROM Barbers WHERE Id = 1;
GO