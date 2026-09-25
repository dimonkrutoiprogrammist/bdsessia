USE sessia;
GO

-- Проверяем, что данные из полной копии на месте
SELECT COUNT(*) AS Клиентов FROM Clients;
SELECT COUNT(*) AS Услуг FROM Services;
SELECT COUNT(*) AS Барберов FROM Barbers;
GO