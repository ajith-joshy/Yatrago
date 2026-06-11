/*
CREATE DATABASE YatragoDB;
*/

/*
USE YatragoDB;
*/

/*
CREATE TABLE Admin
(
    AdminId INT PRIMARY KEY IDENTITY(1,1),
    Username VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(100) NOT NULL
);
*/

/*
SELECT * FROM Admin;
*/

/*
CREATE PROCEDURE SP_AdminLogin
(
    @Username VARCHAR(50),
    @Password VARCHAR(100)
)
AS
BEGIN
    SELECT *
    FROM Admin
    WHERE Username = @Username
    AND Password = @Password;
END
*/

/*
CREATE TABLE States
(
    StateId INT PRIMARY KEY IDENTITY(1,1),
    StateName VARCHAR(100) NOT NULL
);
*/

/*
CREATE TABLE Cities
(
    CityId INT PRIMARY KEY IDENTITY(1,1),
    CityName VARCHAR(100) NOT NULL,
    StateId INT
    FOREIGN KEY REFERENCES States(StateId)
);
*/

/*
INSERT INTO States(StateName)
VALUES
('Kerala'),
('Tamil Nadu'),
('Karnataka'),
('Maharashtra'),
('Andhra Pradhesh'),
('Assam')
;
*/

/*
INSERT INTO Cities
(
    CityName,
    StateId
)
VALUES
('Kozhikode',1),
('Kochi',1),
('Trivandrum',1),

('Chennai',2),
('Coimbatore',2),

('Bangalore',3),
('Mysore',3),

('Mumbai',4),
('Pune',4),

('Visakhapatnam',5),
('Vijayawada',5),

('Guwahati',6),
('Silchar',6);
*/

/*
SELECT * FROM States;
*/

/*
SELECT * FROM Cities;
*/

/*
ALTER PROCEDURE SP_GetStates
AS
BEGIN

    SELECT
        StateId,
        StateName

    FROM States;

END
*/

/*
ALTER PROCEDURE SP_GetCitiesByStateId
(
    @StateId INT
)
AS
BEGIN

    SELECT
        CityId,
        CityName,
        StateId

    FROM Cities

    WHERE StateId = @StateId;

END
*/

/*
CREATE TABLE Users
(
    UserId INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Address VARCHAR(300) NOT NULL,
    Username VARCHAR(50) UNIQUE NOT NULL,
    DOB DATE NOT NULL,
    Gender VARCHAR(10) NOT NULL,

    StateId INT
    FOREIGN KEY REFERENCES States(StateId),
    
    CityId INT
    FOREIGN KEY REFERENCES Cities(CityId),
    
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) UNIQUE NOT NULL,
    Password VARCHAR(100) NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);
*/

/*
ALTER TABLE Users
ADD LastLogin DATETIME NULL;
*/

/*
ALTER TABLE Admin
ADD LastLogin DATETIME NULL;
*/

/*
ALTER PROCEDURE SP_AdminLogin
(
    @Username VARCHAR(50)
)
AS
BEGIN

    SELECT
        AdminId,
        Username,
        Password,
        LastLogin

    FROM Admin

    WHERE Username = @Username;

END
*/

/*
CREATE PROCEDURE SP_RegisterUser
(
    @FirstName VARCHAR(50),

    @LastName VARCHAR(50),

    @Address VARCHAR(300),

    @Username VARCHAR(50),

    @DOB DATE,

    @Gender VARCHAR(10),

    @StateId INT,

    @CityId INT,

    @Email VARCHAR(100),

    @Phone VARCHAR(15),

    @Password VARCHAR(100)
)
AS
BEGIN

    INSERT INTO Users
    (
        FirstName,
        LastName,
        Address,
        Username,
        DOB,
        Gender,
        StateId,
        CityId,
        Email,
        Phone,
        Password
    )

    VALUES
    (
        @FirstName,
        @LastName,
        @Address,
        @Username,
        @DOB,
        @Gender,
        @StateId,
        @CityId,
        @Email,
        @Phone,
        @Password
    );

END
*/

/*
ALTER PROCEDURE SP_UserLogin
(
    @Username VARCHAR(50)
)
AS
BEGIN

    SELECT
        UserId,
        FirstName,
        LastName,
        Address,
        Username,
        DOB,
        Gender,
        StateId,
        CityId,
        Email,
        Phone,
        Password,
        CreatedAt,
        LastLogin

    FROM Users

    WHERE Username = @Username;

END
*/

/*
ALTER PROCEDURE SP_UserLogin
(
    @Username VARCHAR(50),

    @Password VARCHAR(100)
)
AS
BEGIN

    UPDATE Users

    SET LastLogin = GETDATE()

    WHERE Username = @Username
    AND Password = @Password;

    SELECT *

    FROM Users

    WHERE Username = @Username
    AND Password = @Password;

END
*/

/*
SELECT * FROM Admin;
*/

/*
SELECT * FROM Users
WHERE Username='james';
*/

/*
USE YatragoDB;
*/

/*
SELECT * FROM Routes;
*/

/*
ALTER TABLE Users
ADD ProfileImage VARCHAR(300) NULL;
*/

/*
CREATE PROCEDURE dbo.SP_GetUserById
(
    @UserId INT
)
AS
BEGIN

    SELECT
        UserId,
        FirstName,
        LastName,
        Address,
        Username,
        DOB,
        Gender,
        StateId,
        CityId,
        Email,
        Phone,
        ProfileImage

    FROM dbo.Users

    WHERE UserId = @UserId;

END
*/

/*
CREATE PROCEDURE dbo.SP_UpdateUserProfile
(
    @UserId INT,

    @FirstName VARCHAR(50),

    @LastName VARCHAR(50),

    @Address VARCHAR(300),

    @DOB DATE,

    @Gender VARCHAR(10),

    @StateId INT,

    @CityId INT,

    @Email VARCHAR(100),

    @Phone VARCHAR(15),

    @ProfileImage VARCHAR(300)
)
AS
BEGIN

    UPDATE dbo.Users

    SET
        FirstName = @FirstName,
        LastName = @LastName,
        Address = @Address,
        DOB = @DOB,
        Gender = @Gender,
        StateId = @StateId,
        CityId = @CityId,
        Email = @Email,
        Phone = @Phone,
        ProfileImage = @ProfileImage

    WHERE UserId = @UserId;

END
*/

/*
SELECT * FROM Admin;
*/

/*
CREATE PROCEDURE dbo.SP_UpdateUserLastLogin
(
    @UserId INT
)
AS
BEGIN

    UPDATE dbo.Users

    SET
        LastLogin = GETDATE()

    WHERE UserId = @UserId;

END
*/

/*
CREATE PROCEDURE dbo.SP_UpdateAdminLastLogin
(
    @AdminId INT
)
AS
BEGIN

    UPDATE dbo.Admin

    SET
        LastLogin = GETDATE()

    WHERE AdminId = @AdminId;

END
*/

/*
CREATE PROCEDURE dbo.SP_GetUsersCount
AS
BEGIN
    SELECT COUNT(*) AS TotalUsers
    FROM dbo.Users;
END
GO

CREATE PROCEDURE dbo.SP_GetBusesCount
AS
BEGIN
    SELECT COUNT(*) AS TotalBuses
    FROM dbo.Buses;
END
GO

CREATE PROCEDURE dbo.SP_GetRoutesCount
AS
BEGIN
    SELECT COUNT(*) AS TotalRoutes
    FROM dbo.Routes;
END
GO

CREATE PROCEDURE dbo.SP_GetBookingsCount
AS
BEGIN
    SELECT COUNT(*) AS TotalBookings
    FROM dbo.Bookings;
END
GO
*/

/*
CREATE PROCEDURE SP_GetUserByUsernameOrEmail
(
    @LoginInput VARCHAR(100)
)
AS
BEGIN

    SELECT
        UserId,
        Username,
        Email

    FROM Users

    WHERE
        Username = @LoginInput
        OR Email = @LoginInput;

END
*/

/*
CREATE PROCEDURE SP_UpdatePassword
(
    @UserId INT,
    @Password VARCHAR(100)
)
AS
BEGIN

    UPDATE Users

    SET Password = @Password

    WHERE UserId = @UserId;

END
*/

/*
SELECT * FROM dbo.Users;
*/

/*
ALTER TABLE dbo.Users
ALTER COLUMN FirstName VARCHAR(5);
*/

/*
CREATE PROCEDURE SP_GetUserByUsername
(
    @Username VARCHAR(100)
)
AS
BEGIN

    SELECT
        UserId,
        Username

    FROM Users

    WHERE Username = @Username;

END
*/

/*
SELECT * FROM dbo.Users;
*/

/*
ALTER TABLE Users
ADD
    ModifiedDate DATETIME NULL,
    ModifiedBy VARCHAR(100) NULL;
*/

/*
ALTER PROCEDURE dbo.SP_UpdateUserProfile
(
    @UserId INT,

    @FirstName VARCHAR(50),

    @LastName VARCHAR(50),

    @Address VARCHAR(300),

    @DOB DATE,

    @Gender VARCHAR(10),

    @StateId INT,

    @CityId INT,

    @Email VARCHAR(100),

    @Phone VARCHAR(15),

    @ProfileImage VARCHAR(300),

    @ModifiedBy VARCHAR(100)
)
AS
BEGIN

    UPDATE dbo.Users

    SET
        FirstName = @FirstName,
        LastName = @LastName,
        Address = @Address,
        DOB = @DOB,
        Gender = @Gender,
        StateId = @StateId,
        CityId = @CityId,
        Email = @Email,
        Phone = @Phone,
        ProfileImage = @ProfileImage,

        ModifiedDate = GETDATE(),

        ModifiedBy = @ModifiedBy

    WHERE UserId = @UserId;

END
*/

/*
CREATE NONCLUSTERED INDEX IX_Users_StateId
ON dbo.Users(StateId);
*/

/*
CREATE NONCLUSTERED INDEX IX_Users_CityId
ON dbo.Users(CityId);
*/

/*
CREATE NONCLUSTERED INDEX IX_Cities_StateId
ON dbo.Cities(StateId);
*/

/*
IF NOT EXISTS
(
    SELECT 1
    FROM dbo.Admin
)
BEGIN

    INSERT INTO dbo.Admin
    (
        Username,
        Password
    )
    VALUES
    (
        'admin',

        '$2a$12$sq2eYWuvmkYpr7YLfVr0N.gYVnQpEm.NMOy9zLidZmxe2/hB.KbKa'
    );

END
*/