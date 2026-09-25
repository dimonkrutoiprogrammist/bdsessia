CREATE TRIGGER trg_PreventSixthJunior
ON Barbers
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @JuniorPositionId INT;
    SELECT @JuniorPositionId = Id FROM Positions WHERE Name = 'Джуниор-барбер';

    IF EXISTS (SELECT 1 FROM inserted WHERE PositionId = @JuniorPositionId)
    BEGIN
        DECLARE @JuniorCount INT;
        SELECT @JuniorCount = COUNT(*) FROM Barbers WHERE PositionId = @JuniorPositionId;

        IF @JuniorCount >= 5
        BEGIN
            RAISERROR('Нельзя добавить нового джуниор-барбера: уже работают 5', 16, 1);
            RETURN;
        END
    END

    INSERT INTO Barbers (LastName, FirstName, MiddleName, Gender, Phone, Email, BirthDate, HireDate, PositionId)
    SELECT LastName, FirstName, MiddleName, Gender, Phone, Email, BirthDate, HireDate, PositionId
    FROM inserted;
END;
GO
INSERT INTO Barbers (LastName, FirstName, Gender, Phone, BirthDate, PositionId)
VALUES ('Шестой', 'Джуниор', 'М', '79007778899', '1995-01-01', 3);
GO