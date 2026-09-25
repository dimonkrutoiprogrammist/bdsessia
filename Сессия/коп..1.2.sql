USE sessia;
GO

INSERT INTO Clients (LastName, FirstName, Phone, Email)
VALUES ('Тестов', 'Тест', '79001239999', 'test@mail.ru');
GO

UPDATE Services SET Price = Price + 100 WHERE Name = 'Стрижка мужская';
GO

DELETE FROM VisitArchive WHERE Id = 6;
GO
SELECT * FROM Clients WHERE LastName = 'Тестов';
SELECT * FROM Services WHERE Name = 'Стрижка мужская';
SELECT * FROM VisitArchive;
GO