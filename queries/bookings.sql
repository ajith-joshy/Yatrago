/*
USE YatragoDB;
*/

/*
CREATE PROCEDURE dbo.SP_GetBookingsByUserId
(
    @UserId INT
)
AS
BEGIN

    SELECT
        BK.BookingId,
        BK.JourneyDate,
        BK.SeatNumbers,
        BK.TotalAmount,
        BK.BookingStatus,
        BK.CreatedAt,

        B.BusName,
        B.BusNumber,

        R.Source,
        R.Destination

    FROM dbo.Bookings BK

    INNER JOIN dbo.Buses B
    ON BK.BusId = B.BusId

    INNER JOIN dbo.Routes R
    ON B.RouteId = R.RouteId

    WHERE BK.UserId = @UserId

    ORDER BY BK.CreatedAt DESC;

END
*/

/*
CREATE PROCEDURE dbo.SP_GetPassengersByBookingId
(
    @BookingId INT
)
AS
BEGIN

    SELECT
        PassengerId,
        BookingId,
        PassengerName,
        Age,
        Gender,
        SeatNumber

    FROM dbo.PassengerDetails

    WHERE BookingId = @BookingId;

END
*/

/*
SELECT * FROM dbo.Bookings;
*/

/*
CREATE PROCEDURE dbo.SP_CancelBooking
(
    @BookingId INT
)
AS
BEGIN

    UPDATE dbo.Bookings

    SET
        BookingStatus = 'Cancelled'

    WHERE BookingId = @BookingId;

END
*/

/*
SELECT * FROM dbo.PassengerDetails;
*/

/*
CREATE PROCEDURE dbo.SP_GetUsers
AS
BEGIN

    SELECT
        UserId,
        FirstName,
        LastName,
        Username,
        Email,
        Phone,
        Gender,
        DOB,
        CreatedAt

    FROM dbo.Users

    ORDER BY CreatedAt DESC;

END
*/

/*
CREATE PROCEDURE dbo.SP_GetAllBookings
AS
BEGIN

    SELECT
        BK.BookingId,
        BK.JourneyDate,
        BK.SeatNumbers,
        BK.TotalAmount,
        BK.BookingStatus,
        BK.CreatedAt,

        U.Username,

        B.BusName,
        B.BusNumber,

        R.Source,
        R.Destination

    FROM dbo.Bookings BK

    INNER JOIN dbo.Users U
    ON BK.UserId = U.UserId

    INNER JOIN dbo.Buses B
    ON BK.BusId = B.BusId

    INNER JOIN dbo.Routes R
    ON B.RouteId = R.RouteId

    ORDER BY BK.CreatedAt DESC;

END
*/

/*
CREATE PROCEDURE dbo.SP_GetUpcomingBookingCount
(
    @UserId INT
)
AS
BEGIN

    SELECT
        COUNT(*) AS UpcomingCount

    FROM dbo.Bookings

    WHERE
        UserId = @UserId
        AND BookingStatus = 'Booked'
        AND JourneyDate >= CAST(GETDATE() AS DATE);

END
*/

/*
USE YatragoDB;
GO
*/

/*
SELECT * FROM dbo.PassengerDetails;
*/

/*
CREATE PROCEDURE SP_GetTicketDetails
(
    @BookingId INT
)
AS
BEGIN

    SELECT
        b.BookingId,
        b.TotalAmount,
        b.CreatedAt,
        b.JourneyDate,

        bs.BusName,

        r.Source,
        r.Destination,

        p.PassengerName,
        p.Age,
        p.Gender,
        p.SeatNumber

    FROM Bookings b

    INNER JOIN Buses bs
    ON b.BusId = bs.BusId

    INNER JOIN Routes r
    ON bs.RouteId = r.RouteId

    INNER JOIN PassengerDetails p
    ON b.BookingId = p.BookingId

    WHERE b.BookingId = @BookingId;

END
*/

/*
CREATE NONCLUSTERED INDEX IX_Bookings_UserId
ON dbo.Bookings(UserId);

CREATE NONCLUSTERED INDEX IX_Bookings_BusId
ON dbo.Bookings(BusId);

CREATE NONCLUSTERED INDEX IX_Bookings_JourneyDate
ON dbo.Bookings(JourneyDate);

CREATE NONCLUSTERED INDEX IX_Bookings_BookingStatus
ON dbo.Bookings(BookingStatus);
*/

/*
CREATE NONCLUSTERED INDEX IX_PassengerDetails_BookingId
ON dbo.PassengerDetails(BookingId);
*/

/*
CREATE NONCLUSTERED INDEX IX_Routes_SourceDestination
ON dbo.Routes(Source, Destination);
*/

/*
CREATE NONCLUSTERED INDEX IX_Buses_RouteId
ON dbo.Buses(RouteId);
*/

/*
SELECT * FROM dbo.Users;
*/

/*
CREATE PROCEDURE SP_DateWiseReport
(
    @JourneyDate DATE
)
AS
BEGIN

    SELECT
        BK.BookingId,
        U.Username,
        B.BusName,
        R.Source,
        R.Destination,
        BK.SeatNumbers,
        BK.TotalAmount,
        BK.BookingStatus

    FROM Bookings BK

    INNER JOIN Users U
    ON BK.UserId = U.UserId

    INNER JOIN Buses B
    ON BK.BusId = B.BusId

    INNER JOIN Routes R
    ON B.RouteId = R.RouteId

    WHERE BK.JourneyDate = @JourneyDate

    ORDER BY BK.CreatedAt DESC;

END
*/

/*
CREATE PROCEDURE SP_BusWiseReport
(
    @BusId INT
)
AS
BEGIN

    SELECT
        P.PassengerName,
        P.Age,
        P.Gender,
        P.SeatNumber,

        B.BusName,

        BK.JourneyDate,

        U.Username

    FROM PassengerDetails P

    INNER JOIN Bookings BK
    ON P.BookingId = BK.BookingId

    INNER JOIN Users U
    ON BK.UserId = U.UserId

    INNER JOIN Buses B
    ON BK.BusId = B.BusId

    WHERE BK.BusId = @BusId

    ORDER BY BK.JourneyDate DESC;

END
*/

/*
CREATE NONCLUSTERED INDEX IX_Bookings_Bus_Journey_Status
ON dbo.Bookings
(
    BusId,
    JourneyDate,
    BookingStatus
)
INCLUDE(SeatNumbers);
*/

/*
ALTER PROCEDURE dbo.SP_GetBookedSeats
(
    @BusId INT,
    @JourneyDate DATE
)
AS
BEGIN

    SET NOCOUNT ON;

    SELECT
        SeatNumbers

    FROM dbo.Bookings

    WHERE
        BusId = @BusId
        AND JourneyDate = @JourneyDate
        AND BookingStatus = 'Booked';

END
*/

/*
CREATE NONCLUSTERED INDEX IX_Bookings_User_Created
ON dbo.Bookings(UserId, CreatedAt DESC)
INCLUDE
(
    BusId,
    JourneyDate,
    SeatNumbers,
    TotalAmount,
    BookingStatus
);
*/

/*
ALTER PROCEDURE dbo.SP_GetBookingsByUserId
(
    @UserId INT
)
AS
BEGIN

    SET NOCOUNT ON;

    SELECT
        BK.BookingId,
        BK.JourneyDate,
        BK.SeatNumbers,
        BK.TotalAmount,
        BK.BookingStatus,
        BK.CreatedAt,

        B.BusName,
        B.BusNumber,

        R.Source,
        R.Destination

    FROM dbo.Bookings BK

    INNER JOIN dbo.Buses B
    ON BK.BusId = B.BusId

    INNER JOIN dbo.Routes R
    ON B.RouteId = R.RouteId

    WHERE BK.UserId = @UserId

    ORDER BY BK.CreatedAt DESC;

END
*/

/*
ALTER PROCEDURE dbo.SP_GetAvailableSeats
(
    @BusId INT,
    @JourneyDate DATE
)
AS
BEGIN

    SET NOCOUNT ON;

    DECLARE @TotalSeats INT;
    DECLARE @BookedSeats INT;

    -- GET TOTAL SEATS OF THE BUS

    SELECT TOP 1
        @TotalSeats = TotalSeats
    FROM dbo.Buses
    WHERE BusId = @BusId;

    -- COUNT BOOKED SEATS

    SELECT
        @BookedSeats =
        ISNULL
        (
            SUM
            (
                LEN(SeatNumbers)
                - LEN(REPLACE(SeatNumbers, ',', ''))
                + 1
            ),
            0
        )
    FROM dbo.Bookings
    WHERE
        BusId = @BusId
        AND JourneyDate = @JourneyDate
        AND BookingStatus = 'Booked';

    -- RETURN AVAILABLE SEATS

    SELECT
        @TotalSeats - @BookedSeats
        AS AvailableSeats;

END
GO
*/

/*
CREATE NONCLUSTERED INDEX IX_Bookings_Journey_Created
ON dbo.Bookings
(
    JourneyDate,
    CreatedAt DESC
)
INCLUDE
(
    UserId,
    BusId,
    SeatNumbers,
    TotalAmount,
    BookingStatus
);
*/

/*
CREATE NONCLUSTERED INDEX IX_Bookings_Bus_Journey
ON dbo.Bookings
(
    BusId,
    JourneyDate DESC
)
INCLUDE
(
    UserId,
    BookingId
);
*/

/*
CREATE NONCLUSTERED INDEX IX_PassengerDetails_Booking_Covering
ON dbo.PassengerDetails(BookingId)
INCLUDE
(
    PassengerName,
    Age,
    Gender,
    SeatNumber
);
*/

/*
ALTER PROCEDURE dbo.SP_CancelBooking
(
    @BookingId INT
)
AS
BEGIN

    SET NOCOUNT ON;

    UPDATE dbo.Bookings

    SET
        BookingStatus = 'Cancelled'

    WHERE
        BookingId = @BookingId
        AND BookingStatus <> 'Cancelled';

END
GO
*/

/*
SELECT
    OBJECT_NAME(s.object_id) AS TableName,
    i.name AS IndexName,
    s.user_seeks,
    s.user_scans,
    s.user_lookups,
    s.user_updates

FROM sys.dm_db_index_usage_stats s

INNER JOIN sys.indexes i
ON s.object_id = i.object_id
AND s.index_id = i.index_id

WHERE OBJECTPROPERTY(s.object_id,'IsUserTable') = 1;

*/

/*
DROP INDEX IX_Routes_SourceDestination
ON dbo.Routes;
*/


/*
CREATE PROCEDURE SP_GetRevenueReport
AS
BEGIN

    SELECT

        JourneyDate,

        COUNT(*) AS TotalBookings,

        SUM(TotalAmount) AS TotalRevenue

    FROM Bookings

    GROUP BY JourneyDate

    ORDER BY JourneyDate DESC

END
*/

/*
ALTER PROCEDURE dbo.SP_CancelBooking
(
    @BookingId INT
)
AS
BEGIN

    SET NOCOUNT ON;

    UPDATE dbo.Bookings

    SET
        BookingStatus = 'Cancelled'

    WHERE
        BookingId = @BookingId
        AND BookingStatus <> 'Cancelled';

    SELECT @@ROWCOUNT;

END
*/

/*
CREATE OR ALTER PROCEDURE dbo.SP_GetLiveBuses
AS
BEGIN

    SET NOCOUNT ON;

    SELECT

        B.BusName,

        B.BusType,

        B.TotalSeats,

        R.Source,

        R.Destination

    FROM dbo.Buses B

    INNER JOIN dbo.Routes R
    ON B.RouteId = R.RouteId;

END
GO
*/