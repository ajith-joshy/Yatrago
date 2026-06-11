/*
USE YatragoDB;
*/

/*
CREATE TABLE Routes
(
    RouteId INT PRIMARY KEY IDENTITY(1,1),

    Source VARCHAR(100) NOT NULL,

    Destination VARCHAR(100) NOT NULL,

    Distance DECIMAL(10,2),

    CreatedAt DATETIME DEFAULT GETDATE()
);
*/

/*
CREATE TABLE Buses
(
    BusId INT PRIMARY KEY IDENTITY(1,1),

    BusName VARCHAR(100) NOT NULL,

    BusNumber VARCHAR(50) UNIQUE NOT NULL,

    BusType VARCHAR(50) NOT NULL,

    TotalSeats INT NOT NULL,

    RouteId INT
    FOREIGN KEY REFERENCES Routes(RouteId),

    DepartureTime TIME NOT NULL,

    ArrivalTime TIME NOT NULL,

    FareAmount DECIMAL(10,2) NOT NULL,

    Status BIT DEFAULT 1,

    CreatedAt DATETIME DEFAULT GETDATE()
);
*/

/*
CREATE PROCEDURE SP_AddRoute
(
    @Source VARCHAR(100),

    @Destination VARCHAR(100),

    @Distance DECIMAL(10,2)
)
AS
BEGIN

    INSERT INTO Routes
    (
        Source,
        Destination,
        Distance
    )

    VALUES
    (
        @Source,
        @Destination,
        @Distance
    );

END
*/

/*
CREATE PROCEDURE SP_AddBus
(
    @BusName VARCHAR(100),

    @BusNumber VARCHAR(50),

    @BusType VARCHAR(50),

    @TotalSeats INT,

    @RouteId INT,

    @DepartureTime TIME,

    @ArrivalTime TIME,

    @FareAmount DECIMAL(10,2)
)
AS
BEGIN

    INSERT INTO Buses
    (
        BusName,
        BusNumber,
        BusType,
        TotalSeats,
        RouteId,
        DepartureTime,
        ArrivalTime,
        FareAmount
    )

    VALUES
    (
        @BusName,
        @BusNumber,
        @BusType,
        @TotalSeats,
        @RouteId,
        @DepartureTime,
        @ArrivalTime,
        @FareAmount
    );

END
*/

/*
ALTER PROCEDURE SP_GetRoutes
AS
BEGIN

    SELECT
        RouteId,
        Source,
        Destination,
        Distance,
        CreatedAt

    FROM Routes;

END
*/

/*
CREATE PROCEDURE SP_UpdateRoute
(
    @RouteId INT,

    @Source VARCHAR(100),

    @Destination VARCHAR(100),

    @Distance DECIMAL(10,2)
)
AS
BEGIN

    UPDATE Routes

    SET
        Source = @Source,
        Destination = @Destination,
        Distance = @Distance

    WHERE RouteId = @RouteId;

END
*/

/*
CREATE PROCEDURE SP_DeleteRoute
(
    @RouteId INT
)
AS
BEGIN

    DELETE FROM Routes

    WHERE RouteId = @RouteId;

END
*/
 
 /*
SELECT * FROM 
Routes 
WHERE Destination='thiruvananthapuram';
*/

/*
CREATE PROCEDURE SP_GetBuses
AS
BEGIN

    SELECT
        B.BusId,
        B.BusName,
        B.BusNumber,
        B.BusType,
        B.TotalSeats,
        B.DepartureTime,
        B.ArrivalTime,
        B.FareAmount,
        B.Status,
        R.Source,
        R.Destination

    FROM Buses B

    INNER JOIN Routes R
    ON B.RouteId = R.RouteId;

END
*/

/*
CREATE PROCEDURE SP_UpdateBus
(
    @BusId INT,

    @BusName VARCHAR(100),

    @BusNumber VARCHAR(50),

    @BusType VARCHAR(50),

    @TotalSeats INT,

    @RouteId INT,

    @DepartureTime TIME,

    @ArrivalTime TIME,

    @FareAmount DECIMAL(10,2)
)
AS
BEGIN

    UPDATE Buses

    SET
        BusName = @BusName,
        BusNumber = @BusNumber,
        BusType = @BusType,
        TotalSeats = @TotalSeats,
        RouteId = @RouteId,
        DepartureTime = @DepartureTime,
        ArrivalTime = @ArrivalTime,
        FareAmount = @FareAmount

    WHERE BusId = @BusId;

END
*/

/*
CREATE PROCEDURE SP_DeleteBus
(
    @BusId INT
)
AS
BEGIN

    DELETE FROM Buses

    WHERE BusId = @BusId;

END
*/

/*
ALTER PROCEDURE SP_GetBusById
(
    @BusId INT
)
AS
BEGIN

    SELECT
        BusId,
        BusName,
        BusNumber,
        BusType,
        TotalSeats,
        RouteId,
        DepartureTime,
        ArrivalTime,
        FareAmount,
        Status,
        CreatedAt

    FROM Buses

    WHERE BusId = @BusId;

END
*/

/*
ALTER PROCEDURE SP_GetRouteById
(
    @RouteId INT
)
AS
BEGIN

    SELECT
        RouteId,
        Source,
        Destination,
        Distance,
        CreatedAt

    FROM Routes

    WHERE RouteId = @RouteId;

END
*/

/*
SELECT * FROM
Buses
WHERE BusName='Avengers';
*/

/*
SELECT * FROM Users;
*/

/*
USE YatragoDB;
*/

/*
SELECT * FROM Routes;
*/

/*
CREATE PROCEDURE SP_CheckRouteUsage
(
    @RouteId INT
)
AS
BEGIN

    SELECT COUNT(*) AS BusCount

    FROM dbo.Buses

    WHERE RouteId = @RouteId;

END
*/

/*
ALTER PROCEDURE dbo.SP_SearchBuses
(
    @Source VARCHAR(100),

    @Destination VARCHAR(100)
)
AS
BEGIN

    SELECT
        B.BusId,
        B.BusName,
        B.BusNumber,
        B.BusType,
        B.TotalSeats,
        B.DepartureTime,
        B.ArrivalTime,
        B.FareAmount,
        R.Source,
        R.Destination

    FROM dbo.Buses B

    INNER JOIN dbo.Routes R
    ON B.RouteId = R.RouteId

    WHERE
        LOWER(R.Source) = LOWER(@Source)

        AND

        LOWER(R.Destination) = LOWER(@Destination);

END
*/

/*
CREATE TABLE dbo.Bookings
(
    BookingId INT PRIMARY KEY IDENTITY(1,1),

    UserId INT
    FOREIGN KEY REFERENCES dbo.Users(UserId),

    BusId INT
    FOREIGN KEY REFERENCES dbo.Buses(BusId),

    JourneyDate DATE NOT NULL,

    SeatNumbers VARCHAR(200) NOT NULL,

    TotalAmount DECIMAL(10,2) NOT NULL,

    BookingStatus VARCHAR(20)
    DEFAULT 'Booked',

    CreatedAt DATETIME
    DEFAULT GETDATE()
);
*/

/*
CREATE PROCEDURE dbo.SP_BookSeats
(
    @UserId INT,

    @BusId INT,

    @JourneyDate DATE,

    @SeatNumbers VARCHAR(200),

    @TotalAmount DECIMAL(10,2)
)
AS
BEGIN

    INSERT INTO dbo.Bookings
    (
        UserId,
        BusId,
        JourneyDate,
        SeatNumbers,
        TotalAmount
    )

    VALUES
    (
        @UserId,
        @BusId,
        @JourneyDate,
        @SeatNumbers,
        @TotalAmount
    );

END
*/

/*
SELECT * FROM dbo.Bookings;
*/

/*
CREATE PROCEDURE dbo.SP_GetBookedSeats
(
    @BusId INT
)
AS
BEGIN

    SELECT SeatNumbers

    FROM dbo.Bookings

    WHERE BusId = @BusId
    AND BookingStatus = 'Booked';

END
*/

/*
USE YatragoDB;
*/

/*
DROP PROCEDURE dbo.SP_GetBookedSeats;
*/

/*
CREATE PROCEDURE dbo.SP_GetBookedSeats
(
    @BusId INT,

    @JourneyDate DATE
)
AS
BEGIN

    SELECT SeatNumbers

    FROM dbo.Bookings

    WHERE BusId = @BusId
    AND JourneyDate = @JourneyDate
    AND BookingStatus = 'Booked';

END
*/

/*
CREATE PROCEDURE dbo.SP_GetAvailableSeats
(
    @BusId INT,
    @JourneyDate DATE
)
AS
BEGIN

    DECLARE @TotalSeats INT;
    DECLARE @BookedSeats INT;

    SELECT
        @TotalSeats = TotalSeats
    FROM dbo.Buses
    WHERE BusId = @BusId;

    SELECT
        @BookedSeats =
        ISNULL
        (
            SUM
            (
                LEN(SeatNumbers)
                -
                LEN(REPLACE(SeatNumbers, ',', ''))
                + 1
            ),
            0
        )
    FROM dbo.Bookings
    WHERE BusId = @BusId
    AND JourneyDate = @JourneyDate
    AND BookingStatus = 'Booked';

    SELECT
        @TotalSeats - @BookedSeats
        AS AvailableSeats;

END

    SELECT
        @TotalSeats - @BookedSeats
        AS AvailableSeats;

END
*/

/*
EXEC sp_help 'dbo.Bookings';
*/

/*
CREATE TABLE dbo.PassengerDetails
(
    PassengerId INT
    PRIMARY KEY IDENTITY(1,1),

    BookingId INT
    FOREIGN KEY REFERENCES dbo.Bookings(BookingId),

    PassengerName VARCHAR(100)
    NOT NULL,

    Age INT
    NOT NULL,

    Gender VARCHAR(20)
    NOT NULL,

    SeatNumber VARCHAR(10)
    NOT NULL
);
*/

/*
USE YatragoDB;
*/

/*
ALTER TABLE dbo.Bookings
ADD
Email VARCHAR(100),
Phone VARCHAR(15);
*/

/*
SELECT * FROM PassengerDetails;
*/

/*
ALTER PROCEDURE dbo.SP_BookSeats
(
    @UserId INT,

    @BusId INT,

    @JourneyDate DATE,

    @SeatNumbers VARCHAR(200),

    @TotalAmount DECIMAL(10,2),

    @Email VARCHAR(100),

    @Phone VARCHAR(15)
)
AS
BEGIN

    INSERT INTO dbo.Bookings
    (
        UserId,
        BusId,
        JourneyDate,
        SeatNumbers,
        TotalAmount,
        Email,
        Phone,
        BookingStatus
    )

    VALUES
    (
        @UserId,
        @BusId,
        @JourneyDate,
        @SeatNumbers,
        @TotalAmount,
        @Email,
        @Phone,
        'Booked'
    );

    SELECT SCOPE_IDENTITY();

END
*/

/*
SELECT * FROM PassengerDetails;
*/

/*
ALTER PROCEDURE SP_AddBus
(
    @BusName VARCHAR(100),
    @BusNumber VARCHAR(50),
    @BusType VARCHAR(50),
    @TotalSeats INT,
    @RouteId INT,
    @DepartureTime TIME,
    @ArrivalTime TIME,
    @FareAmount DECIMAL(10,2),
    @Status BIT
)
AS
BEGIN

    INSERT INTO Buses
    (
        BusName,
        BusNumber,
        BusType,
        TotalSeats,
        RouteId,
        DepartureTime,
        ArrivalTime,
        FareAmount,
        Status
    )

    VALUES
    (
        @BusName,
        @BusNumber,
        @BusType,
        @TotalSeats,
        @RouteId,
        @DepartureTime,
        @ArrivalTime,
        @FareAmount,
        @Status
    );

END
*/

/*
ALTER TABLE Buses
ADD BusImage VARCHAR(200);
*/

/*
ALTER PROCEDURE SP_AddBus
(
    @BusName VARCHAR(100),
    @BusNumber VARCHAR(50),
    @BusType VARCHAR(50),
    @TotalSeats INT,
    @RouteId INT,
    @DepartureTime TIME,
    @ArrivalTime TIME,
    @FareAmount DECIMAL(10,2),
    @Status BIT,
    @BusImage VARCHAR(200)
)
AS
BEGIN

    INSERT INTO Buses
    (
        BusName,
        BusNumber,
        BusType,
        TotalSeats,
        RouteId,
        DepartureTime,
        ArrivalTime,
        FareAmount,
        Status,
        BusImage
    )

    VALUES
    (
        @BusName,
        @BusNumber,
        @BusType,
        @TotalSeats,
        @RouteId,
        @DepartureTime,
        @ArrivalTime,
        @FareAmount,
        @Status,
        @BusImage
    );

END
*/

/*
ALTER PROCEDURE SP_GetBuses
AS
BEGIN

    SELECT
        B.BusId,
        B.BusName,
        B.BusNumber,
        B.BusType,
        B.TotalSeats,
        B.DepartureTime,
        B.ArrivalTime,
        B.FareAmount,
        B.Status,
        B.BusImage,

        R.RouteId,
        R.Source,
        R.Destination

    FROM Buses B

    INNER JOIN Routes R
    ON B.RouteId = R.RouteId;

END
*/

/*
ALTER PROCEDURE SP_UpdateBus
(
    @BusId INT,
    @BusName VARCHAR(100),
    @BusNumber VARCHAR(50),
    @BusType VARCHAR(50),
    @TotalSeats INT,
    @RouteId INT,
    @DepartureTime TIME,
    @ArrivalTime TIME,
    @FareAmount DECIMAL(10,2),
    @BusImage VARCHAR(200)
)
AS
BEGIN

    UPDATE Buses

    SET
        BusName = @BusName,
        BusNumber = @BusNumber,
        BusType = @BusType,
        TotalSeats = @TotalSeats,
        RouteId = @RouteId,
        DepartureTime = @DepartureTime,
        ArrivalTime = @ArrivalTime,
        FareAmount = @FareAmount,
        BusImage = @BusImage

    WHERE BusId = @BusId;

END
*/

/*
ALTER PROCEDURE SP_GetBusById
(
    @BusId INT
)
AS
BEGIN

    SELECT
        BusId,
        BusName,
        BusNumber,
        BusType,
        TotalSeats,
        RouteId,
        DepartureTime,
        ArrivalTime,
        FareAmount,
        Status,
        CreatedAt,
        BusImage

    FROM Buses

    WHERE BusId = @BusId;

END
*/

/*
SELECT * FROM dbo.Buses;
*/

/*
ALTER PROCEDURE SP_SearchBuses
(
    @Source VARCHAR(100),
    @Destination VARCHAR(100)
)
AS
BEGIN

    SELECT
        B.BusId,
        B.BusName,
        B.BusNumber,
        B.BusType,
        B.TotalSeats,
        B.DepartureTime,
        B.ArrivalTime,
        B.FareAmount,
        B.BusImage,

        R.Source,
        R.Destination

    FROM Buses B

    INNER JOIN Routes R
    ON B.RouteId = R.RouteId

    WHERE
        R.Source = @Source
        AND
        R.Destination = @Destination
        AND
        B.Status = 1;

END
*/

/*
ALTER PROCEDURE SP_DeleteBus
(
    @BusId INT
)
AS
BEGIN

    -- CHECK BOOKINGS

    IF EXISTS
    (
        SELECT 1
        FROM Bookings
        WHERE BusId = @BusId
    )
    BEGIN
        RETURN;
    END

    -- DELETE BUS

    DELETE FROM Buses
    WHERE BusId = @BusId;

END
*/

/*
CREATE NONCLUSTERED INDEX IX_Routes_Source_Destination
ON dbo.Routes(Source, Destination)
INCLUDE(RouteId);
*/

/*
CREATE NONCLUSTERED INDEX IX_Buses_RouteId_Status
ON dbo.Buses(RouteId, Status)
INCLUDE
(
    BusName,
    BusNumber,
    BusType,
    TotalSeats,
    DepartureTime,
    ArrivalTime,
    FareAmount,
    BusImage
);
*/

/*
ALTER PROCEDURE dbo.SP_SearchBuses
(
    @Source VARCHAR(100),
    @Destination VARCHAR(100)
)
AS
BEGIN

    SET NOCOUNT ON;

    SELECT
        B.BusId,
        B.BusName,
        B.BusNumber,
        B.BusType,
        B.TotalSeats,
        B.DepartureTime,
        B.ArrivalTime,
        B.FareAmount,
        B.BusImage,
        R.Source,
        R.Destination

    FROM dbo.Routes R

    INNER JOIN dbo.Buses B
    ON R.RouteId = B.RouteId

    WHERE
        R.Source = @Source
        AND R.Destination = @Destination
        AND B.Status = 1;

END
*/