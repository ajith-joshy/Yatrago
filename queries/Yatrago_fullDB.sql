SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[LastLogin] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)
) 
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[BookingId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[BusId] [int] NULL,
	[JourneyDate] [date] NOT NULL,
	[SeatNumbers] [varchar](200) NOT NULL,
	[TotalAmount] [decimal](10, 2) NOT NULL,
	[BookingStatus] [varchar](20) NULL,
	[CreatedAt] [datetime] NULL,
	[Email] [varchar](100) NULL,
	[Phone] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingId] ASC
)
) 
GO
/****** Object:  Table [dbo].[Buses]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buses](
	[BusId] [int] IDENTITY(1,1) NOT NULL,
	[BusName] [varchar](100) NOT NULL,
	[BusNumber] [varchar](50) NOT NULL,
	[BusType] [varchar](50) NOT NULL,
	[TotalSeats] [int] NOT NULL,
	[RouteId] [int] NULL,
	[DepartureTime] [time](7) NOT NULL,
	[ArrivalTime] [time](7) NOT NULL,
	[FareAmount] [decimal](10, 2) NOT NULL,
	[Status] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[BusImage] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[BusId] ASC
) 
) 
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](100) NOT NULL,
	[StateId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)
)
GO
/****** Object:  Table [dbo].[PassengerDetails]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PassengerDetails](
	[PassengerId] [int] IDENTITY(1,1) NOT NULL,
	[BookingId] [int] NULL,
	[PassengerName] [varchar](100) NOT NULL,
	[Age] [int] NOT NULL,
	[Gender] [varchar](20) NOT NULL,
	[SeatNumber] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PassengerId] ASC
)
)
GO
/****** Object:  Table [dbo].[Routes]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Routes](
	[RouteId] [int] IDENTITY(1,1) NOT NULL,
	[Source] [varchar](100) NOT NULL,
	[Destination] [varchar](100) NOT NULL,
	[Distance] [decimal](10, 2) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RouteId] ASC
)
)
GO
/****** Object:  Table [dbo].[States]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)
)
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NOT NULL,
	[Address] [varchar](300) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[DOB] [date] NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[StateId] [int] NULL,
	[CityId] [int] NULL,
	[Email] [varchar](100) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[LastLogin] [datetime] NULL,
	[ProfileImage] [varchar](300) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
) 
) 
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([AdminId], [Username], [Password], [LastLogin]) VALUES (3, N'admin', N'AQAAAAIAAYagAAAAEAQ8r4FlEPmE6GhusXw+uFjSNFaJvX3D2E4P3Znu5e3e9DHhZTVz1yY9elt/gPg8tw==', CAST(N'2026-05-25T00:22:15.073' AS DateTime))
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Bookings] ON 

INSERT [dbo].[Bookings] ([BookingId], [UserId], [BusId], [JourneyDate], [SeatNumbers], [TotalAmount], [BookingStatus], [CreatedAt], [Email], [Phone]) VALUES (2, 9, 4, CAST(N'2026-05-21' AS Date), N'25', CAST(400.00 AS Decimal(10, 2)), N'Booked', CAST(N'2026-05-21T12:25:17.050' AS DateTime), NULL, NULL)
INSERT [dbo].[Bookings] ([BookingId], [UserId], [BusId], [JourneyDate], [SeatNumbers], [TotalAmount], [BookingStatus], [CreatedAt], [Email], [Phone]) VALUES (3, 9, 3, CAST(N'2026-05-21' AS Date), N'5', CAST(1000.00 AS Decimal(10, 2)), N'Booked', CAST(N'2026-05-21T12:48:40.083' AS DateTime), NULL, NULL)
INSERT [dbo].[Bookings] ([BookingId], [UserId], [BusId], [JourneyDate], [SeatNumbers], [TotalAmount], [BookingStatus], [CreatedAt], [Email], [Phone]) VALUES (4, 9, 3, CAST(N'2026-05-21' AS Date), N'14', CAST(1000.00 AS Decimal(10, 2)), N'Booked', CAST(N'2026-05-21T16:09:45.763' AS DateTime), NULL, NULL)
INSERT [dbo].[Bookings] ([BookingId], [UserId], [BusId], [JourneyDate], [SeatNumbers], [TotalAmount], [BookingStatus], [CreatedAt], [Email], [Phone]) VALUES (5, 10, 3, CAST(N'2026-05-21' AS Date), N'10', CAST(1000.00 AS Decimal(10, 2)), N'Cancelled', CAST(N'2026-05-21T16:14:44.703' AS DateTime), NULL, NULL)
INSERT [dbo].[Bookings] ([BookingId], [UserId], [BusId], [JourneyDate], [SeatNumbers], [TotalAmount], [BookingStatus], [CreatedAt], [Email], [Phone]) VALUES (6, 10, 4, CAST(N'2026-05-22' AS Date), N'17', CAST(400.00 AS Decimal(10, 2)), N'Cancelled', CAST(N'2026-05-22T10:31:31.320' AS DateTime), NULL, NULL)
INSERT [dbo].[Bookings] ([BookingId], [UserId], [BusId], [JourneyDate], [SeatNumbers], [TotalAmount], [BookingStatus], [CreatedAt], [Email], [Phone]) VALUES (7, 9, 4, CAST(N'2026-05-22' AS Date), N'3', CAST(400.00 AS Decimal(10, 2)), N'Booked', CAST(N'2026-05-22T12:49:33.633' AS DateTime), NULL, NULL)
INSERT [dbo].[Bookings] ([BookingId], [UserId], [BusId], [JourneyDate], [SeatNumbers], [TotalAmount], [BookingStatus], [CreatedAt], [Email], [Phone]) VALUES (8, 9, 4, CAST(N'2026-05-22' AS Date), N'2,5', CAST(800.00 AS Decimal(10, 2)), N'Cancelled', CAST(N'2026-05-22T20:43:19.390' AS DateTime), N'madmj321@gmail.com', N'8281882309')
INSERT [dbo].[Bookings] ([BookingId], [UserId], [BusId], [JourneyDate], [SeatNumbers], [TotalAmount], [BookingStatus], [CreatedAt], [Email], [Phone]) VALUES (9, 9, 3, CAST(N'2026-05-23' AS Date), N'9', CAST(1000.00 AS Decimal(10, 2)), N'Cancelled', CAST(N'2026-05-22T21:09:27.427' AS DateTime), N'madmj321@gmail.com', N'8281882309')
INSERT [dbo].[Bookings] ([BookingId], [UserId], [BusId], [JourneyDate], [SeatNumbers], [TotalAmount], [BookingStatus], [CreatedAt], [Email], [Phone]) VALUES (10, 10, 5, CAST(N'2026-05-24' AS Date), N'11,12', CAST(3000.00 AS Decimal(10, 2)), N'Cancelled', CAST(N'2026-05-22T21:40:00.287' AS DateTime), N'ajith@gmail.com', N'8281882307')
INSERT [dbo].[Bookings] ([BookingId], [UserId], [BusId], [JourneyDate], [SeatNumbers], [TotalAmount], [BookingStatus], [CreatedAt], [Email], [Phone]) VALUES (11, 10, 5, CAST(N'2026-05-25' AS Date), N'15', CAST(1500.00 AS Decimal(10, 2)), N'Cancelled', CAST(N'2026-05-22T22:01:51.000' AS DateTime), N'madhu@gmail.com', N'75315986245')
INSERT [dbo].[Bookings] ([BookingId], [UserId], [BusId], [JourneyDate], [SeatNumbers], [TotalAmount], [BookingStatus], [CreatedAt], [Email], [Phone]) VALUES (12, 10, 5, CAST(N'2026-05-27' AS Date), N'18', CAST(1500.00 AS Decimal(10, 2)), N'Cancelled', CAST(N'2026-05-22T22:03:25.530' AS DateTime), N'nonu@gmail.com', N'75315986247')
INSERT [dbo].[Bookings] ([BookingId], [UserId], [BusId], [JourneyDate], [SeatNumbers], [TotalAmount], [BookingStatus], [CreatedAt], [Email], [Phone]) VALUES (13, 10, 4, CAST(N'2026-05-25' AS Date), N'14,15', CAST(800.00 AS Decimal(10, 2)), N'Cancelled', CAST(N'2026-05-22T22:09:43.970' AS DateTime), N'kaaliya@gmail.com', N'2684795135')
INSERT [dbo].[Bookings] ([BookingId], [UserId], [BusId], [JourneyDate], [SeatNumbers], [TotalAmount], [BookingStatus], [CreatedAt], [Email], [Phone]) VALUES (14, 9, 4, CAST(N'2026-05-25' AS Date), N'17,18', CAST(800.00 AS Decimal(10, 2)), N'Booked', CAST(N'2026-05-24T13:05:46.187' AS DateTime), N'sachin@gmail.com', N'7531592684')
INSERT [dbo].[Bookings] ([BookingId], [UserId], [BusId], [JourneyDate], [SeatNumbers], [TotalAmount], [BookingStatus], [CreatedAt], [Email], [Phone]) VALUES (15, 9, 4, CAST(N'2026-05-25' AS Date), N'5,6', CAST(800.00 AS Decimal(10, 2)), N'Booked', CAST(N'2026-05-24T13:14:15.507' AS DateTime), N'fifa@gmail.com', N'7531598624')
INSERT [dbo].[Bookings] ([BookingId], [UserId], [BusId], [JourneyDate], [SeatNumbers], [TotalAmount], [BookingStatus], [CreatedAt], [Email], [Phone]) VALUES (16, 9, 3, CAST(N'2026-05-25' AS Date), N'5,6', CAST(2000.00 AS Decimal(10, 2)), N'Cancelled', CAST(N'2026-05-25T17:18:38.410' AS DateTime), N'mm@gmail.com', N'7532146980')
INSERT [dbo].[Bookings] ([BookingId], [UserId], [BusId], [JourneyDate], [SeatNumbers], [TotalAmount], [BookingStatus], [CreatedAt], [Email], [Phone]) VALUES (17, 9, 3, CAST(N'2026-05-25' AS Date), N'5,6', CAST(2000.00 AS Decimal(10, 2)), N'Cancelled', CAST(N'2026-05-25T17:23:56.650' AS DateTime), N'mm@gmail.com', N'7531598426')
INSERT [dbo].[Bookings] ([BookingId], [UserId], [BusId], [JourneyDate], [SeatNumbers], [TotalAmount], [BookingStatus], [CreatedAt], [Email], [Phone]) VALUES (18, 13, 3, CAST(N'2026-05-30' AS Date), N'5,6', CAST(2000.00 AS Decimal(10, 2)), N'Cancelled', CAST(N'2026-05-27T15:25:30.373' AS DateTime), N'manav@gmail.com', N'7531598624')
INSERT [dbo].[Bookings] ([BookingId], [UserId], [BusId], [JourneyDate], [SeatNumbers], [TotalAmount], [BookingStatus], [CreatedAt], [Email], [Phone]) VALUES (19, 14, 5, CAST(N'2026-05-30' AS Date), N'23', CAST(1500.00 AS Decimal(10, 2)), N'Booked', CAST(N'2026-05-28T13:57:14.437' AS DateTime), N'aleena@gmail.com', N'7894561230')
INSERT [dbo].[Bookings] ([BookingId], [UserId], [BusId], [JourneyDate], [SeatNumbers], [TotalAmount], [BookingStatus], [CreatedAt], [Email], [Phone]) VALUES (20, 14, 4, CAST(N'2026-05-31' AS Date), N'5', CAST(400.00 AS Decimal(10, 2)), N'Booked', CAST(N'2026-05-28T14:00:15.560' AS DateTime), N'aleena@gmail.com', N'7894561230')
INSERT [dbo].[Bookings] ([BookingId], [UserId], [BusId], [JourneyDate], [SeatNumbers], [TotalAmount], [BookingStatus], [CreatedAt], [Email], [Phone]) VALUES (21, 14, 3, CAST(N'2026-05-31' AS Date), N'5', CAST(1000.00 AS Decimal(10, 2)), N'Booked', CAST(N'2026-05-28T14:14:20.593' AS DateTime), N'aleena@gmail.com', N'7894561230')
INSERT [dbo].[Bookings] ([BookingId], [UserId], [BusId], [JourneyDate], [SeatNumbers], [TotalAmount], [BookingStatus], [CreatedAt], [Email], [Phone]) VALUES (22, 13, 5, CAST(N'2026-05-31' AS Date), N'14', CAST(1500.00 AS Decimal(10, 2)), N'Booked', CAST(N'2026-05-28T14:17:15.177' AS DateTime), N'manav@gmail.com', N'8281882307')
INSERT [dbo].[Bookings] ([BookingId], [UserId], [BusId], [JourneyDate], [SeatNumbers], [TotalAmount], [BookingStatus], [CreatedAt], [Email], [Phone]) VALUES (23, 15, 4, CAST(N'2026-05-30' AS Date), N'11', CAST(400.00 AS Decimal(10, 2)), N'Cancelled', CAST(N'2026-05-29T13:02:56.117' AS DateTime), N'thomas@gmail.com', N'1111122222')
INSERT [dbo].[Bookings] ([BookingId], [UserId], [BusId], [JourneyDate], [SeatNumbers], [TotalAmount], [BookingStatus], [CreatedAt], [Email], [Phone]) VALUES (24, 17, 3, CAST(N'2026-06-06' AS Date), N'20', CAST(1000.00 AS Decimal(10, 2)), N'Cancelled', CAST(N'2026-06-01T22:05:44.853' AS DateTime), N'arnold@gmail.com', N'7894561235')
INSERT [dbo].[Bookings] ([BookingId], [UserId], [BusId], [JourneyDate], [SeatNumbers], [TotalAmount], [BookingStatus], [CreatedAt], [Email], [Phone]) VALUES (25, 17, 5, CAST(N'2026-06-15' AS Date), N'3', CAST(1500.00 AS Decimal(10, 2)), N'Cancelled', CAST(N'2026-06-01T22:16:22.573' AS DateTime), N'arnold@gmail.com', N'7531598624')
INSERT [dbo].[Bookings] ([BookingId], [UserId], [BusId], [JourneyDate], [SeatNumbers], [TotalAmount], [BookingStatus], [CreatedAt], [Email], [Phone]) VALUES (26, 9, 3, CAST(N'2026-06-16' AS Date), N'2', CAST(1000.00 AS Decimal(10, 2)), N'Cancelled', CAST(N'2026-06-01T22:18:30.973' AS DateTime), N'arnold@gmail.com', N'9988990088')
INSERT [dbo].[Bookings] ([BookingId], [UserId], [BusId], [JourneyDate], [SeatNumbers], [TotalAmount], [BookingStatus], [CreatedAt], [Email], [Phone]) VALUES (27, 27, 3, CAST(N'2026-06-15' AS Date), N'11', CAST(1000.00 AS Decimal(10, 2)), N'Booked', CAST(N'2026-06-02T11:54:13.153' AS DateTime), N'mariya@gmail.com', N'7531598426')
INSERT [dbo].[Bookings] ([BookingId], [UserId], [BusId], [JourneyDate], [SeatNumbers], [TotalAmount], [BookingStatus], [CreatedAt], [Email], [Phone]) VALUES (28, 28, 3, CAST(N'2026-06-12' AS Date), N'26', CAST(1000.00 AS Decimal(10, 2)), N'Cancelled', CAST(N'2026-06-10T16:47:58.180' AS DateTime), N'freddy11@gmail.com', N'7897777755')
INSERT [dbo].[Bookings] ([BookingId], [UserId], [BusId], [JourneyDate], [SeatNumbers], [TotalAmount], [BookingStatus], [CreatedAt], [Email], [Phone]) VALUES (29, 28, 3, CAST(N'2026-06-12' AS Date), N'26', CAST(1000.00 AS Decimal(10, 2)), N'Booked', CAST(N'2026-06-10T16:47:58.180' AS DateTime), N'freddy11@gmail.com', N'7897777755')
INSERT [dbo].[Bookings] ([BookingId], [UserId], [BusId], [JourneyDate], [SeatNumbers], [TotalAmount], [BookingStatus], [CreatedAt], [Email], [Phone]) VALUES (30, 9, 3, CAST(N'2026-06-15' AS Date), N'18', CAST(1000.00 AS Decimal(10, 2)), N'Booked', CAST(N'2026-06-11T10:18:39.353' AS DateTime), N'ajith@gmail.com', N'7894561235')
SET IDENTITY_INSERT [dbo].[Bookings] OFF
GO
SET IDENTITY_INSERT [dbo].[Buses] ON 

INSERT [dbo].[Buses] ([BusId], [BusName], [BusNumber], [BusType], [TotalSeats], [RouteId], [DepartureTime], [ArrivalTime], [FareAmount], [Status], [CreatedAt], [BusImage]) VALUES (3, N'Avengers', N'KLJ6455', N'AC Seater', 28, 3, CAST(N'12:00:00' AS Time), CAST(N'01:30:00' AS Time), CAST(1000.00 AS Decimal(10, 2)), 1, CAST(N'2026-05-21T10:19:31.000' AS DateTime), N'/images/bus/d16fe4a3-91f7-4bc0-a33b-b01d6b91002a.jpg')
INSERT [dbo].[Buses] ([BusId], [BusName], [BusNumber], [BusType], [TotalSeats], [RouteId], [DepartureTime], [ArrivalTime], [FareAmount], [Status], [CreatedAt], [BusImage]) VALUES (4, N'royal rich', N'KLJ6458', N'AC Seater', 25, 3, CAST(N'12:30:00' AS Time), CAST(N'02:00:00' AS Time), CAST(400.00 AS Decimal(10, 2)), 1, CAST(N'2026-05-21T10:31:01.027' AS DateTime), N'/images/bus/36318ab4-01a8-44f4-8d51-d83cc3a079cb.jpg')
INSERT [dbo].[Buses] ([BusId], [BusName], [BusNumber], [BusType], [TotalSeats], [RouteId], [DepartureTime], [ArrivalTime], [FareAmount], [Status], [CreatedAt], [BusImage]) VALUES (5, N'Avenger', N'KL88990', N'AC Sleeper', 30, 4, CAST(N'12:00:00' AS Time), CAST(N'06:00:00' AS Time), CAST(1500.00 AS Decimal(10, 2)), 1, CAST(N'2026-05-21T12:54:11.553' AS DateTime), N'/images/bus/d82fa9c0-fef4-4303-bd01-6c2c0704d67c.jpg')
INSERT [dbo].[Buses] ([BusId], [BusName], [BusNumber], [BusType], [TotalSeats], [RouteId], [DepartureTime], [ArrivalTime], [FareAmount], [Status], [CreatedAt], [BusImage]) VALUES (8, N'Komban', N'KLH45612', N'AC Seater', 50, 9, CAST(N'09:00:00' AS Time), CAST(N'09:00:00' AS Time), CAST(1899.00 AS Decimal(10, 2)), 1, CAST(N'2026-06-11T10:20:39.613' AS DateTime), N'/images/bus/216bed7a-cc5e-4ea2-a641-0a15d6098b37.jpg')
SET IDENTITY_INSERT [dbo].[Buses] OFF
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([CityId], [CityName], [StateId]) VALUES (1, N'Kozhikode', 1)
INSERT [dbo].[Cities] ([CityId], [CityName], [StateId]) VALUES (2, N'Kochi', 1)
INSERT [dbo].[Cities] ([CityId], [CityName], [StateId]) VALUES (3, N'Trivandrum', 1)
INSERT [dbo].[Cities] ([CityId], [CityName], [StateId]) VALUES (4, N'Chennai', 2)
INSERT [dbo].[Cities] ([CityId], [CityName], [StateId]) VALUES (5, N'Coimbatore', 2)
INSERT [dbo].[Cities] ([CityId], [CityName], [StateId]) VALUES (6, N'Bangalore', 3)
INSERT [dbo].[Cities] ([CityId], [CityName], [StateId]) VALUES (7, N'Mysore', 3)
INSERT [dbo].[Cities] ([CityId], [CityName], [StateId]) VALUES (8, N'Mumbai', 4)
INSERT [dbo].[Cities] ([CityId], [CityName], [StateId]) VALUES (9, N'Pune', 4)
INSERT [dbo].[Cities] ([CityId], [CityName], [StateId]) VALUES (10, N'Visakhapatnam', 5)
INSERT [dbo].[Cities] ([CityId], [CityName], [StateId]) VALUES (11, N'Vijayawada', 5)
INSERT [dbo].[Cities] ([CityId], [CityName], [StateId]) VALUES (12, N'Guwahati', 6)
INSERT [dbo].[Cities] ([CityId], [CityName], [StateId]) VALUES (13, N'Silchar', 6)
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
SET IDENTITY_INSERT [dbo].[PassengerDetails] ON 

INSERT [dbo].[PassengerDetails] ([PassengerId], [BookingId], [PassengerName], [Age], [Gender], [SeatNumber]) VALUES (1, 13, N'Dolu', 10, N'Male', N'14')
INSERT [dbo].[PassengerDetails] ([PassengerId], [BookingId], [PassengerName], [Age], [Gender], [SeatNumber]) VALUES (2, 13, N'Bholu', 9, N'Female', N'15')
INSERT [dbo].[PassengerDetails] ([PassengerId], [BookingId], [PassengerName], [Age], [Gender], [SeatNumber]) VALUES (3, 14, N'Rohith', 4, N'', N'17')
INSERT [dbo].[PassengerDetails] ([PassengerId], [BookingId], [PassengerName], [Age], [Gender], [SeatNumber]) VALUES (4, 14, N'Virat', 50, N'Male', N'18')
INSERT [dbo].[PassengerDetails] ([PassengerId], [BookingId], [PassengerName], [Age], [Gender], [SeatNumber]) VALUES (5, 15, N'ronaldo', 42, N'Male', N'5')
INSERT [dbo].[PassengerDetails] ([PassengerId], [BookingId], [PassengerName], [Age], [Gender], [SeatNumber]) VALUES (6, 15, N'messi', 39, N'Male', N'6')
INSERT [dbo].[PassengerDetails] ([PassengerId], [BookingId], [PassengerName], [Age], [Gender], [SeatNumber]) VALUES (7, 16, N'manu', 30, N'Male', N'5')
INSERT [dbo].[PassengerDetails] ([PassengerId], [BookingId], [PassengerName], [Age], [Gender], [SeatNumber]) VALUES (8, 16, N'malu', 15, N'Female', N'6')
INSERT [dbo].[PassengerDetails] ([PassengerId], [BookingId], [PassengerName], [Age], [Gender], [SeatNumber]) VALUES (9, 17, N'anu', 20, N'Female', N'5')
INSERT [dbo].[PassengerDetails] ([PassengerId], [BookingId], [PassengerName], [Age], [Gender], [SeatNumber]) VALUES (10, 17, N'manu', 20, N'Male', N'6')
INSERT [dbo].[PassengerDetails] ([PassengerId], [BookingId], [PassengerName], [Age], [Gender], [SeatNumber]) VALUES (11, 18, N'tharun', 20, N'Male', N'5')
INSERT [dbo].[PassengerDetails] ([PassengerId], [BookingId], [PassengerName], [Age], [Gender], [SeatNumber]) VALUES (12, 18, N'Arun', 30, N'Male', N'6')
INSERT [dbo].[PassengerDetails] ([PassengerId], [BookingId], [PassengerName], [Age], [Gender], [SeatNumber]) VALUES (13, 19, N'Aleena', 27, N'Female', N'23')
INSERT [dbo].[PassengerDetails] ([PassengerId], [BookingId], [PassengerName], [Age], [Gender], [SeatNumber]) VALUES (14, 20, N'Aleena', 27, N'Female', N'5')
INSERT [dbo].[PassengerDetails] ([PassengerId], [BookingId], [PassengerName], [Age], [Gender], [SeatNumber]) VALUES (15, 21, N'Aleena', 25, N'Female', N'5')
INSERT [dbo].[PassengerDetails] ([PassengerId], [BookingId], [PassengerName], [Age], [Gender], [SeatNumber]) VALUES (16, 22, N'Manav', 25, N'Male', N'14')
INSERT [dbo].[PassengerDetails] ([PassengerId], [BookingId], [PassengerName], [Age], [Gender], [SeatNumber]) VALUES (17, 23, N'Thomas', 50, N'Male', N'11')
INSERT [dbo].[PassengerDetails] ([PassengerId], [BookingId], [PassengerName], [Age], [Gender], [SeatNumber]) VALUES (18, 24, N'Arnold', 22, N'Male', N'20')
INSERT [dbo].[PassengerDetails] ([PassengerId], [BookingId], [PassengerName], [Age], [Gender], [SeatNumber]) VALUES (19, 25, N'Arnold', 22, N'Male', N'3')
INSERT [dbo].[PassengerDetails] ([PassengerId], [BookingId], [PassengerName], [Age], [Gender], [SeatNumber]) VALUES (20, 26, N'Ajith Joshy', 25, N'Male', N'2')
INSERT [dbo].[PassengerDetails] ([PassengerId], [BookingId], [PassengerName], [Age], [Gender], [SeatNumber]) VALUES (21, 27, N'Mariya', 22, N'Female', N'11')
INSERT [dbo].[PassengerDetails] ([PassengerId], [BookingId], [PassengerName], [Age], [Gender], [SeatNumber]) VALUES (23, 28, N'Freddy', 25, N'Male', N'26')
INSERT [dbo].[PassengerDetails] ([PassengerId], [BookingId], [PassengerName], [Age], [Gender], [SeatNumber]) VALUES (22, 29, N'Freddy', 25, N'Male', N'26')
INSERT [dbo].[PassengerDetails] ([PassengerId], [BookingId], [PassengerName], [Age], [Gender], [SeatNumber]) VALUES (24, 30, N'Ajith Joshy', 23, N'Male', N'18')
SET IDENTITY_INSERT [dbo].[PassengerDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Routes] ON 

INSERT [dbo].[Routes] ([RouteId], [Source], [Destination], [Distance], [CreatedAt]) VALUES (3, N'thrissur', N'palakkad', CAST(120.00 AS Decimal(10, 2)), CAST(N'2026-05-20T12:20:57.637' AS DateTime))
INSERT [dbo].[Routes] ([RouteId], [Source], [Destination], [Distance], [CreatedAt]) VALUES (4, N'Kasargod', N'thiruvananthapuram', CAST(800.00 AS Decimal(10, 2)), CAST(N'2026-05-21T12:53:29.843' AS DateTime))
INSERT [dbo].[Routes] ([RouteId], [Source], [Destination], [Distance], [CreatedAt]) VALUES (5, N'Thrissur', N'Kollam', CAST(250.00 AS Decimal(10, 2)), CAST(N'2026-05-25T14:20:18.500' AS DateTime))
INSERT [dbo].[Routes] ([RouteId], [Source], [Destination], [Distance], [CreatedAt]) VALUES (6, N'kannur', N'Kollam', CAST(720.00 AS Decimal(10, 2)), CAST(N'2026-05-25T14:27:36.407' AS DateTime))
INSERT [dbo].[Routes] ([RouteId], [Source], [Destination], [Distance], [CreatedAt]) VALUES (9, N'Chalakduy', N'Bangalore', CAST(600.00 AS Decimal(10, 2)), CAST(N'2026-06-11T10:19:48.620' AS DateTime))
SET IDENTITY_INSERT [dbo].[Routes] OFF
GO
SET IDENTITY_INSERT [dbo].[States] ON 

INSERT [dbo].[States] ([StateId], [StateName]) VALUES (1, N'Kerala')
INSERT [dbo].[States] ([StateId], [StateName]) VALUES (2, N'Tamil Nadu')
INSERT [dbo].[States] ([StateId], [StateName]) VALUES (3, N'Karnataka')
INSERT [dbo].[States] ([StateId], [StateName]) VALUES (4, N'Maharashtra')
INSERT [dbo].[States] ([StateId], [StateName]) VALUES (5, N'Andhra Pradhesh')
INSERT [dbo].[States] ([StateId], [StateName]) VALUES (6, N'Assam')
SET IDENTITY_INSERT [dbo].[States] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Address], [Username], [DOB], [Gender], [StateId], [CityId], [Email], [Phone], [Password], [CreatedAt], [LastLogin], [ProfileImage], [ModifiedDate], [ModifiedBy]) VALUES (9, N'Ajith M', N'Joshy', N'Mechery House 
Near Vellikulam Road 
Chalakudy P O', N'aji', CAST(N'2003-02-26' AS Date), N'Male', 3, 6, N'ajith12@gmail.com', N'8281882300', N'AQAAAAIAAYagAAAAEG858aIOJGTCSgOV9fmOKxopqRPeUzm48Q17uV6xtGE/72VlN0gY/3OiLATZX1DCjg==', CAST(N'2026-05-20T11:57:01.910' AS DateTime), CAST(N'2026-05-25T00:20:45.903' AS DateTime), N'/images/profile/aeb0ca91-a7f1-4ce4-84b9-66762d026d13.jpg', CAST(N'2026-06-11T14:47:18.490' AS DateTime), N'aji')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Address], [Username], [DOB], [Gender], [StateId], [CityId], [Email], [Phone], [Password], [CreatedAt], [LastLogin], [ProfileImage], [ModifiedDate], [ModifiedBy]) VALUES (10, N'anu', N'joseph', N'puthenchira', N'anu', CAST(N'2000-12-12' AS Date), N'Female', 3, 6, N'anu@gmail.com', N'8281882307', N'AQAAAAIAAYagAAAAEAn1q9SR/n9lQAfmamj5mcL7K5mUqxlKfHGTn0M49lB73WPjo/11TiQPPNLZE7GS4A==', CAST(N'2026-05-21T16:13:44.373' AS DateTime), CAST(N'2026-05-24T15:02:11.230' AS DateTime), N'/images/profile/a8c2922b-ccac-4d2f-8158-9df2cc68dab8.jpg', NULL, NULL)
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Address], [Username], [DOB], [Gender], [StateId], [CityId], [Email], [Phone], [Password], [CreatedAt], [LastLogin], [ProfileImage], [ModifiedDate], [ModifiedBy]) VALUES (13, N'manav', N'shaji', N'manav villa', N'manav', CAST(N'2003-05-20' AS Date), N'Male', 3, 6, N'manav@gmail.com', N'7531598628', N'AQAAAAIAAYagAAAAEDmkN1PZZ8YYq/aDw2DsPQGmGV2stDxxU2Hb1mkDpgbKg13+urAp0t4UU/5mGLc9Eg==', CAST(N'2026-05-27T15:05:11.043' AS DateTime), NULL, N'/images/profile/1194c0ef-22aa-4b08-8761-87e4f5573c85.jpg', CAST(N'2026-05-27T15:55:34.123' AS DateTime), N'manav')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Address], [Username], [DOB], [Gender], [StateId], [CityId], [Email], [Phone], [Password], [CreatedAt], [LastLogin], [ProfileImage], [ModifiedDate], [ModifiedBy]) VALUES (14, N'aleena', N'johnny', N'aleena house', N'aleena', CAST(N'1999-02-25' AS Date), N'Female', 3, 7, N'aleena@gmail.com', N'7894561238', N'AQAAAAIAAYagAAAAEObwRPy2kyDkXTs9rfrDcm6fSlcN4UbB7/PNRA5rhdWojzT6kooK2yjDTN7COUkFHg==', CAST(N'2026-05-28T13:55:29.680' AS DateTime), NULL, N'/images/profile/ada559d0-3b61-47db-b557-81a211a36855.jpg', CAST(N'2026-05-28T14:51:35.933' AS DateTime), N'aleena')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Address], [Username], [DOB], [Gender], [StateId], [CityId], [Email], [Phone], [Password], [CreatedAt], [LastLogin], [ProfileImage], [ModifiedDate], [ModifiedBy]) VALUES (15, N'thomas', N'jose', N'thomas house', N'thomas', CAST(N'2003-10-20' AS Date), N'Male', 2, 5, N'thomas@gmail.com', N'1111122222', N'AQAAAAIAAYagAAAAEG+/7fOHFO9zpWiZ7bunzJpyo517cx+5wYC261R/y2PesCQTHwAc9RsBXmA7Q5pqOA==', CAST(N'2026-05-29T13:01:25.887' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Address], [Username], [DOB], [Gender], [StateId], [CityId], [Email], [Phone], [Password], [CreatedAt], [LastLogin], [ProfileImage], [ModifiedDate], [ModifiedBy]) VALUES (17, N'arnold', N's', N'white house', N'arnold', CAST(N'2000-02-25' AS Date), N'Male', 6, 13, N'arnold@gmail.com', N'7894561237', N'AQAAAAIAAYagAAAAEMh4+Pg/ws3IJNlM7WzLVZhzjXuTEkLPOTzoHW6Hn2iXhWBvHnIOX3+VAEFsVlmQZA==', CAST(N'2026-06-01T22:04:26.073' AS DateTime), NULL, N'/images/profile/6fe43518-65bd-4503-b172-e1a909080146.jpg', CAST(N'2026-06-01T22:10:07.350' AS DateTime), N'arnold')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Address], [Username], [DOB], [Gender], [StateId], [CityId], [Email], [Phone], [Password], [CreatedAt], [LastLogin], [ProfileImage], [ModifiedDate], [ModifiedBy]) VALUES (26, N'Anna', N'thomas', N'Anna home', N'mathew', CAST(N'2000-05-15' AS Date), N'Female', 2, 4, N'anna@gmail.com', N'8281882309', N'AQAAAAIAAYagAAAAEO0/AGyz9S+n6VMS7u11zUE8Qg/UJ3wknTjedDxrIXra7KLcYO+G4t3QNAPZvqKU8Q==', CAST(N'2026-06-02T11:37:21.143' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Address], [Username], [DOB], [Gender], [StateId], [CityId], [Email], [Phone], [Password], [CreatedAt], [LastLogin], [ProfileImage], [ModifiedDate], [ModifiedBy]) VALUES (27, N'mariya', N'thomas', N'mariya home', N'mariya', CAST(N'2004-06-14' AS Date), N'Female', 5, 11, N'mariya@gmail.com', N'7531598426', N'AQAAAAIAAYagAAAAEKBngGiU21CCAMEWL/08tGpYMx61qB3oK4CONulV+/t/ZqVGLzHhvzKZkH63lkPe6A==', CAST(N'2026-06-02T11:52:47.160' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Address], [Username], [DOB], [Gender], [StateId], [CityId], [Email], [Phone], [Password], [CreatedAt], [LastLogin], [ProfileImage], [ModifiedDate], [ModifiedBy]) VALUES (28, N'freddy', N'varghese', N'freddy home', N'freddy', CAST(N'1999-10-14' AS Date), N'Male', 2, 5, N'freddy11@gmail.com', N'7531598421', N'AQAAAAIAAYagAAAAEGMT+3YyccUhVeXmcJQAAHzVfQZEZ6h7PsWfrVBWErq5ApgRhPAOh/VYWUUgL922UA==', CAST(N'2026-06-10T15:21:03.147' AS DateTime), NULL, N'/images/profile/e406e37a-6523-4a97-8213-772fbb67827e.jpg', CAST(N'2026-06-10T16:46:53.640' AS DateTime), N'freddy')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Admin__536C85E49BE224DC]    Script Date: 17-06-2026 12:56:16 ******/
ALTER TABLE [dbo].[Admin] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Bookings_BookingStatus]    Script Date: 17-06-2026 12:56:16 ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_BookingStatus] ON [dbo].[Bookings]
(
	[BookingStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [IX_Bookings_Bus_Journey]    Script Date: 17-06-2026 12:56:16 ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_Bus_Journey] ON [dbo].[Bookings]
(
	[BusId] ASC,
	[JourneyDate] DESC
)
INCLUDE([UserId],[BookingId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Bookings_Bus_Journey_Status]    Script Date: 17-06-2026 12:56:16 ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_Bus_Journey_Status] ON [dbo].[Bookings]
(
	[BusId] ASC,
	[JourneyDate] ASC,
	[BookingStatus] ASC
)
INCLUDE([SeatNumbers]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [IX_Bookings_Journey_Created]    Script Date: 17-06-2026 12:56:16 ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_Journey_Created] ON [dbo].[Bookings]
(
	[JourneyDate] ASC,
	[CreatedAt] DESC
)
INCLUDE([UserId],[BusId],[SeatNumbers],[TotalAmount],[BookingStatus]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
/****** Object:  Index [IX_Bookings_User_Created]    Script Date: 17-06-2026 12:56:16 ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_User_Created] ON [dbo].[Bookings]
(
	[UserId] ASC,
	[CreatedAt] DESC
)
INCLUDE([BusId],[JourneyDate],[SeatNumbers],[TotalAmount],[BookingStatus]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Buses__41D29185F687BEF7]    Script Date: 17-06-2026 12:56:16 ******/
ALTER TABLE [dbo].[Buses] ADD UNIQUE NONCLUSTERED 
(
	[BusNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [IX_Buses_RouteId_Status]    Script Date: 17-06-2026 12:56:16 ******/
CREATE NONCLUSTERED INDEX [IX_Buses_RouteId_Status] ON [dbo].[Buses]
(
	[RouteId] ASC,
	[Status] ASC
)
INCLUDE([BusName],[BusNumber],[BusType],[TotalSeats],[DepartureTime],[ArrivalTime],[FareAmount],[BusImage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [IX_Cities_StateId]    Script Date: 17-06-2026 12:56:16 ******/
CREATE NONCLUSTERED INDEX [IX_Cities_StateId] ON [dbo].[Cities]
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [IX_PassengerDetails_Booking_Covering]    Script Date: 17-06-2026 12:56:16 ******/
CREATE NONCLUSTERED INDEX [IX_PassengerDetails_Booking_Covering] ON [dbo].[PassengerDetails]
(
	[BookingId] ASC
)
INCLUDE([PassengerName],[Age],[Gender],[SeatNumber]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Routes_Source_Destination]    Script Date: 17-06-2026 12:56:16 ******/
CREATE NONCLUSTERED INDEX [IX_Routes_Source_Destination] ON [dbo].[Routes]
(
	[Source] ASC,
	[Destination] ASC
)
INCLUDE([RouteId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Email]    Script Date: 17-06-2026 12:56:16 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Phone]    Script Date: 17-06-2026 12:56:16 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ_Phone] UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Username]    Script Date: 17-06-2026 12:56:16 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ_Username] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
/****** Object:  Index [IX_Users_CityId]    Script Date: 17-06-2026 12:56:16 ******/
CREATE NONCLUSTERED INDEX [IX_Users_CityId] ON [dbo].[Users]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
/****** Object:  Index [IX_Users_CreatedAt]    Script Date: 17-06-2026 12:56:16 ******/
CREATE NONCLUSTERED INDEX [IX_Users_CreatedAt] ON [dbo].[Users]
(
	[CreatedAt] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
/****** Object:  Index [IX_Users_StateId]    Script Date: 17-06-2026 12:56:16 ******/
CREATE NONCLUSTERED INDEX [IX_Users_StateId] ON [dbo].[Users]
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT ('Booked') FOR [BookingStatus]
GO
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Buses] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Buses] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Routes] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([BusId])
REFERENCES [dbo].[Buses] ([BusId])
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Buses]  WITH CHECK ADD FOREIGN KEY([RouteId])
REFERENCES [dbo].[Routes] ([RouteId])
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD FOREIGN KEY([StateId])
REFERENCES [dbo].[States] ([StateId])
GO
ALTER TABLE [dbo].[PassengerDetails]  WITH CHECK ADD FOREIGN KEY([BookingId])
REFERENCES [dbo].[Bookings] ([BookingId])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([CityId])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([StateId])
REFERENCES [dbo].[States] ([StateId])
GO
/****** Object:  StoredProcedure [dbo].[SP_AddBus]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_AddBus]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_AddRoute]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_AddRoute]
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


GO
/****** Object:  StoredProcedure [dbo].[SP_AdminLogin]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AdminLogin]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_BookSeats]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_BookSeats]
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

/*
SELECT * FROM Bookings;
*/
GO
/****** Object:  StoredProcedure [dbo].[SP_BusWiseReport]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_BusWiseReport]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_CancelBooking]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_CancelBooking]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_CheckRouteUsage]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_CheckRouteUsage]
(
    @RouteId INT
)
AS
BEGIN

    SELECT COUNT(*) AS BusCount

    FROM dbo.Buses

    WHERE RouteId = @RouteId;

END
GO
/****** Object:  StoredProcedure [dbo].[SP_DateWiseReport]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_DateWiseReport]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteBus]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_DeleteBus]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteRoute]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_DeleteRoute]
(
    @RouteId INT
)
AS
BEGIN

    DELETE FROM Routes

    WHERE RouteId = @RouteId;

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAllBookings]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetAllBookings]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAvailableSeats]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetAvailableSeats]
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
/****** Object:  StoredProcedure [dbo].[SP_GetBookedSeats]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetBookedSeats]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_GetBookingsByUserId]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetBookingsByUserId]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_GetBookingsCount]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetBookingsCount]
AS
BEGIN
    SELECT COUNT(*) AS TotalBookings
    FROM dbo.Bookings;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetBusById]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetBusById]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_GetBuses]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetBuses]
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

        R.Source,
        R.Destination

    FROM Buses B

    INNER JOIN Routes R
    ON B.RouteId = R.RouteId;

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetBusesCount]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetBusesCount]
AS
BEGIN
    SELECT COUNT(*) AS TotalBuses
    FROM dbo.Buses;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetCitiesByStateId]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetCitiesByStateId]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_GetLiveBuses]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_GetLiveBuses]
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
/****** Object:  StoredProcedure [dbo].[SP_GetPassengersByBookingId]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetPassengersByBookingId]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_GetRevenueReport]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetRevenueReport]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_GetRouteById]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetRouteById]
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

GO
/****** Object:  StoredProcedure [dbo].[SP_GetRoutes]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetRoutes]
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

GO
/****** Object:  StoredProcedure [dbo].[SP_GetRoutesCount]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetRoutesCount]
AS
BEGIN
    SELECT COUNT(*) AS TotalRoutes
    FROM dbo.Routes;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetStates]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetStates]
AS
BEGIN

    SELECT
        StateId,
        StateName

    FROM States;

END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetTicketDetails]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetTicketDetails]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_GetUpcomingBookingCount]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetUpcomingBookingCount]
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


GO
/****** Object:  StoredProcedure [dbo].[SP_GetUserById]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetUserById]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_GetUserByUsername]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetUserByUsername]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_GetUsers]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetUsers]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_GetUsersCount]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetUsersCount]
AS
BEGIN
    SELECT COUNT(*) AS TotalUsers
    FROM dbo.Users;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RegisterUser]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_RegisterUser]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_SearchBuses]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_SearchBuses]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateAdminLastLogin]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_UpdateAdminLastLogin]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateBus]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_UpdateBus]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdatePassword]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_UpdatePassword]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateRoute]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_UpdateRoute]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateUserLastLogin]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_UpdateUserLastLogin]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateUserProfile]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_UpdateUserProfile]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_UserLogin]    Script Date: 17-06-2026 12:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_UserLogin]
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

GO
USE [master]
GO
ALTER DATABASE [YatragoDB] SET  READ_WRITE 
GO
