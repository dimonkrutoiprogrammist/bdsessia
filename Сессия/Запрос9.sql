CREATE TRIGGER trg_PreventYoungBarber
ON Barbers
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM inserted
        WHERE DATEDIFF(YEAR, BirthDate, GETDATE()) < 21
    )
    BEGIN
        RAISERROR('Нельзя добавить барбера младше 21 года', 16, 1);
        RETURN;
    END

    INSERT INTO Barbers (LastName, FirstName, MiddleName, Gender, Phone, Email, BirthDate, HireDate, PositionId)
    SELECT LastName, FirstName, MiddleName, Gender, Phone, Email, BirthDate, HireDate, PositionId
    FROM inserted;
END;
GO
INSERT INTO Barbers (LastName, FirstName, Gender, Phone, BirthDate, PositionId)
VALUES ('Молодой', 'Парень', 'М', '79001234567', '2010-01-01', 3);
GO