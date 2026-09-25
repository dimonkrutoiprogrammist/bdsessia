USE sessia;
GO

INSERT INTO Barbers (LastName, FirstName, MiddleName, Gender, Phone, Email, BirthDate, HireDate, PositionId)
VALUES ('Новый', 'Барбер', 'Тестович', 'М', '79005557788', 'new@barber.ru', '1995-05-05', '2024-01-01', 3);
GO

UPDATE Clients SET Phone = '79009990000' WHERE LastName = 'Тестов';
GO

DELETE FROM Services WHERE Name = 'Детская стрижка';
GO