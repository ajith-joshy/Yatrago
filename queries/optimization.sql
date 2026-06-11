SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO


/*
EXEC dbo.SP_SearchBuses 'Kochi', 'Chennai';
*/

/*
EXEC dbo.SP_GetBookingsByUserId @UserId = 1;
*/

/*
EXEC dbo.SP_GetAvailableSeats 1, '2026-06-15';
*/

/*
EXEC dbo.SP_DateWiseReport '2026-05-27';
*/

/*
EXEC dbo.SP_BusWiseReport 1;
*/

/*
CREATE NONCLUSTERED INDEX IX_Users_CreatedAt
ON dbo.Users(CreatedAt DESC);

EXEC dbo.SP_GetUsers;
*/

EXEC sp_helpindex 'PassengerDetails';