CREATE FUNCTION GetClientsWithoutFeedback()
RETURNS TABLE
AS
RETURN (
    SELECT c.Id, c.LastName, c.FirstName, c.Phone
    FROM Clients c
    WHERE NOT EXISTS (SELECT 1 FROM Feedbacks f WHERE f.ClientId = c.Id)
);
GO
SELECT * FROM GetClientsWithoutFeedback();
GO