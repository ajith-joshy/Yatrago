/*
sp_helptext SP_AdminLogin
GO
*/

/*
SELECT name
FROM sys.procedures
ORDER BY name;
*/

/*
CREATE PROCEDURE SP_FilterBookings
(
    @RouteId INT = NULL,
    @BusId INT = NULL
)
AS
BEGIN

    SELECT

        B.BookingId,

        U.Username,

        BU.BusName,

        R.Source,

        R.Destination,

        B.JourneyDate,

        B.SeatNumbers,

        B.TotalAmount,

        B.BookingStatus,

        B.CreatedAt

    FROM Bookings B

    INNER JOIN Users U
        ON B.UserId = U.UserId

    INNER JOIN Buses BU
        ON B.BusId = BU.BusId

    INNER JOIN Routes R
        ON BU.RouteId = R.RouteId

    WHERE

        (@RouteId IS NULL
        OR
        R.RouteId = @RouteId)

    AND

        (@BusId IS NULL
        OR
        BU.BusId = @BusId)

    ORDER BY B.CreatedAt DESC

END
*/

EXEC SP_FilterBookings
GO

EXEC SP_FilterBookings 1, NULL
GO

EXEC SP_FilterBookings NULL, 2
GO

EXEC SP_FilterBookings 1, 2
GO

