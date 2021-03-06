USE [master]
GO
/****** Object:  Database [TicketingDB]    Script Date: 2/18/2020 10:13:23 PM ******/
CREATE DATABASE [TicketingDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TicketingDB', FILENAME = N'D:\rdsdbdata\DATA\TicketingDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'TicketingDB_log', FILENAME = N'D:\rdsdbdata\DATA\TicketingDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TicketingDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TicketingDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TicketingDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TicketingDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TicketingDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TicketingDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TicketingDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TicketingDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TicketingDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TicketingDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TicketingDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TicketingDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TicketingDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TicketingDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TicketingDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TicketingDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TicketingDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TicketingDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TicketingDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TicketingDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TicketingDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TicketingDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TicketingDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TicketingDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TicketingDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TicketingDB] SET  MULTI_USER 
GO
ALTER DATABASE [TicketingDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TicketingDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TicketingDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TicketingDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TicketingDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TicketingDB] SET QUERY_STORE = OFF
GO
USE [TicketingDB]
GO
/****** Object:  User [APIUser]    Script Date: 2/18/2020 10:13:23 PM ******/
CREATE USER [APIUser] FOR LOGIN [APIUser] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [admin]    Script Date: 2/18/2020 10:13:23 PM ******/
CREATE USER [admin] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [API]    Script Date: 2/18/2020 10:13:23 PM ******/
CREATE ROLE [API]
GO
ALTER ROLE [API] ADD MEMBER [APIUser]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2/18/2020 10:13:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 2/18/2020 10:13:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[EventId] [int] IDENTITY(1,1) NOT NULL,
	[EventName] [nvarchar](max) NOT NULL,
	[EventDateTime] [datetime2](7) NOT NULL,
	[VenueId] [int] NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventSeat]    Script Date: 2/18/2020 10:13:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventSeat](
	[EventSeatId] [int] IDENTITY(1,1) NOT NULL,
	[EventSeatPrice] [decimal](18, 2) NOT NULL,
	[EventId] [int] NOT NULL,
	[SeatId] [int] NOT NULL,
	[TicketPurchaseId] [int] NULL,
 CONSTRAINT [PK_EventSeat] PRIMARY KEY CLUSTERED 
(
	[EventSeatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Row]    Script Date: 2/18/2020 10:13:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Row](
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[RowName] [nvarchar](max) NOT NULL,
	[SectionId] [int] NOT NULL,
 CONSTRAINT [PK_Row] PRIMARY KEY CLUSTERED 
(
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seat]    Script Date: 2/18/2020 10:13:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seat](
	[SeatId] [int] IDENTITY(1,1) NOT NULL,
	[SeatName] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[RowId] [int] NOT NULL,
 CONSTRAINT [PK_Seat] PRIMARY KEY CLUSTERED 
(
	[SeatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Section]    Script Date: 2/18/2020 10:13:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Section](
	[SectionId] [int] IDENTITY(1,1) NOT NULL,
	[SectionName] [nvarchar](max) NOT NULL,
	[VenueId] [int] NOT NULL,
 CONSTRAINT [PK_Section] PRIMARY KEY CLUSTERED 
(
	[SectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketPurchase]    Script Date: 2/18/2020 10:13:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketPurchase](
	[TicketPurchaseId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentMethod] [nvarchar](max) NOT NULL,
	[PaymentAmount] [decimal](18, 2) NOT NULL,
	[ConfirmationCode] [nvarchar](max) NULL,
 CONSTRAINT [PK_TicketPurchase] PRIMARY KEY CLUSTERED 
(
	[TicketPurchaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venue]    Script Date: 2/18/2020 10:13:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venue](
	[VenueId] [int] IDENTITY(1,1) NOT NULL,
	[VenueName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Venue] PRIMARY KEY CLUSTERED 
(
	[VenueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200219010912_InitialCreate', N'2.2.6-servicing-10079')
SET IDENTITY_INSERT [dbo].[Event] ON 

INSERT [dbo].[Event] ([EventId], [EventName], [EventDateTime], [VenueId]) VALUES (1, N'Catz', CAST(N'2020-05-20T18:30:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Event] ([EventId], [EventName], [EventDateTime], [VenueId]) VALUES (2, N'Dogz', CAST(N'2020-05-27T18:30:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Event] ([EventId], [EventName], [EventDateTime], [VenueId]) VALUES (3, N'Cirque Du Soleil', CAST(N'2020-08-01T19:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Event] ([EventId], [EventName], [EventDateTime], [VenueId]) VALUES (4, N'Celine Dion', CAST(N'2020-09-20T18:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Event] ([EventId], [EventName], [EventDateTime], [VenueId]) VALUES (5, N'Canucks vs Ducks', CAST(N'2020-10-20T19:30:00.0000000' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Event] OFF
SET IDENTITY_INSERT [dbo].[EventSeat] ON 

INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (1, CAST(20.00 AS Decimal(18, 2)), 1, 1, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (2, CAST(20.00 AS Decimal(18, 2)), 1, 2, 2)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (3, CAST(20.00 AS Decimal(18, 2)), 1, 3, 2)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (4, CAST(20.00 AS Decimal(18, 2)), 1, 4, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (5, CAST(20.00 AS Decimal(18, 2)), 1, 5, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (6, CAST(20.00 AS Decimal(18, 2)), 1, 6, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (7, CAST(20.00 AS Decimal(18, 2)), 1, 7, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (8, CAST(20.00 AS Decimal(18, 2)), 1, 8, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (9, CAST(20.00 AS Decimal(18, 2)), 1, 9, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (10, CAST(20.00 AS Decimal(18, 2)), 1, 10, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (11, CAST(20.00 AS Decimal(18, 2)), 1, 11, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (12, CAST(20.00 AS Decimal(18, 2)), 1, 12, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (13, CAST(20.00 AS Decimal(18, 2)), 1, 13, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (14, CAST(20.00 AS Decimal(18, 2)), 1, 14, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (15, CAST(20.00 AS Decimal(18, 2)), 1, 15, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (16, CAST(20.00 AS Decimal(18, 2)), 1, 16, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (17, CAST(20.00 AS Decimal(18, 2)), 1, 17, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (18, CAST(20.00 AS Decimal(18, 2)), 1, 18, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (19, CAST(20.00 AS Decimal(18, 2)), 1, 19, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (20, CAST(20.00 AS Decimal(18, 2)), 1, 20, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (21, CAST(20.00 AS Decimal(18, 2)), 1, 21, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (22, CAST(20.00 AS Decimal(18, 2)), 1, 22, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (23, CAST(20.00 AS Decimal(18, 2)), 1, 23, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (24, CAST(20.00 AS Decimal(18, 2)), 1, 24, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (25, CAST(20.00 AS Decimal(18, 2)), 1, 25, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (26, CAST(20.00 AS Decimal(18, 2)), 1, 26, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (27, CAST(20.00 AS Decimal(18, 2)), 1, 27, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (28, CAST(20.00 AS Decimal(18, 2)), 1, 28, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (29, CAST(20.00 AS Decimal(18, 2)), 1, 29, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (30, CAST(20.00 AS Decimal(18, 2)), 1, 30, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (31, CAST(20.00 AS Decimal(18, 2)), 1, 31, 1)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (32, CAST(20.00 AS Decimal(18, 2)), 1, 32, 1)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (33, CAST(20.00 AS Decimal(18, 2)), 1, 33, 1)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (34, CAST(20.00 AS Decimal(18, 2)), 1, 34, 1)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (35, CAST(20.00 AS Decimal(18, 2)), 1, 35, 1)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (36, CAST(25.00 AS Decimal(18, 2)), 1, 36, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (37, CAST(25.00 AS Decimal(18, 2)), 1, 37, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (38, CAST(25.00 AS Decimal(18, 2)), 1, 38, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (39, CAST(25.00 AS Decimal(18, 2)), 1, 39, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (40, CAST(25.00 AS Decimal(18, 2)), 1, 40, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (41, CAST(25.00 AS Decimal(18, 2)), 1, 41, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (42, CAST(25.00 AS Decimal(18, 2)), 1, 42, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (43, CAST(25.00 AS Decimal(18, 2)), 1, 43, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (44, CAST(25.00 AS Decimal(18, 2)), 1, 44, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (45, CAST(25.00 AS Decimal(18, 2)), 1, 45, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (46, CAST(25.00 AS Decimal(18, 2)), 1, 46, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (47, CAST(25.00 AS Decimal(18, 2)), 1, 47, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (48, CAST(25.00 AS Decimal(18, 2)), 1, 48, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (49, CAST(25.00 AS Decimal(18, 2)), 1, 49, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (50, CAST(25.00 AS Decimal(18, 2)), 1, 50, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (51, CAST(25.00 AS Decimal(18, 2)), 1, 51, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (52, CAST(25.00 AS Decimal(18, 2)), 1, 52, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (53, CAST(25.00 AS Decimal(18, 2)), 1, 53, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (54, CAST(25.00 AS Decimal(18, 2)), 1, 54, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (55, CAST(25.00 AS Decimal(18, 2)), 1, 55, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (56, CAST(25.00 AS Decimal(18, 2)), 1, 56, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (57, CAST(25.00 AS Decimal(18, 2)), 1, 57, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (58, CAST(25.00 AS Decimal(18, 2)), 1, 58, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (59, CAST(25.00 AS Decimal(18, 2)), 1, 59, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (60, CAST(25.00 AS Decimal(18, 2)), 1, 60, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (61, CAST(25.00 AS Decimal(18, 2)), 1, 61, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (62, CAST(25.00 AS Decimal(18, 2)), 1, 62, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (63, CAST(25.00 AS Decimal(18, 2)), 1, 63, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (64, CAST(25.00 AS Decimal(18, 2)), 1, 64, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (65, CAST(25.00 AS Decimal(18, 2)), 1, 65, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (66, CAST(25.00 AS Decimal(18, 2)), 1, 66, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (67, CAST(25.00 AS Decimal(18, 2)), 1, 67, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (68, CAST(25.00 AS Decimal(18, 2)), 1, 68, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (69, CAST(25.00 AS Decimal(18, 2)), 1, 69, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (70, CAST(25.00 AS Decimal(18, 2)), 1, 70, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (71, CAST(30.00 AS Decimal(18, 2)), 1, 71, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (72, CAST(30.00 AS Decimal(18, 2)), 1, 72, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (73, CAST(30.00 AS Decimal(18, 2)), 1, 73, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (74, CAST(30.00 AS Decimal(18, 2)), 1, 74, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (75, CAST(30.00 AS Decimal(18, 2)), 1, 75, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (76, CAST(30.00 AS Decimal(18, 2)), 1, 76, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (77, CAST(30.00 AS Decimal(18, 2)), 1, 77, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (78, CAST(30.00 AS Decimal(18, 2)), 1, 78, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (79, CAST(30.00 AS Decimal(18, 2)), 1, 79, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (80, CAST(30.00 AS Decimal(18, 2)), 1, 80, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (81, CAST(30.00 AS Decimal(18, 2)), 1, 81, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (82, CAST(30.00 AS Decimal(18, 2)), 1, 82, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (83, CAST(30.00 AS Decimal(18, 2)), 1, 83, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (84, CAST(30.00 AS Decimal(18, 2)), 1, 84, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (85, CAST(30.00 AS Decimal(18, 2)), 1, 85, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (86, CAST(30.00 AS Decimal(18, 2)), 1, 86, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (87, CAST(30.00 AS Decimal(18, 2)), 1, 87, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (88, CAST(30.00 AS Decimal(18, 2)), 1, 88, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (89, CAST(30.00 AS Decimal(18, 2)), 1, 89, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (90, CAST(30.00 AS Decimal(18, 2)), 1, 90, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (91, CAST(30.00 AS Decimal(18, 2)), 1, 91, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (92, CAST(30.00 AS Decimal(18, 2)), 1, 92, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (93, CAST(30.00 AS Decimal(18, 2)), 1, 93, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (94, CAST(30.00 AS Decimal(18, 2)), 1, 94, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (95, CAST(30.00 AS Decimal(18, 2)), 1, 95, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (96, CAST(30.00 AS Decimal(18, 2)), 1, 96, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (97, CAST(30.00 AS Decimal(18, 2)), 1, 97, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (98, CAST(30.00 AS Decimal(18, 2)), 1, 98, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (99, CAST(30.00 AS Decimal(18, 2)), 1, 99, NULL)
GO
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (100, CAST(30.00 AS Decimal(18, 2)), 1, 100, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (101, CAST(30.00 AS Decimal(18, 2)), 1, 101, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (102, CAST(30.00 AS Decimal(18, 2)), 1, 102, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (103, CAST(30.00 AS Decimal(18, 2)), 1, 103, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (104, CAST(30.00 AS Decimal(18, 2)), 1, 104, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (105, CAST(30.00 AS Decimal(18, 2)), 1, 105, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (106, CAST(35.00 AS Decimal(18, 2)), 1, 106, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (107, CAST(35.00 AS Decimal(18, 2)), 1, 107, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (108, CAST(35.00 AS Decimal(18, 2)), 1, 108, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (109, CAST(35.00 AS Decimal(18, 2)), 1, 109, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (110, CAST(35.00 AS Decimal(18, 2)), 1, 110, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (111, CAST(35.00 AS Decimal(18, 2)), 1, 111, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (112, CAST(35.00 AS Decimal(18, 2)), 1, 112, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (113, CAST(35.00 AS Decimal(18, 2)), 1, 113, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (114, CAST(35.00 AS Decimal(18, 2)), 1, 114, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (115, CAST(35.00 AS Decimal(18, 2)), 1, 115, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (116, CAST(35.00 AS Decimal(18, 2)), 1, 116, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (117, CAST(35.00 AS Decimal(18, 2)), 1, 117, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (118, CAST(35.00 AS Decimal(18, 2)), 1, 118, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (119, CAST(35.00 AS Decimal(18, 2)), 1, 119, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (120, CAST(35.00 AS Decimal(18, 2)), 1, 120, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (121, CAST(35.00 AS Decimal(18, 2)), 1, 121, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (122, CAST(35.00 AS Decimal(18, 2)), 1, 122, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (123, CAST(35.00 AS Decimal(18, 2)), 1, 123, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (124, CAST(35.00 AS Decimal(18, 2)), 1, 124, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (125, CAST(35.00 AS Decimal(18, 2)), 1, 125, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (126, CAST(35.00 AS Decimal(18, 2)), 1, 126, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (127, CAST(35.00 AS Decimal(18, 2)), 1, 127, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (128, CAST(35.00 AS Decimal(18, 2)), 1, 128, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (129, CAST(35.00 AS Decimal(18, 2)), 1, 129, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (130, CAST(35.00 AS Decimal(18, 2)), 1, 130, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (131, CAST(35.00 AS Decimal(18, 2)), 1, 131, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (132, CAST(35.00 AS Decimal(18, 2)), 1, 132, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (133, CAST(35.00 AS Decimal(18, 2)), 1, 133, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (134, CAST(35.00 AS Decimal(18, 2)), 1, 134, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (135, CAST(35.00 AS Decimal(18, 2)), 1, 135, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (136, CAST(35.00 AS Decimal(18, 2)), 1, 136, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (137, CAST(35.00 AS Decimal(18, 2)), 1, 137, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (138, CAST(35.00 AS Decimal(18, 2)), 1, 138, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (139, CAST(35.00 AS Decimal(18, 2)), 1, 139, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (140, CAST(35.00 AS Decimal(18, 2)), 1, 140, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (141, CAST(40.00 AS Decimal(18, 2)), 1, 141, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (142, CAST(40.00 AS Decimal(18, 2)), 1, 142, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (143, CAST(40.00 AS Decimal(18, 2)), 1, 143, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (144, CAST(40.00 AS Decimal(18, 2)), 1, 144, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (145, CAST(40.00 AS Decimal(18, 2)), 1, 145, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (146, CAST(40.00 AS Decimal(18, 2)), 1, 146, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (147, CAST(40.00 AS Decimal(18, 2)), 1, 147, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (148, CAST(40.00 AS Decimal(18, 2)), 1, 148, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (149, CAST(40.00 AS Decimal(18, 2)), 1, 149, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (150, CAST(40.00 AS Decimal(18, 2)), 1, 150, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (151, CAST(40.00 AS Decimal(18, 2)), 1, 151, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (152, CAST(40.00 AS Decimal(18, 2)), 1, 152, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (153, CAST(40.00 AS Decimal(18, 2)), 1, 153, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (154, CAST(40.00 AS Decimal(18, 2)), 1, 154, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (155, CAST(40.00 AS Decimal(18, 2)), 1, 155, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (156, CAST(40.00 AS Decimal(18, 2)), 1, 156, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (157, CAST(40.00 AS Decimal(18, 2)), 1, 157, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (158, CAST(40.00 AS Decimal(18, 2)), 1, 158, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (159, CAST(40.00 AS Decimal(18, 2)), 1, 159, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (160, CAST(40.00 AS Decimal(18, 2)), 1, 160, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (161, CAST(40.00 AS Decimal(18, 2)), 1, 161, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (162, CAST(40.00 AS Decimal(18, 2)), 1, 162, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (163, CAST(40.00 AS Decimal(18, 2)), 1, 163, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (164, CAST(40.00 AS Decimal(18, 2)), 1, 164, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (165, CAST(40.00 AS Decimal(18, 2)), 1, 165, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (166, CAST(40.00 AS Decimal(18, 2)), 1, 166, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (167, CAST(40.00 AS Decimal(18, 2)), 1, 167, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (168, CAST(40.00 AS Decimal(18, 2)), 1, 168, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (169, CAST(40.00 AS Decimal(18, 2)), 1, 169, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (170, CAST(40.00 AS Decimal(18, 2)), 1, 170, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (171, CAST(40.00 AS Decimal(18, 2)), 1, 171, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (172, CAST(40.00 AS Decimal(18, 2)), 1, 172, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (173, CAST(40.00 AS Decimal(18, 2)), 1, 173, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (174, CAST(40.00 AS Decimal(18, 2)), 1, 174, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (175, CAST(40.00 AS Decimal(18, 2)), 1, 175, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (176, CAST(20.00 AS Decimal(18, 2)), 2, 1, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (177, CAST(20.00 AS Decimal(18, 2)), 2, 2, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (178, CAST(20.00 AS Decimal(18, 2)), 2, 3, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (179, CAST(20.00 AS Decimal(18, 2)), 2, 4, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (180, CAST(20.00 AS Decimal(18, 2)), 2, 5, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (181, CAST(20.00 AS Decimal(18, 2)), 2, 6, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (182, CAST(20.00 AS Decimal(18, 2)), 2, 7, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (183, CAST(20.00 AS Decimal(18, 2)), 2, 8, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (184, CAST(20.00 AS Decimal(18, 2)), 2, 9, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (185, CAST(20.00 AS Decimal(18, 2)), 2, 10, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (186, CAST(20.00 AS Decimal(18, 2)), 2, 11, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (187, CAST(20.00 AS Decimal(18, 2)), 2, 12, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (188, CAST(20.00 AS Decimal(18, 2)), 2, 13, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (189, CAST(20.00 AS Decimal(18, 2)), 2, 14, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (190, CAST(20.00 AS Decimal(18, 2)), 2, 15, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (191, CAST(20.00 AS Decimal(18, 2)), 2, 16, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (192, CAST(20.00 AS Decimal(18, 2)), 2, 17, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (193, CAST(20.00 AS Decimal(18, 2)), 2, 18, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (194, CAST(20.00 AS Decimal(18, 2)), 2, 19, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (195, CAST(20.00 AS Decimal(18, 2)), 2, 20, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (196, CAST(20.00 AS Decimal(18, 2)), 2, 21, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (197, CAST(20.00 AS Decimal(18, 2)), 2, 22, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (198, CAST(20.00 AS Decimal(18, 2)), 2, 23, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (199, CAST(20.00 AS Decimal(18, 2)), 2, 24, NULL)
GO
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (200, CAST(20.00 AS Decimal(18, 2)), 2, 25, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (201, CAST(20.00 AS Decimal(18, 2)), 2, 26, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (202, CAST(20.00 AS Decimal(18, 2)), 2, 27, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (203, CAST(20.00 AS Decimal(18, 2)), 2, 28, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (204, CAST(20.00 AS Decimal(18, 2)), 2, 29, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (205, CAST(20.00 AS Decimal(18, 2)), 2, 30, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (206, CAST(20.00 AS Decimal(18, 2)), 2, 31, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (207, CAST(20.00 AS Decimal(18, 2)), 2, 32, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (208, CAST(20.00 AS Decimal(18, 2)), 2, 33, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (209, CAST(20.00 AS Decimal(18, 2)), 2, 34, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (210, CAST(20.00 AS Decimal(18, 2)), 2, 35, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (211, CAST(30.00 AS Decimal(18, 2)), 2, 36, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (212, CAST(30.00 AS Decimal(18, 2)), 2, 37, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (213, CAST(30.00 AS Decimal(18, 2)), 2, 38, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (214, CAST(30.00 AS Decimal(18, 2)), 2, 39, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (215, CAST(30.00 AS Decimal(18, 2)), 2, 40, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (216, CAST(30.00 AS Decimal(18, 2)), 2, 41, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (217, CAST(30.00 AS Decimal(18, 2)), 2, 42, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (218, CAST(30.00 AS Decimal(18, 2)), 2, 43, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (219, CAST(30.00 AS Decimal(18, 2)), 2, 44, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (220, CAST(30.00 AS Decimal(18, 2)), 2, 45, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (221, CAST(30.00 AS Decimal(18, 2)), 2, 46, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (222, CAST(30.00 AS Decimal(18, 2)), 2, 47, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (223, CAST(30.00 AS Decimal(18, 2)), 2, 48, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (224, CAST(30.00 AS Decimal(18, 2)), 2, 49, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (225, CAST(30.00 AS Decimal(18, 2)), 2, 50, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (226, CAST(30.00 AS Decimal(18, 2)), 2, 51, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (227, CAST(30.00 AS Decimal(18, 2)), 2, 52, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (228, CAST(30.00 AS Decimal(18, 2)), 2, 53, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (229, CAST(30.00 AS Decimal(18, 2)), 2, 54, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (230, CAST(30.00 AS Decimal(18, 2)), 2, 55, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (231, CAST(30.00 AS Decimal(18, 2)), 2, 56, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (232, CAST(30.00 AS Decimal(18, 2)), 2, 57, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (233, CAST(30.00 AS Decimal(18, 2)), 2, 58, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (234, CAST(30.00 AS Decimal(18, 2)), 2, 59, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (235, CAST(30.00 AS Decimal(18, 2)), 2, 60, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (236, CAST(30.00 AS Decimal(18, 2)), 2, 61, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (237, CAST(30.00 AS Decimal(18, 2)), 2, 62, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (238, CAST(30.00 AS Decimal(18, 2)), 2, 63, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (239, CAST(30.00 AS Decimal(18, 2)), 2, 64, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (240, CAST(30.00 AS Decimal(18, 2)), 2, 65, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (241, CAST(30.00 AS Decimal(18, 2)), 2, 66, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (242, CAST(30.00 AS Decimal(18, 2)), 2, 67, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (243, CAST(30.00 AS Decimal(18, 2)), 2, 68, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (244, CAST(30.00 AS Decimal(18, 2)), 2, 69, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (245, CAST(30.00 AS Decimal(18, 2)), 2, 70, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (246, CAST(40.00 AS Decimal(18, 2)), 2, 71, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (247, CAST(40.00 AS Decimal(18, 2)), 2, 72, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (248, CAST(40.00 AS Decimal(18, 2)), 2, 73, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (249, CAST(40.00 AS Decimal(18, 2)), 2, 74, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (250, CAST(40.00 AS Decimal(18, 2)), 2, 75, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (251, CAST(40.00 AS Decimal(18, 2)), 2, 76, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (252, CAST(40.00 AS Decimal(18, 2)), 2, 77, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (253, CAST(40.00 AS Decimal(18, 2)), 2, 78, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (254, CAST(40.00 AS Decimal(18, 2)), 2, 79, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (255, CAST(40.00 AS Decimal(18, 2)), 2, 80, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (256, CAST(40.00 AS Decimal(18, 2)), 2, 81, 3)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (257, CAST(40.00 AS Decimal(18, 2)), 2, 82, 3)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (258, CAST(40.00 AS Decimal(18, 2)), 2, 83, 3)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (259, CAST(40.00 AS Decimal(18, 2)), 2, 84, 3)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (260, CAST(40.00 AS Decimal(18, 2)), 2, 85, 3)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (261, CAST(40.00 AS Decimal(18, 2)), 2, 86, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (262, CAST(40.00 AS Decimal(18, 2)), 2, 87, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (263, CAST(40.00 AS Decimal(18, 2)), 2, 88, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (264, CAST(40.00 AS Decimal(18, 2)), 2, 89, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (265, CAST(40.00 AS Decimal(18, 2)), 2, 90, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (266, CAST(40.00 AS Decimal(18, 2)), 2, 91, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (267, CAST(40.00 AS Decimal(18, 2)), 2, 92, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (268, CAST(40.00 AS Decimal(18, 2)), 2, 93, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (269, CAST(40.00 AS Decimal(18, 2)), 2, 94, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (270, CAST(40.00 AS Decimal(18, 2)), 2, 95, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (271, CAST(40.00 AS Decimal(18, 2)), 2, 96, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (272, CAST(40.00 AS Decimal(18, 2)), 2, 97, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (273, CAST(40.00 AS Decimal(18, 2)), 2, 98, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (274, CAST(40.00 AS Decimal(18, 2)), 2, 99, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (275, CAST(40.00 AS Decimal(18, 2)), 2, 100, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (276, CAST(40.00 AS Decimal(18, 2)), 2, 101, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (277, CAST(40.00 AS Decimal(18, 2)), 2, 102, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (278, CAST(40.00 AS Decimal(18, 2)), 2, 103, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (279, CAST(40.00 AS Decimal(18, 2)), 2, 104, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (280, CAST(40.00 AS Decimal(18, 2)), 2, 105, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (281, CAST(50.00 AS Decimal(18, 2)), 2, 106, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (282, CAST(50.00 AS Decimal(18, 2)), 2, 107, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (283, CAST(50.00 AS Decimal(18, 2)), 2, 108, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (284, CAST(50.00 AS Decimal(18, 2)), 2, 109, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (285, CAST(50.00 AS Decimal(18, 2)), 2, 110, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (286, CAST(50.00 AS Decimal(18, 2)), 2, 111, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (287, CAST(50.00 AS Decimal(18, 2)), 2, 112, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (288, CAST(50.00 AS Decimal(18, 2)), 2, 113, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (289, CAST(50.00 AS Decimal(18, 2)), 2, 114, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (290, CAST(50.00 AS Decimal(18, 2)), 2, 115, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (291, CAST(50.00 AS Decimal(18, 2)), 2, 116, 5)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (292, CAST(50.00 AS Decimal(18, 2)), 2, 117, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (293, CAST(50.00 AS Decimal(18, 2)), 2, 118, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (294, CAST(50.00 AS Decimal(18, 2)), 2, 119, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (295, CAST(50.00 AS Decimal(18, 2)), 2, 120, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (296, CAST(50.00 AS Decimal(18, 2)), 2, 121, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (297, CAST(50.00 AS Decimal(18, 2)), 2, 122, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (298, CAST(50.00 AS Decimal(18, 2)), 2, 123, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (299, CAST(50.00 AS Decimal(18, 2)), 2, 124, NULL)
GO
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (300, CAST(50.00 AS Decimal(18, 2)), 2, 125, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (301, CAST(50.00 AS Decimal(18, 2)), 2, 126, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (302, CAST(50.00 AS Decimal(18, 2)), 2, 127, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (303, CAST(50.00 AS Decimal(18, 2)), 2, 128, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (304, CAST(50.00 AS Decimal(18, 2)), 2, 129, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (305, CAST(50.00 AS Decimal(18, 2)), 2, 130, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (306, CAST(50.00 AS Decimal(18, 2)), 2, 131, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (307, CAST(50.00 AS Decimal(18, 2)), 2, 132, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (308, CAST(50.00 AS Decimal(18, 2)), 2, 133, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (309, CAST(50.00 AS Decimal(18, 2)), 2, 134, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (310, CAST(50.00 AS Decimal(18, 2)), 2, 135, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (311, CAST(50.00 AS Decimal(18, 2)), 2, 136, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (312, CAST(50.00 AS Decimal(18, 2)), 2, 137, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (313, CAST(50.00 AS Decimal(18, 2)), 2, 138, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (314, CAST(50.00 AS Decimal(18, 2)), 2, 139, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (315, CAST(50.00 AS Decimal(18, 2)), 2, 140, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (316, CAST(60.00 AS Decimal(18, 2)), 2, 141, 4)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (317, CAST(60.00 AS Decimal(18, 2)), 2, 142, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (318, CAST(60.00 AS Decimal(18, 2)), 2, 143, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (319, CAST(60.00 AS Decimal(18, 2)), 2, 144, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (320, CAST(60.00 AS Decimal(18, 2)), 2, 145, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (321, CAST(60.00 AS Decimal(18, 2)), 2, 146, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (322, CAST(60.00 AS Decimal(18, 2)), 2, 147, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (323, CAST(60.00 AS Decimal(18, 2)), 2, 148, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (324, CAST(60.00 AS Decimal(18, 2)), 2, 149, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (325, CAST(60.00 AS Decimal(18, 2)), 2, 150, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (326, CAST(60.00 AS Decimal(18, 2)), 2, 151, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (327, CAST(60.00 AS Decimal(18, 2)), 2, 152, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (328, CAST(60.00 AS Decimal(18, 2)), 2, 153, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (329, CAST(60.00 AS Decimal(18, 2)), 2, 154, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (330, CAST(60.00 AS Decimal(18, 2)), 2, 155, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (331, CAST(60.00 AS Decimal(18, 2)), 2, 156, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (332, CAST(60.00 AS Decimal(18, 2)), 2, 157, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (333, CAST(60.00 AS Decimal(18, 2)), 2, 158, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (334, CAST(60.00 AS Decimal(18, 2)), 2, 159, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (335, CAST(60.00 AS Decimal(18, 2)), 2, 160, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (336, CAST(60.00 AS Decimal(18, 2)), 2, 161, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (337, CAST(60.00 AS Decimal(18, 2)), 2, 162, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (338, CAST(60.00 AS Decimal(18, 2)), 2, 163, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (339, CAST(60.00 AS Decimal(18, 2)), 2, 164, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (340, CAST(60.00 AS Decimal(18, 2)), 2, 165, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (341, CAST(60.00 AS Decimal(18, 2)), 2, 166, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (342, CAST(60.00 AS Decimal(18, 2)), 2, 167, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (343, CAST(60.00 AS Decimal(18, 2)), 2, 168, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (344, CAST(60.00 AS Decimal(18, 2)), 2, 169, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (345, CAST(60.00 AS Decimal(18, 2)), 2, 170, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (346, CAST(60.00 AS Decimal(18, 2)), 2, 171, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (347, CAST(60.00 AS Decimal(18, 2)), 2, 172, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (348, CAST(60.00 AS Decimal(18, 2)), 2, 173, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (349, CAST(60.00 AS Decimal(18, 2)), 2, 174, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (350, CAST(60.00 AS Decimal(18, 2)), 2, 175, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (351, CAST(40.00 AS Decimal(18, 2)), 3, 1, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (352, CAST(40.00 AS Decimal(18, 2)), 3, 2, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (353, CAST(40.00 AS Decimal(18, 2)), 3, 3, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (354, CAST(40.00 AS Decimal(18, 2)), 3, 4, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (355, CAST(40.00 AS Decimal(18, 2)), 3, 5, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (356, CAST(40.00 AS Decimal(18, 2)), 3, 6, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (357, CAST(40.00 AS Decimal(18, 2)), 3, 7, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (358, CAST(40.00 AS Decimal(18, 2)), 3, 8, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (359, CAST(40.00 AS Decimal(18, 2)), 3, 9, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (360, CAST(40.00 AS Decimal(18, 2)), 3, 10, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (361, CAST(40.00 AS Decimal(18, 2)), 3, 11, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (362, CAST(40.00 AS Decimal(18, 2)), 3, 12, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (363, CAST(40.00 AS Decimal(18, 2)), 3, 13, 7)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (364, CAST(40.00 AS Decimal(18, 2)), 3, 14, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (365, CAST(40.00 AS Decimal(18, 2)), 3, 15, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (366, CAST(40.00 AS Decimal(18, 2)), 3, 16, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (367, CAST(40.00 AS Decimal(18, 2)), 3, 17, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (368, CAST(40.00 AS Decimal(18, 2)), 3, 18, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (369, CAST(40.00 AS Decimal(18, 2)), 3, 19, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (370, CAST(40.00 AS Decimal(18, 2)), 3, 20, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (371, CAST(40.00 AS Decimal(18, 2)), 3, 21, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (372, CAST(40.00 AS Decimal(18, 2)), 3, 22, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (373, CAST(40.00 AS Decimal(18, 2)), 3, 23, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (374, CAST(40.00 AS Decimal(18, 2)), 3, 24, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (375, CAST(40.00 AS Decimal(18, 2)), 3, 25, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (376, CAST(40.00 AS Decimal(18, 2)), 3, 26, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (377, CAST(40.00 AS Decimal(18, 2)), 3, 27, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (378, CAST(40.00 AS Decimal(18, 2)), 3, 28, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (379, CAST(40.00 AS Decimal(18, 2)), 3, 29, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (380, CAST(40.00 AS Decimal(18, 2)), 3, 30, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (381, CAST(40.00 AS Decimal(18, 2)), 3, 31, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (382, CAST(40.00 AS Decimal(18, 2)), 3, 32, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (383, CAST(40.00 AS Decimal(18, 2)), 3, 33, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (384, CAST(40.00 AS Decimal(18, 2)), 3, 34, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (385, CAST(40.00 AS Decimal(18, 2)), 3, 35, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (386, CAST(60.00 AS Decimal(18, 2)), 3, 36, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (387, CAST(60.00 AS Decimal(18, 2)), 3, 37, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (388, CAST(60.00 AS Decimal(18, 2)), 3, 38, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (389, CAST(60.00 AS Decimal(18, 2)), 3, 39, 7)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (390, CAST(60.00 AS Decimal(18, 2)), 3, 40, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (391, CAST(60.00 AS Decimal(18, 2)), 3, 41, 7)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (392, CAST(60.00 AS Decimal(18, 2)), 3, 42, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (393, CAST(60.00 AS Decimal(18, 2)), 3, 43, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (394, CAST(60.00 AS Decimal(18, 2)), 3, 44, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (395, CAST(60.00 AS Decimal(18, 2)), 3, 45, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (396, CAST(60.00 AS Decimal(18, 2)), 3, 46, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (397, CAST(60.00 AS Decimal(18, 2)), 3, 47, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (398, CAST(60.00 AS Decimal(18, 2)), 3, 48, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (399, CAST(60.00 AS Decimal(18, 2)), 3, 49, NULL)
GO
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (400, CAST(60.00 AS Decimal(18, 2)), 3, 50, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (401, CAST(60.00 AS Decimal(18, 2)), 3, 51, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (402, CAST(60.00 AS Decimal(18, 2)), 3, 52, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (403, CAST(60.00 AS Decimal(18, 2)), 3, 53, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (404, CAST(60.00 AS Decimal(18, 2)), 3, 54, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (405, CAST(60.00 AS Decimal(18, 2)), 3, 55, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (406, CAST(60.00 AS Decimal(18, 2)), 3, 56, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (407, CAST(60.00 AS Decimal(18, 2)), 3, 57, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (408, CAST(60.00 AS Decimal(18, 2)), 3, 58, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (409, CAST(60.00 AS Decimal(18, 2)), 3, 59, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (410, CAST(60.00 AS Decimal(18, 2)), 3, 60, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (411, CAST(60.00 AS Decimal(18, 2)), 3, 61, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (412, CAST(60.00 AS Decimal(18, 2)), 3, 62, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (413, CAST(60.00 AS Decimal(18, 2)), 3, 63, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (414, CAST(60.00 AS Decimal(18, 2)), 3, 64, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (415, CAST(60.00 AS Decimal(18, 2)), 3, 65, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (416, CAST(60.00 AS Decimal(18, 2)), 3, 66, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (417, CAST(60.00 AS Decimal(18, 2)), 3, 67, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (418, CAST(60.00 AS Decimal(18, 2)), 3, 68, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (419, CAST(60.00 AS Decimal(18, 2)), 3, 69, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (420, CAST(60.00 AS Decimal(18, 2)), 3, 70, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (421, CAST(80.00 AS Decimal(18, 2)), 3, 71, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (422, CAST(80.00 AS Decimal(18, 2)), 3, 72, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (423, CAST(80.00 AS Decimal(18, 2)), 3, 73, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (424, CAST(80.00 AS Decimal(18, 2)), 3, 74, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (425, CAST(80.00 AS Decimal(18, 2)), 3, 75, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (426, CAST(80.00 AS Decimal(18, 2)), 3, 76, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (427, CAST(80.00 AS Decimal(18, 2)), 3, 77, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (428, CAST(80.00 AS Decimal(18, 2)), 3, 78, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (429, CAST(80.00 AS Decimal(18, 2)), 3, 79, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (430, CAST(80.00 AS Decimal(18, 2)), 3, 80, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (431, CAST(80.00 AS Decimal(18, 2)), 3, 81, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (432, CAST(80.00 AS Decimal(18, 2)), 3, 82, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (433, CAST(80.00 AS Decimal(18, 2)), 3, 83, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (434, CAST(80.00 AS Decimal(18, 2)), 3, 84, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (435, CAST(80.00 AS Decimal(18, 2)), 3, 85, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (436, CAST(80.00 AS Decimal(18, 2)), 3, 86, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (437, CAST(80.00 AS Decimal(18, 2)), 3, 87, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (438, CAST(80.00 AS Decimal(18, 2)), 3, 88, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (439, CAST(80.00 AS Decimal(18, 2)), 3, 89, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (440, CAST(80.00 AS Decimal(18, 2)), 3, 90, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (441, CAST(80.00 AS Decimal(18, 2)), 3, 91, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (442, CAST(80.00 AS Decimal(18, 2)), 3, 92, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (443, CAST(80.00 AS Decimal(18, 2)), 3, 93, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (444, CAST(80.00 AS Decimal(18, 2)), 3, 94, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (445, CAST(80.00 AS Decimal(18, 2)), 3, 95, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (446, CAST(80.00 AS Decimal(18, 2)), 3, 96, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (447, CAST(80.00 AS Decimal(18, 2)), 3, 97, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (448, CAST(80.00 AS Decimal(18, 2)), 3, 98, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (449, CAST(80.00 AS Decimal(18, 2)), 3, 99, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (450, CAST(80.00 AS Decimal(18, 2)), 3, 100, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (451, CAST(80.00 AS Decimal(18, 2)), 3, 101, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (452, CAST(80.00 AS Decimal(18, 2)), 3, 102, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (453, CAST(80.00 AS Decimal(18, 2)), 3, 103, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (454, CAST(80.00 AS Decimal(18, 2)), 3, 104, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (455, CAST(80.00 AS Decimal(18, 2)), 3, 105, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (456, CAST(100.00 AS Decimal(18, 2)), 3, 106, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (457, CAST(100.00 AS Decimal(18, 2)), 3, 107, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (458, CAST(100.00 AS Decimal(18, 2)), 3, 108, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (459, CAST(100.00 AS Decimal(18, 2)), 3, 109, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (460, CAST(100.00 AS Decimal(18, 2)), 3, 110, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (461, CAST(100.00 AS Decimal(18, 2)), 3, 111, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (462, CAST(100.00 AS Decimal(18, 2)), 3, 112, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (463, CAST(100.00 AS Decimal(18, 2)), 3, 113, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (464, CAST(100.00 AS Decimal(18, 2)), 3, 114, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (465, CAST(100.00 AS Decimal(18, 2)), 3, 115, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (466, CAST(100.00 AS Decimal(18, 2)), 3, 116, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (467, CAST(100.00 AS Decimal(18, 2)), 3, 117, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (468, CAST(100.00 AS Decimal(18, 2)), 3, 118, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (469, CAST(100.00 AS Decimal(18, 2)), 3, 119, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (470, CAST(100.00 AS Decimal(18, 2)), 3, 120, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (471, CAST(100.00 AS Decimal(18, 2)), 3, 121, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (472, CAST(100.00 AS Decimal(18, 2)), 3, 122, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (473, CAST(100.00 AS Decimal(18, 2)), 3, 123, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (474, CAST(100.00 AS Decimal(18, 2)), 3, 124, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (475, CAST(100.00 AS Decimal(18, 2)), 3, 125, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (476, CAST(100.00 AS Decimal(18, 2)), 3, 126, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (477, CAST(100.00 AS Decimal(18, 2)), 3, 127, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (478, CAST(100.00 AS Decimal(18, 2)), 3, 128, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (479, CAST(100.00 AS Decimal(18, 2)), 3, 129, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (480, CAST(100.00 AS Decimal(18, 2)), 3, 130, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (481, CAST(100.00 AS Decimal(18, 2)), 3, 131, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (482, CAST(100.00 AS Decimal(18, 2)), 3, 132, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (483, CAST(100.00 AS Decimal(18, 2)), 3, 133, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (484, CAST(100.00 AS Decimal(18, 2)), 3, 134, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (485, CAST(100.00 AS Decimal(18, 2)), 3, 135, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (486, CAST(100.00 AS Decimal(18, 2)), 3, 136, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (487, CAST(100.00 AS Decimal(18, 2)), 3, 137, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (488, CAST(100.00 AS Decimal(18, 2)), 3, 138, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (489, CAST(100.00 AS Decimal(18, 2)), 3, 139, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (490, CAST(100.00 AS Decimal(18, 2)), 3, 140, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (491, CAST(120.00 AS Decimal(18, 2)), 3, 141, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (492, CAST(120.00 AS Decimal(18, 2)), 3, 142, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (493, CAST(120.00 AS Decimal(18, 2)), 3, 143, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (494, CAST(120.00 AS Decimal(18, 2)), 3, 144, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (495, CAST(120.00 AS Decimal(18, 2)), 3, 145, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (496, CAST(120.00 AS Decimal(18, 2)), 3, 146, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (497, CAST(120.00 AS Decimal(18, 2)), 3, 147, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (498, CAST(120.00 AS Decimal(18, 2)), 3, 148, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (499, CAST(120.00 AS Decimal(18, 2)), 3, 149, NULL)
GO
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (500, CAST(120.00 AS Decimal(18, 2)), 3, 150, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (501, CAST(120.00 AS Decimal(18, 2)), 3, 151, 6)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (502, CAST(120.00 AS Decimal(18, 2)), 3, 152, 6)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (503, CAST(120.00 AS Decimal(18, 2)), 3, 153, 6)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (504, CAST(120.00 AS Decimal(18, 2)), 3, 154, 6)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (505, CAST(120.00 AS Decimal(18, 2)), 3, 155, 6)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (506, CAST(120.00 AS Decimal(18, 2)), 3, 156, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (507, CAST(120.00 AS Decimal(18, 2)), 3, 157, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (508, CAST(120.00 AS Decimal(18, 2)), 3, 158, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (509, CAST(120.00 AS Decimal(18, 2)), 3, 159, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (510, CAST(120.00 AS Decimal(18, 2)), 3, 160, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (511, CAST(120.00 AS Decimal(18, 2)), 3, 161, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (512, CAST(120.00 AS Decimal(18, 2)), 3, 162, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (513, CAST(120.00 AS Decimal(18, 2)), 3, 163, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (514, CAST(120.00 AS Decimal(18, 2)), 3, 164, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (515, CAST(120.00 AS Decimal(18, 2)), 3, 165, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (516, CAST(120.00 AS Decimal(18, 2)), 3, 166, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (517, CAST(120.00 AS Decimal(18, 2)), 3, 167, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (518, CAST(120.00 AS Decimal(18, 2)), 3, 168, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (519, CAST(120.00 AS Decimal(18, 2)), 3, 169, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (520, CAST(120.00 AS Decimal(18, 2)), 3, 170, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (521, CAST(120.00 AS Decimal(18, 2)), 3, 171, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (522, CAST(120.00 AS Decimal(18, 2)), 3, 172, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (523, CAST(120.00 AS Decimal(18, 2)), 3, 173, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (524, CAST(120.00 AS Decimal(18, 2)), 3, 174, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (525, CAST(120.00 AS Decimal(18, 2)), 3, 175, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (526, CAST(50.00 AS Decimal(18, 2)), 4, 1, 9)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (527, CAST(50.00 AS Decimal(18, 2)), 4, 2, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (528, CAST(50.00 AS Decimal(18, 2)), 4, 3, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (529, CAST(50.00 AS Decimal(18, 2)), 4, 4, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (530, CAST(50.00 AS Decimal(18, 2)), 4, 5, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (531, CAST(50.00 AS Decimal(18, 2)), 4, 6, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (532, CAST(50.00 AS Decimal(18, 2)), 4, 7, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (533, CAST(50.00 AS Decimal(18, 2)), 4, 8, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (534, CAST(50.00 AS Decimal(18, 2)), 4, 9, 9)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (535, CAST(50.00 AS Decimal(18, 2)), 4, 10, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (536, CAST(50.00 AS Decimal(18, 2)), 4, 11, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (537, CAST(50.00 AS Decimal(18, 2)), 4, 12, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (538, CAST(50.00 AS Decimal(18, 2)), 4, 13, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (539, CAST(50.00 AS Decimal(18, 2)), 4, 14, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (540, CAST(50.00 AS Decimal(18, 2)), 4, 15, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (541, CAST(50.00 AS Decimal(18, 2)), 4, 16, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (542, CAST(50.00 AS Decimal(18, 2)), 4, 17, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (543, CAST(50.00 AS Decimal(18, 2)), 4, 18, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (544, CAST(50.00 AS Decimal(18, 2)), 4, 19, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (545, CAST(50.00 AS Decimal(18, 2)), 4, 20, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (546, CAST(50.00 AS Decimal(18, 2)), 4, 21, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (547, CAST(50.00 AS Decimal(18, 2)), 4, 22, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (548, CAST(50.00 AS Decimal(18, 2)), 4, 23, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (549, CAST(50.00 AS Decimal(18, 2)), 4, 24, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (550, CAST(50.00 AS Decimal(18, 2)), 4, 25, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (551, CAST(50.00 AS Decimal(18, 2)), 4, 26, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (552, CAST(50.00 AS Decimal(18, 2)), 4, 27, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (553, CAST(50.00 AS Decimal(18, 2)), 4, 28, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (554, CAST(50.00 AS Decimal(18, 2)), 4, 29, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (555, CAST(50.00 AS Decimal(18, 2)), 4, 30, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (556, CAST(50.00 AS Decimal(18, 2)), 4, 31, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (557, CAST(50.00 AS Decimal(18, 2)), 4, 32, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (558, CAST(50.00 AS Decimal(18, 2)), 4, 33, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (559, CAST(50.00 AS Decimal(18, 2)), 4, 34, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (560, CAST(50.00 AS Decimal(18, 2)), 4, 35, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (561, CAST(100.00 AS Decimal(18, 2)), 4, 36, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (562, CAST(100.00 AS Decimal(18, 2)), 4, 37, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (563, CAST(100.00 AS Decimal(18, 2)), 4, 38, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (564, CAST(100.00 AS Decimal(18, 2)), 4, 39, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (565, CAST(100.00 AS Decimal(18, 2)), 4, 40, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (566, CAST(100.00 AS Decimal(18, 2)), 4, 41, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (567, CAST(100.00 AS Decimal(18, 2)), 4, 42, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (568, CAST(100.00 AS Decimal(18, 2)), 4, 43, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (569, CAST(100.00 AS Decimal(18, 2)), 4, 44, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (570, CAST(100.00 AS Decimal(18, 2)), 4, 45, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (571, CAST(100.00 AS Decimal(18, 2)), 4, 46, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (572, CAST(100.00 AS Decimal(18, 2)), 4, 47, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (573, CAST(100.00 AS Decimal(18, 2)), 4, 48, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (574, CAST(100.00 AS Decimal(18, 2)), 4, 49, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (575, CAST(100.00 AS Decimal(18, 2)), 4, 50, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (576, CAST(100.00 AS Decimal(18, 2)), 4, 51, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (577, CAST(100.00 AS Decimal(18, 2)), 4, 52, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (578, CAST(100.00 AS Decimal(18, 2)), 4, 53, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (579, CAST(100.00 AS Decimal(18, 2)), 4, 54, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (580, CAST(100.00 AS Decimal(18, 2)), 4, 55, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (581, CAST(100.00 AS Decimal(18, 2)), 4, 56, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (582, CAST(100.00 AS Decimal(18, 2)), 4, 57, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (583, CAST(100.00 AS Decimal(18, 2)), 4, 58, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (584, CAST(100.00 AS Decimal(18, 2)), 4, 59, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (585, CAST(100.00 AS Decimal(18, 2)), 4, 60, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (586, CAST(100.00 AS Decimal(18, 2)), 4, 61, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (587, CAST(100.00 AS Decimal(18, 2)), 4, 62, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (588, CAST(100.00 AS Decimal(18, 2)), 4, 63, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (589, CAST(100.00 AS Decimal(18, 2)), 4, 64, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (590, CAST(100.00 AS Decimal(18, 2)), 4, 65, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (591, CAST(100.00 AS Decimal(18, 2)), 4, 66, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (592, CAST(100.00 AS Decimal(18, 2)), 4, 67, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (593, CAST(100.00 AS Decimal(18, 2)), 4, 68, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (594, CAST(100.00 AS Decimal(18, 2)), 4, 69, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (595, CAST(100.00 AS Decimal(18, 2)), 4, 70, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (596, CAST(150.00 AS Decimal(18, 2)), 4, 71, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (597, CAST(150.00 AS Decimal(18, 2)), 4, 72, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (598, CAST(150.00 AS Decimal(18, 2)), 4, 73, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (599, CAST(150.00 AS Decimal(18, 2)), 4, 74, NULL)
GO
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (600, CAST(150.00 AS Decimal(18, 2)), 4, 75, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (601, CAST(150.00 AS Decimal(18, 2)), 4, 76, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (602, CAST(150.00 AS Decimal(18, 2)), 4, 77, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (603, CAST(150.00 AS Decimal(18, 2)), 4, 78, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (604, CAST(150.00 AS Decimal(18, 2)), 4, 79, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (605, CAST(150.00 AS Decimal(18, 2)), 4, 80, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (606, CAST(150.00 AS Decimal(18, 2)), 4, 81, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (607, CAST(150.00 AS Decimal(18, 2)), 4, 82, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (608, CAST(150.00 AS Decimal(18, 2)), 4, 83, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (609, CAST(150.00 AS Decimal(18, 2)), 4, 84, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (610, CAST(150.00 AS Decimal(18, 2)), 4, 85, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (611, CAST(150.00 AS Decimal(18, 2)), 4, 86, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (612, CAST(150.00 AS Decimal(18, 2)), 4, 87, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (613, CAST(150.00 AS Decimal(18, 2)), 4, 88, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (614, CAST(150.00 AS Decimal(18, 2)), 4, 89, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (615, CAST(150.00 AS Decimal(18, 2)), 4, 90, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (616, CAST(150.00 AS Decimal(18, 2)), 4, 91, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (617, CAST(150.00 AS Decimal(18, 2)), 4, 92, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (618, CAST(150.00 AS Decimal(18, 2)), 4, 93, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (619, CAST(150.00 AS Decimal(18, 2)), 4, 94, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (620, CAST(150.00 AS Decimal(18, 2)), 4, 95, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (621, CAST(150.00 AS Decimal(18, 2)), 4, 96, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (622, CAST(150.00 AS Decimal(18, 2)), 4, 97, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (623, CAST(150.00 AS Decimal(18, 2)), 4, 98, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (624, CAST(150.00 AS Decimal(18, 2)), 4, 99, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (625, CAST(150.00 AS Decimal(18, 2)), 4, 100, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (626, CAST(150.00 AS Decimal(18, 2)), 4, 101, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (627, CAST(150.00 AS Decimal(18, 2)), 4, 102, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (628, CAST(150.00 AS Decimal(18, 2)), 4, 103, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (629, CAST(150.00 AS Decimal(18, 2)), 4, 104, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (630, CAST(150.00 AS Decimal(18, 2)), 4, 105, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (631, CAST(200.00 AS Decimal(18, 2)), 4, 106, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (632, CAST(200.00 AS Decimal(18, 2)), 4, 107, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (633, CAST(200.00 AS Decimal(18, 2)), 4, 108, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (634, CAST(200.00 AS Decimal(18, 2)), 4, 109, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (635, CAST(200.00 AS Decimal(18, 2)), 4, 110, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (636, CAST(200.00 AS Decimal(18, 2)), 4, 111, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (637, CAST(200.00 AS Decimal(18, 2)), 4, 112, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (638, CAST(200.00 AS Decimal(18, 2)), 4, 113, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (639, CAST(200.00 AS Decimal(18, 2)), 4, 114, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (640, CAST(200.00 AS Decimal(18, 2)), 4, 115, 9)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (641, CAST(200.00 AS Decimal(18, 2)), 4, 116, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (642, CAST(200.00 AS Decimal(18, 2)), 4, 117, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (643, CAST(200.00 AS Decimal(18, 2)), 4, 118, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (644, CAST(200.00 AS Decimal(18, 2)), 4, 119, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (645, CAST(200.00 AS Decimal(18, 2)), 4, 120, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (646, CAST(200.00 AS Decimal(18, 2)), 4, 121, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (647, CAST(200.00 AS Decimal(18, 2)), 4, 122, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (648, CAST(200.00 AS Decimal(18, 2)), 4, 123, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (649, CAST(200.00 AS Decimal(18, 2)), 4, 124, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (650, CAST(200.00 AS Decimal(18, 2)), 4, 125, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (651, CAST(200.00 AS Decimal(18, 2)), 4, 126, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (652, CAST(200.00 AS Decimal(18, 2)), 4, 127, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (653, CAST(200.00 AS Decimal(18, 2)), 4, 128, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (654, CAST(200.00 AS Decimal(18, 2)), 4, 129, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (655, CAST(200.00 AS Decimal(18, 2)), 4, 130, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (656, CAST(200.00 AS Decimal(18, 2)), 4, 131, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (657, CAST(200.00 AS Decimal(18, 2)), 4, 132, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (658, CAST(200.00 AS Decimal(18, 2)), 4, 133, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (659, CAST(200.00 AS Decimal(18, 2)), 4, 134, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (660, CAST(200.00 AS Decimal(18, 2)), 4, 135, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (661, CAST(200.00 AS Decimal(18, 2)), 4, 136, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (662, CAST(200.00 AS Decimal(18, 2)), 4, 137, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (663, CAST(200.00 AS Decimal(18, 2)), 4, 138, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (664, CAST(200.00 AS Decimal(18, 2)), 4, 139, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (665, CAST(200.00 AS Decimal(18, 2)), 4, 140, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (666, CAST(250.00 AS Decimal(18, 2)), 4, 141, 8)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (667, CAST(250.00 AS Decimal(18, 2)), 4, 142, 8)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (668, CAST(250.00 AS Decimal(18, 2)), 4, 143, 8)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (669, CAST(250.00 AS Decimal(18, 2)), 4, 144, 8)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (670, CAST(250.00 AS Decimal(18, 2)), 4, 145, 8)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (671, CAST(250.00 AS Decimal(18, 2)), 4, 146, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (672, CAST(250.00 AS Decimal(18, 2)), 4, 147, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (673, CAST(250.00 AS Decimal(18, 2)), 4, 148, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (674, CAST(250.00 AS Decimal(18, 2)), 4, 149, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (675, CAST(250.00 AS Decimal(18, 2)), 4, 150, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (676, CAST(250.00 AS Decimal(18, 2)), 4, 151, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (677, CAST(250.00 AS Decimal(18, 2)), 4, 152, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (678, CAST(250.00 AS Decimal(18, 2)), 4, 153, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (679, CAST(250.00 AS Decimal(18, 2)), 4, 154, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (680, CAST(250.00 AS Decimal(18, 2)), 4, 155, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (681, CAST(250.00 AS Decimal(18, 2)), 4, 156, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (682, CAST(250.00 AS Decimal(18, 2)), 4, 157, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (683, CAST(250.00 AS Decimal(18, 2)), 4, 158, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (684, CAST(250.00 AS Decimal(18, 2)), 4, 159, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (685, CAST(250.00 AS Decimal(18, 2)), 4, 160, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (686, CAST(250.00 AS Decimal(18, 2)), 4, 161, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (687, CAST(250.00 AS Decimal(18, 2)), 4, 162, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (688, CAST(250.00 AS Decimal(18, 2)), 4, 163, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (689, CAST(250.00 AS Decimal(18, 2)), 4, 164, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (690, CAST(250.00 AS Decimal(18, 2)), 4, 165, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (691, CAST(250.00 AS Decimal(18, 2)), 4, 166, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (692, CAST(250.00 AS Decimal(18, 2)), 4, 167, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (693, CAST(250.00 AS Decimal(18, 2)), 4, 168, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (694, CAST(250.00 AS Decimal(18, 2)), 4, 169, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (695, CAST(250.00 AS Decimal(18, 2)), 4, 170, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (696, CAST(250.00 AS Decimal(18, 2)), 4, 171, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (697, CAST(250.00 AS Decimal(18, 2)), 4, 172, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (698, CAST(250.00 AS Decimal(18, 2)), 4, 173, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (699, CAST(250.00 AS Decimal(18, 2)), 4, 174, NULL)
GO
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (700, CAST(250.00 AS Decimal(18, 2)), 4, 175, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (701, CAST(75.00 AS Decimal(18, 2)), 5, 1, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (702, CAST(75.00 AS Decimal(18, 2)), 5, 2, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (703, CAST(75.00 AS Decimal(18, 2)), 5, 3, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (704, CAST(75.00 AS Decimal(18, 2)), 5, 4, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (705, CAST(75.00 AS Decimal(18, 2)), 5, 5, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (706, CAST(75.00 AS Decimal(18, 2)), 5, 6, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (707, CAST(75.00 AS Decimal(18, 2)), 5, 7, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (708, CAST(75.00 AS Decimal(18, 2)), 5, 8, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (709, CAST(75.00 AS Decimal(18, 2)), 5, 9, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (710, CAST(75.00 AS Decimal(18, 2)), 5, 10, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (711, CAST(75.00 AS Decimal(18, 2)), 5, 11, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (712, CAST(75.00 AS Decimal(18, 2)), 5, 12, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (713, CAST(75.00 AS Decimal(18, 2)), 5, 13, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (714, CAST(75.00 AS Decimal(18, 2)), 5, 14, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (715, CAST(75.00 AS Decimal(18, 2)), 5, 15, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (716, CAST(75.00 AS Decimal(18, 2)), 5, 16, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (717, CAST(75.00 AS Decimal(18, 2)), 5, 17, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (718, CAST(75.00 AS Decimal(18, 2)), 5, 18, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (719, CAST(75.00 AS Decimal(18, 2)), 5, 19, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (720, CAST(75.00 AS Decimal(18, 2)), 5, 20, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (721, CAST(75.00 AS Decimal(18, 2)), 5, 21, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (722, CAST(75.00 AS Decimal(18, 2)), 5, 22, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (723, CAST(75.00 AS Decimal(18, 2)), 5, 23, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (724, CAST(75.00 AS Decimal(18, 2)), 5, 24, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (725, CAST(75.00 AS Decimal(18, 2)), 5, 25, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (726, CAST(75.00 AS Decimal(18, 2)), 5, 26, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (727, CAST(75.00 AS Decimal(18, 2)), 5, 27, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (728, CAST(75.00 AS Decimal(18, 2)), 5, 28, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (729, CAST(75.00 AS Decimal(18, 2)), 5, 29, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (730, CAST(75.00 AS Decimal(18, 2)), 5, 30, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (731, CAST(75.00 AS Decimal(18, 2)), 5, 31, 14)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (732, CAST(75.00 AS Decimal(18, 2)), 5, 32, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (733, CAST(75.00 AS Decimal(18, 2)), 5, 33, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (734, CAST(75.00 AS Decimal(18, 2)), 5, 34, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (735, CAST(75.00 AS Decimal(18, 2)), 5, 35, 14)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (736, CAST(120.00 AS Decimal(18, 2)), 5, 36, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (737, CAST(120.00 AS Decimal(18, 2)), 5, 37, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (738, CAST(120.00 AS Decimal(18, 2)), 5, 38, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (739, CAST(120.00 AS Decimal(18, 2)), 5, 39, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (740, CAST(120.00 AS Decimal(18, 2)), 5, 40, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (741, CAST(120.00 AS Decimal(18, 2)), 5, 41, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (742, CAST(120.00 AS Decimal(18, 2)), 5, 42, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (743, CAST(120.00 AS Decimal(18, 2)), 5, 43, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (744, CAST(120.00 AS Decimal(18, 2)), 5, 44, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (745, CAST(120.00 AS Decimal(18, 2)), 5, 45, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (746, CAST(120.00 AS Decimal(18, 2)), 5, 46, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (747, CAST(120.00 AS Decimal(18, 2)), 5, 47, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (748, CAST(120.00 AS Decimal(18, 2)), 5, 48, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (749, CAST(120.00 AS Decimal(18, 2)), 5, 49, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (750, CAST(120.00 AS Decimal(18, 2)), 5, 50, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (751, CAST(120.00 AS Decimal(18, 2)), 5, 51, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (752, CAST(120.00 AS Decimal(18, 2)), 5, 52, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (753, CAST(120.00 AS Decimal(18, 2)), 5, 53, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (754, CAST(120.00 AS Decimal(18, 2)), 5, 54, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (755, CAST(120.00 AS Decimal(18, 2)), 5, 55, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (756, CAST(120.00 AS Decimal(18, 2)), 5, 56, 10)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (757, CAST(120.00 AS Decimal(18, 2)), 5, 57, 10)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (758, CAST(120.00 AS Decimal(18, 2)), 5, 58, 11)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (759, CAST(120.00 AS Decimal(18, 2)), 5, 59, 11)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (760, CAST(120.00 AS Decimal(18, 2)), 5, 60, 11)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (761, CAST(120.00 AS Decimal(18, 2)), 5, 61, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (762, CAST(120.00 AS Decimal(18, 2)), 5, 62, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (763, CAST(120.00 AS Decimal(18, 2)), 5, 63, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (764, CAST(120.00 AS Decimal(18, 2)), 5, 64, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (765, CAST(120.00 AS Decimal(18, 2)), 5, 65, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (766, CAST(120.00 AS Decimal(18, 2)), 5, 66, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (767, CAST(120.00 AS Decimal(18, 2)), 5, 67, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (768, CAST(120.00 AS Decimal(18, 2)), 5, 68, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (769, CAST(120.00 AS Decimal(18, 2)), 5, 69, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (770, CAST(120.00 AS Decimal(18, 2)), 5, 70, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (771, CAST(165.00 AS Decimal(18, 2)), 5, 71, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (772, CAST(165.00 AS Decimal(18, 2)), 5, 72, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (773, CAST(165.00 AS Decimal(18, 2)), 5, 73, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (774, CAST(165.00 AS Decimal(18, 2)), 5, 74, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (775, CAST(165.00 AS Decimal(18, 2)), 5, 75, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (776, CAST(165.00 AS Decimal(18, 2)), 5, 76, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (777, CAST(165.00 AS Decimal(18, 2)), 5, 77, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (778, CAST(165.00 AS Decimal(18, 2)), 5, 78, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (779, CAST(165.00 AS Decimal(18, 2)), 5, 79, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (780, CAST(165.00 AS Decimal(18, 2)), 5, 80, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (781, CAST(165.00 AS Decimal(18, 2)), 5, 81, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (782, CAST(165.00 AS Decimal(18, 2)), 5, 82, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (783, CAST(165.00 AS Decimal(18, 2)), 5, 83, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (784, CAST(165.00 AS Decimal(18, 2)), 5, 84, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (785, CAST(165.00 AS Decimal(18, 2)), 5, 85, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (786, CAST(165.00 AS Decimal(18, 2)), 5, 86, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (787, CAST(165.00 AS Decimal(18, 2)), 5, 87, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (788, CAST(165.00 AS Decimal(18, 2)), 5, 88, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (789, CAST(165.00 AS Decimal(18, 2)), 5, 89, 13)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (790, CAST(165.00 AS Decimal(18, 2)), 5, 90, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (791, CAST(165.00 AS Decimal(18, 2)), 5, 91, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (792, CAST(165.00 AS Decimal(18, 2)), 5, 92, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (793, CAST(165.00 AS Decimal(18, 2)), 5, 93, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (794, CAST(165.00 AS Decimal(18, 2)), 5, 94, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (795, CAST(165.00 AS Decimal(18, 2)), 5, 95, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (796, CAST(165.00 AS Decimal(18, 2)), 5, 96, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (797, CAST(165.00 AS Decimal(18, 2)), 5, 97, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (798, CAST(165.00 AS Decimal(18, 2)), 5, 98, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (799, CAST(165.00 AS Decimal(18, 2)), 5, 99, NULL)
GO
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (800, CAST(165.00 AS Decimal(18, 2)), 5, 100, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (801, CAST(165.00 AS Decimal(18, 2)), 5, 101, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (802, CAST(165.00 AS Decimal(18, 2)), 5, 102, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (803, CAST(165.00 AS Decimal(18, 2)), 5, 103, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (804, CAST(165.00 AS Decimal(18, 2)), 5, 104, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (805, CAST(165.00 AS Decimal(18, 2)), 5, 105, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (806, CAST(210.00 AS Decimal(18, 2)), 5, 106, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (807, CAST(210.00 AS Decimal(18, 2)), 5, 107, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (808, CAST(210.00 AS Decimal(18, 2)), 5, 108, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (809, CAST(210.00 AS Decimal(18, 2)), 5, 109, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (810, CAST(210.00 AS Decimal(18, 2)), 5, 110, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (811, CAST(210.00 AS Decimal(18, 2)), 5, 111, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (812, CAST(210.00 AS Decimal(18, 2)), 5, 112, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (813, CAST(210.00 AS Decimal(18, 2)), 5, 113, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (814, CAST(210.00 AS Decimal(18, 2)), 5, 114, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (815, CAST(210.00 AS Decimal(18, 2)), 5, 115, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (816, CAST(210.00 AS Decimal(18, 2)), 5, 116, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (817, CAST(210.00 AS Decimal(18, 2)), 5, 117, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (818, CAST(210.00 AS Decimal(18, 2)), 5, 118, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (819, CAST(210.00 AS Decimal(18, 2)), 5, 119, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (820, CAST(210.00 AS Decimal(18, 2)), 5, 120, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (821, CAST(210.00 AS Decimal(18, 2)), 5, 121, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (822, CAST(210.00 AS Decimal(18, 2)), 5, 122, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (823, CAST(210.00 AS Decimal(18, 2)), 5, 123, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (824, CAST(210.00 AS Decimal(18, 2)), 5, 124, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (825, CAST(210.00 AS Decimal(18, 2)), 5, 125, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (826, CAST(210.00 AS Decimal(18, 2)), 5, 126, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (827, CAST(210.00 AS Decimal(18, 2)), 5, 127, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (828, CAST(210.00 AS Decimal(18, 2)), 5, 128, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (829, CAST(210.00 AS Decimal(18, 2)), 5, 129, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (830, CAST(210.00 AS Decimal(18, 2)), 5, 130, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (831, CAST(210.00 AS Decimal(18, 2)), 5, 131, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (832, CAST(210.00 AS Decimal(18, 2)), 5, 132, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (833, CAST(210.00 AS Decimal(18, 2)), 5, 133, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (834, CAST(210.00 AS Decimal(18, 2)), 5, 134, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (835, CAST(210.00 AS Decimal(18, 2)), 5, 135, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (836, CAST(210.00 AS Decimal(18, 2)), 5, 136, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (837, CAST(210.00 AS Decimal(18, 2)), 5, 137, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (838, CAST(210.00 AS Decimal(18, 2)), 5, 138, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (839, CAST(210.00 AS Decimal(18, 2)), 5, 139, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (840, CAST(210.00 AS Decimal(18, 2)), 5, 140, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (841, CAST(255.00 AS Decimal(18, 2)), 5, 141, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (842, CAST(255.00 AS Decimal(18, 2)), 5, 142, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (843, CAST(255.00 AS Decimal(18, 2)), 5, 143, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (844, CAST(255.00 AS Decimal(18, 2)), 5, 144, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (845, CAST(255.00 AS Decimal(18, 2)), 5, 145, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (846, CAST(255.00 AS Decimal(18, 2)), 5, 146, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (847, CAST(255.00 AS Decimal(18, 2)), 5, 147, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (848, CAST(255.00 AS Decimal(18, 2)), 5, 148, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (849, CAST(255.00 AS Decimal(18, 2)), 5, 149, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (850, CAST(255.00 AS Decimal(18, 2)), 5, 150, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (851, CAST(255.00 AS Decimal(18, 2)), 5, 151, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (852, CAST(255.00 AS Decimal(18, 2)), 5, 152, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (853, CAST(255.00 AS Decimal(18, 2)), 5, 153, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (854, CAST(255.00 AS Decimal(18, 2)), 5, 154, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (855, CAST(255.00 AS Decimal(18, 2)), 5, 155, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (856, CAST(255.00 AS Decimal(18, 2)), 5, 156, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (857, CAST(255.00 AS Decimal(18, 2)), 5, 157, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (858, CAST(255.00 AS Decimal(18, 2)), 5, 158, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (859, CAST(255.00 AS Decimal(18, 2)), 5, 159, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (860, CAST(255.00 AS Decimal(18, 2)), 5, 160, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (861, CAST(255.00 AS Decimal(18, 2)), 5, 161, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (862, CAST(255.00 AS Decimal(18, 2)), 5, 162, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (863, CAST(255.00 AS Decimal(18, 2)), 5, 163, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (864, CAST(255.00 AS Decimal(18, 2)), 5, 164, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (865, CAST(255.00 AS Decimal(18, 2)), 5, 165, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (866, CAST(255.00 AS Decimal(18, 2)), 5, 166, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (867, CAST(255.00 AS Decimal(18, 2)), 5, 167, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (868, CAST(255.00 AS Decimal(18, 2)), 5, 168, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (869, CAST(255.00 AS Decimal(18, 2)), 5, 169, 12)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (870, CAST(255.00 AS Decimal(18, 2)), 5, 170, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (871, CAST(255.00 AS Decimal(18, 2)), 5, 171, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (872, CAST(255.00 AS Decimal(18, 2)), 5, 172, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (873, CAST(255.00 AS Decimal(18, 2)), 5, 173, NULL)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (874, CAST(255.00 AS Decimal(18, 2)), 5, 174, 12)
INSERT [dbo].[EventSeat] ([EventSeatId], [EventSeatPrice], [EventId], [SeatId], [TicketPurchaseId]) VALUES (875, CAST(255.00 AS Decimal(18, 2)), 5, 175, NULL)
SET IDENTITY_INSERT [dbo].[EventSeat] OFF
SET IDENTITY_INSERT [dbo].[Row] ON 

INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (1, N'5', 1)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (2, N'4', 1)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (3, N'3', 1)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (4, N'2', 1)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (5, N'1', 1)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (6, N'5', 2)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (7, N'4', 2)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (8, N'3', 2)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (9, N'2', 2)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (10, N'1', 2)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (11, N'5', 3)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (12, N'4', 3)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (13, N'3', 3)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (14, N'2', 3)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (15, N'1', 3)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (16, N'5', 4)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (17, N'4', 4)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (18, N'3', 4)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (19, N'2', 4)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (20, N'1', 4)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (21, N'5', 5)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (22, N'4', 5)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (23, N'3', 5)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (24, N'2', 5)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (25, N'1', 5)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (26, N'5', 6)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (27, N'4', 6)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (28, N'3', 6)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (29, N'2', 6)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (30, N'1', 6)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (31, N'5', 7)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (32, N'4', 7)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (33, N'3', 7)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (34, N'2', 7)
INSERT [dbo].[Row] ([RowId], [RowName], [SectionId]) VALUES (35, N'1', 7)
SET IDENTITY_INSERT [dbo].[Row] OFF
SET IDENTITY_INSERT [dbo].[Seat] ON 

INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (1, N'1', CAST(30.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (2, N'2', CAST(30.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (3, N'3', CAST(30.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (4, N'4', CAST(30.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (5, N'5', CAST(30.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (6, N'1', CAST(30.00 AS Decimal(18, 2)), 6)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (7, N'2', CAST(30.00 AS Decimal(18, 2)), 6)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (8, N'3', CAST(30.00 AS Decimal(18, 2)), 6)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (9, N'4', CAST(30.00 AS Decimal(18, 2)), 6)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (10, N'5', CAST(30.00 AS Decimal(18, 2)), 6)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (11, N'1', CAST(30.00 AS Decimal(18, 2)), 11)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (12, N'2', CAST(30.00 AS Decimal(18, 2)), 11)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (13, N'3', CAST(30.00 AS Decimal(18, 2)), 11)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (14, N'4', CAST(30.00 AS Decimal(18, 2)), 11)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (15, N'5', CAST(30.00 AS Decimal(18, 2)), 11)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (16, N'1', CAST(30.00 AS Decimal(18, 2)), 16)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (17, N'2', CAST(30.00 AS Decimal(18, 2)), 16)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (18, N'3', CAST(30.00 AS Decimal(18, 2)), 16)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (19, N'4', CAST(30.00 AS Decimal(18, 2)), 16)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (20, N'5', CAST(30.00 AS Decimal(18, 2)), 16)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (21, N'1', CAST(30.00 AS Decimal(18, 2)), 21)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (22, N'2', CAST(30.00 AS Decimal(18, 2)), 21)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (23, N'3', CAST(30.00 AS Decimal(18, 2)), 21)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (24, N'4', CAST(30.00 AS Decimal(18, 2)), 21)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (25, N'5', CAST(30.00 AS Decimal(18, 2)), 21)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (26, N'1', CAST(30.00 AS Decimal(18, 2)), 26)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (27, N'2', CAST(30.00 AS Decimal(18, 2)), 26)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (28, N'3', CAST(30.00 AS Decimal(18, 2)), 26)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (29, N'4', CAST(30.00 AS Decimal(18, 2)), 26)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (30, N'5', CAST(30.00 AS Decimal(18, 2)), 26)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (31, N'1', CAST(30.00 AS Decimal(18, 2)), 31)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (32, N'2', CAST(30.00 AS Decimal(18, 2)), 31)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (33, N'3', CAST(30.00 AS Decimal(18, 2)), 31)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (34, N'4', CAST(30.00 AS Decimal(18, 2)), 31)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (35, N'5', CAST(30.00 AS Decimal(18, 2)), 31)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (36, N'1', CAST(45.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (37, N'2', CAST(45.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (38, N'3', CAST(45.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (39, N'4', CAST(45.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (40, N'5', CAST(45.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (41, N'1', CAST(45.00 AS Decimal(18, 2)), 7)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (42, N'2', CAST(45.00 AS Decimal(18, 2)), 7)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (43, N'3', CAST(45.00 AS Decimal(18, 2)), 7)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (44, N'4', CAST(45.00 AS Decimal(18, 2)), 7)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (45, N'5', CAST(45.00 AS Decimal(18, 2)), 7)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (46, N'1', CAST(45.00 AS Decimal(18, 2)), 12)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (47, N'2', CAST(45.00 AS Decimal(18, 2)), 12)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (48, N'3', CAST(45.00 AS Decimal(18, 2)), 12)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (49, N'4', CAST(45.00 AS Decimal(18, 2)), 12)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (50, N'5', CAST(45.00 AS Decimal(18, 2)), 12)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (51, N'1', CAST(45.00 AS Decimal(18, 2)), 17)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (52, N'2', CAST(45.00 AS Decimal(18, 2)), 17)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (53, N'3', CAST(45.00 AS Decimal(18, 2)), 17)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (54, N'4', CAST(45.00 AS Decimal(18, 2)), 17)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (55, N'5', CAST(45.00 AS Decimal(18, 2)), 17)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (56, N'1', CAST(45.00 AS Decimal(18, 2)), 22)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (57, N'2', CAST(45.00 AS Decimal(18, 2)), 22)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (58, N'3', CAST(45.00 AS Decimal(18, 2)), 22)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (59, N'4', CAST(45.00 AS Decimal(18, 2)), 22)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (60, N'5', CAST(45.00 AS Decimal(18, 2)), 22)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (61, N'1', CAST(45.00 AS Decimal(18, 2)), 27)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (62, N'2', CAST(45.00 AS Decimal(18, 2)), 27)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (63, N'3', CAST(45.00 AS Decimal(18, 2)), 27)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (64, N'4', CAST(45.00 AS Decimal(18, 2)), 27)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (65, N'5', CAST(45.00 AS Decimal(18, 2)), 27)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (66, N'1', CAST(45.00 AS Decimal(18, 2)), 32)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (67, N'2', CAST(45.00 AS Decimal(18, 2)), 32)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (68, N'3', CAST(45.00 AS Decimal(18, 2)), 32)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (69, N'4', CAST(45.00 AS Decimal(18, 2)), 32)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (70, N'5', CAST(45.00 AS Decimal(18, 2)), 32)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (71, N'1', CAST(60.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (72, N'2', CAST(60.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (73, N'3', CAST(60.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (74, N'4', CAST(60.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (75, N'5', CAST(60.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (76, N'1', CAST(60.00 AS Decimal(18, 2)), 8)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (77, N'2', CAST(60.00 AS Decimal(18, 2)), 8)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (78, N'3', CAST(60.00 AS Decimal(18, 2)), 8)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (79, N'4', CAST(60.00 AS Decimal(18, 2)), 8)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (80, N'5', CAST(60.00 AS Decimal(18, 2)), 8)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (81, N'1', CAST(60.00 AS Decimal(18, 2)), 13)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (82, N'2', CAST(60.00 AS Decimal(18, 2)), 13)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (83, N'3', CAST(60.00 AS Decimal(18, 2)), 13)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (84, N'4', CAST(60.00 AS Decimal(18, 2)), 13)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (85, N'5', CAST(60.00 AS Decimal(18, 2)), 13)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (86, N'1', CAST(60.00 AS Decimal(18, 2)), 18)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (87, N'2', CAST(60.00 AS Decimal(18, 2)), 18)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (88, N'3', CAST(60.00 AS Decimal(18, 2)), 18)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (89, N'4', CAST(60.00 AS Decimal(18, 2)), 18)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (90, N'5', CAST(60.00 AS Decimal(18, 2)), 18)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (91, N'1', CAST(60.00 AS Decimal(18, 2)), 23)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (92, N'2', CAST(60.00 AS Decimal(18, 2)), 23)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (93, N'3', CAST(60.00 AS Decimal(18, 2)), 23)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (94, N'4', CAST(60.00 AS Decimal(18, 2)), 23)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (95, N'5', CAST(60.00 AS Decimal(18, 2)), 23)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (96, N'1', CAST(60.00 AS Decimal(18, 2)), 28)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (97, N'2', CAST(60.00 AS Decimal(18, 2)), 28)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (98, N'3', CAST(60.00 AS Decimal(18, 2)), 28)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (99, N'4', CAST(60.00 AS Decimal(18, 2)), 28)
GO
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (100, N'5', CAST(60.00 AS Decimal(18, 2)), 28)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (101, N'1', CAST(60.00 AS Decimal(18, 2)), 33)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (102, N'2', CAST(60.00 AS Decimal(18, 2)), 33)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (103, N'3', CAST(60.00 AS Decimal(18, 2)), 33)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (104, N'4', CAST(60.00 AS Decimal(18, 2)), 33)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (105, N'5', CAST(60.00 AS Decimal(18, 2)), 33)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (106, N'1', CAST(75.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (107, N'2', CAST(75.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (108, N'3', CAST(75.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (109, N'4', CAST(75.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (110, N'5', CAST(75.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (111, N'1', CAST(75.00 AS Decimal(18, 2)), 9)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (112, N'2', CAST(75.00 AS Decimal(18, 2)), 9)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (113, N'3', CAST(75.00 AS Decimal(18, 2)), 9)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (114, N'4', CAST(75.00 AS Decimal(18, 2)), 9)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (115, N'5', CAST(75.00 AS Decimal(18, 2)), 9)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (116, N'1', CAST(75.00 AS Decimal(18, 2)), 14)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (117, N'2', CAST(75.00 AS Decimal(18, 2)), 14)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (118, N'3', CAST(75.00 AS Decimal(18, 2)), 14)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (119, N'4', CAST(75.00 AS Decimal(18, 2)), 14)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (120, N'5', CAST(75.00 AS Decimal(18, 2)), 14)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (121, N'1', CAST(75.00 AS Decimal(18, 2)), 19)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (122, N'2', CAST(75.00 AS Decimal(18, 2)), 19)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (123, N'3', CAST(75.00 AS Decimal(18, 2)), 19)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (124, N'4', CAST(75.00 AS Decimal(18, 2)), 19)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (125, N'5', CAST(75.00 AS Decimal(18, 2)), 19)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (126, N'1', CAST(75.00 AS Decimal(18, 2)), 24)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (127, N'2', CAST(75.00 AS Decimal(18, 2)), 24)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (128, N'3', CAST(75.00 AS Decimal(18, 2)), 24)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (129, N'4', CAST(75.00 AS Decimal(18, 2)), 24)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (130, N'5', CAST(75.00 AS Decimal(18, 2)), 24)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (131, N'1', CAST(75.00 AS Decimal(18, 2)), 29)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (132, N'2', CAST(75.00 AS Decimal(18, 2)), 29)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (133, N'3', CAST(75.00 AS Decimal(18, 2)), 29)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (134, N'4', CAST(75.00 AS Decimal(18, 2)), 29)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (135, N'5', CAST(75.00 AS Decimal(18, 2)), 29)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (136, N'1', CAST(75.00 AS Decimal(18, 2)), 34)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (137, N'2', CAST(75.00 AS Decimal(18, 2)), 34)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (138, N'3', CAST(75.00 AS Decimal(18, 2)), 34)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (139, N'4', CAST(75.00 AS Decimal(18, 2)), 34)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (140, N'5', CAST(75.00 AS Decimal(18, 2)), 34)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (141, N'1', CAST(90.00 AS Decimal(18, 2)), 5)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (142, N'2', CAST(90.00 AS Decimal(18, 2)), 5)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (143, N'3', CAST(90.00 AS Decimal(18, 2)), 5)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (144, N'4', CAST(90.00 AS Decimal(18, 2)), 5)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (145, N'5', CAST(90.00 AS Decimal(18, 2)), 5)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (146, N'1', CAST(90.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (147, N'2', CAST(90.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (148, N'3', CAST(90.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (149, N'4', CAST(90.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (150, N'5', CAST(90.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (151, N'1', CAST(90.00 AS Decimal(18, 2)), 15)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (152, N'2', CAST(90.00 AS Decimal(18, 2)), 15)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (153, N'3', CAST(90.00 AS Decimal(18, 2)), 15)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (154, N'4', CAST(90.00 AS Decimal(18, 2)), 15)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (155, N'5', CAST(90.00 AS Decimal(18, 2)), 15)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (156, N'1', CAST(90.00 AS Decimal(18, 2)), 20)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (157, N'2', CAST(90.00 AS Decimal(18, 2)), 20)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (158, N'3', CAST(90.00 AS Decimal(18, 2)), 20)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (159, N'4', CAST(90.00 AS Decimal(18, 2)), 20)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (160, N'5', CAST(90.00 AS Decimal(18, 2)), 20)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (161, N'1', CAST(90.00 AS Decimal(18, 2)), 25)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (162, N'2', CAST(90.00 AS Decimal(18, 2)), 25)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (163, N'3', CAST(90.00 AS Decimal(18, 2)), 25)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (164, N'4', CAST(90.00 AS Decimal(18, 2)), 25)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (165, N'5', CAST(90.00 AS Decimal(18, 2)), 25)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (166, N'1', CAST(90.00 AS Decimal(18, 2)), 30)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (167, N'2', CAST(90.00 AS Decimal(18, 2)), 30)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (168, N'3', CAST(90.00 AS Decimal(18, 2)), 30)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (169, N'4', CAST(90.00 AS Decimal(18, 2)), 30)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (170, N'5', CAST(90.00 AS Decimal(18, 2)), 30)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (171, N'1', CAST(90.00 AS Decimal(18, 2)), 35)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (172, N'2', CAST(90.00 AS Decimal(18, 2)), 35)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (173, N'3', CAST(90.00 AS Decimal(18, 2)), 35)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (174, N'4', CAST(90.00 AS Decimal(18, 2)), 35)
INSERT [dbo].[Seat] ([SeatId], [SeatName], [Price], [RowId]) VALUES (175, N'5', CAST(90.00 AS Decimal(18, 2)), 35)
SET IDENTITY_INSERT [dbo].[Seat] OFF
SET IDENTITY_INSERT [dbo].[Section] ON 

INSERT [dbo].[Section] ([SectionId], [SectionName], [VenueId]) VALUES (1, N'100', 1)
INSERT [dbo].[Section] ([SectionId], [SectionName], [VenueId]) VALUES (2, N'101', 1)
INSERT [dbo].[Section] ([SectionId], [SectionName], [VenueId]) VALUES (3, N'102', 1)
INSERT [dbo].[Section] ([SectionId], [SectionName], [VenueId]) VALUES (4, N'103', 1)
INSERT [dbo].[Section] ([SectionId], [SectionName], [VenueId]) VALUES (5, N'104', 1)
INSERT [dbo].[Section] ([SectionId], [SectionName], [VenueId]) VALUES (6, N'105', 1)
INSERT [dbo].[Section] ([SectionId], [SectionName], [VenueId]) VALUES (7, N'106', 1)
SET IDENTITY_INSERT [dbo].[Section] OFF
SET IDENTITY_INSERT [dbo].[TicketPurchase] ON 

INSERT [dbo].[TicketPurchase] ([TicketPurchaseId], [PaymentMethod], [PaymentAmount], [ConfirmationCode]) VALUES (1, N'VISA', CAST(250.00 AS Decimal(18, 2)), N'134659')
INSERT [dbo].[TicketPurchase] ([TicketPurchaseId], [PaymentMethod], [PaymentAmount], [ConfirmationCode]) VALUES (2, N'AMEX', CAST(100.00 AS Decimal(18, 2)), N'315656')
INSERT [dbo].[TicketPurchase] ([TicketPurchaseId], [PaymentMethod], [PaymentAmount], [ConfirmationCode]) VALUES (3, N'AMEX', CAST(500.00 AS Decimal(18, 2)), N'916343')
INSERT [dbo].[TicketPurchase] ([TicketPurchaseId], [PaymentMethod], [PaymentAmount], [ConfirmationCode]) VALUES (4, N'MC', CAST(150.00 AS Decimal(18, 2)), N'164395')
INSERT [dbo].[TicketPurchase] ([TicketPurchaseId], [PaymentMethod], [PaymentAmount], [ConfirmationCode]) VALUES (5, N'VISA', CAST(125.00 AS Decimal(18, 2)), N'156326')
INSERT [dbo].[TicketPurchase] ([TicketPurchaseId], [PaymentMethod], [PaymentAmount], [ConfirmationCode]) VALUES (6, N'VISA', CAST(1050.00 AS Decimal(18, 2)), N'646513')
INSERT [dbo].[TicketPurchase] ([TicketPurchaseId], [PaymentMethod], [PaymentAmount], [ConfirmationCode]) VALUES (7, N'AMEX', CAST(280.00 AS Decimal(18, 2)), N'984862')
INSERT [dbo].[TicketPurchase] ([TicketPurchaseId], [PaymentMethod], [PaymentAmount], [ConfirmationCode]) VALUES (8, N'AMEX', CAST(1700.00 AS Decimal(18, 2)), N'981662')
INSERT [dbo].[TicketPurchase] ([TicketPurchaseId], [PaymentMethod], [PaymentAmount], [ConfirmationCode]) VALUES (9, N'AMEX', CAST(435.00 AS Decimal(18, 2)), N'152613')
INSERT [dbo].[TicketPurchase] ([TicketPurchaseId], [PaymentMethod], [PaymentAmount], [ConfirmationCode]) VALUES (10, N'AMEX', CAST(330.00 AS Decimal(18, 2)), N'256326')
INSERT [dbo].[TicketPurchase] ([TicketPurchaseId], [PaymentMethod], [PaymentAmount], [ConfirmationCode]) VALUES (11, N'MC', CAST(495.00 AS Decimal(18, 2)), N'456165')
INSERT [dbo].[TicketPurchase] ([TicketPurchaseId], [PaymentMethod], [PaymentAmount], [ConfirmationCode]) VALUES (12, N'MC', CAST(690.00 AS Decimal(18, 2)), N'757579')
INSERT [dbo].[TicketPurchase] ([TicketPurchaseId], [PaymentMethod], [PaymentAmount], [ConfirmationCode]) VALUES (13, N'VISA', CAST(225.00 AS Decimal(18, 2)), N'436244')
INSERT [dbo].[TicketPurchase] ([TicketPurchaseId], [PaymentMethod], [PaymentAmount], [ConfirmationCode]) VALUES (14, N'VISA', CAST(210.00 AS Decimal(18, 2)), N'526242')
SET IDENTITY_INSERT [dbo].[TicketPurchase] OFF
SET IDENTITY_INSERT [dbo].[Venue] ON 

INSERT [dbo].[Venue] ([VenueId], [VenueName]) VALUES (1, N'Rogers Arena')
SET IDENTITY_INSERT [dbo].[Venue] OFF
/****** Object:  Index [IX_Event_VenueId]    Script Date: 2/18/2020 10:13:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_Event_VenueId] ON [dbo].[Event]
(
	[VenueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EventSeat_EventId]    Script Date: 2/18/2020 10:13:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_EventSeat_EventId] ON [dbo].[EventSeat]
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EventSeat_SeatId]    Script Date: 2/18/2020 10:13:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_EventSeat_SeatId] ON [dbo].[EventSeat]
(
	[SeatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EventSeat_TicketPurchaseId]    Script Date: 2/18/2020 10:13:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_EventSeat_TicketPurchaseId] ON [dbo].[EventSeat]
(
	[TicketPurchaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Row_SectionId]    Script Date: 2/18/2020 10:13:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_Row_SectionId] ON [dbo].[Row]
(
	[SectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Seat_RowId]    Script Date: 2/18/2020 10:13:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_Seat_RowId] ON [dbo].[Seat]
(
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Section_VenueId]    Script Date: 2/18/2020 10:13:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_Section_VenueId] ON [dbo].[Section]
(
	[VenueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Venue_VenueId] FOREIGN KEY([VenueId])
REFERENCES [dbo].[Venue] ([VenueId])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Venue_VenueId]
GO
ALTER TABLE [dbo].[EventSeat]  WITH CHECK ADD  CONSTRAINT [FK_EventSeat_Event_EventId] FOREIGN KEY([EventId])
REFERENCES [dbo].[Event] ([EventId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventSeat] CHECK CONSTRAINT [FK_EventSeat_Event_EventId]
GO
ALTER TABLE [dbo].[EventSeat]  WITH CHECK ADD  CONSTRAINT [FK_EventSeat_Seat_SeatId] FOREIGN KEY([SeatId])
REFERENCES [dbo].[Seat] ([SeatId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventSeat] CHECK CONSTRAINT [FK_EventSeat_Seat_SeatId]
GO
ALTER TABLE [dbo].[EventSeat]  WITH CHECK ADD  CONSTRAINT [FK_EventSeat_TicketPurchase_TicketPurchaseId] FOREIGN KEY([TicketPurchaseId])
REFERENCES [dbo].[TicketPurchase] ([TicketPurchaseId])
GO
ALTER TABLE [dbo].[EventSeat] CHECK CONSTRAINT [FK_EventSeat_TicketPurchase_TicketPurchaseId]
GO
ALTER TABLE [dbo].[Row]  WITH CHECK ADD  CONSTRAINT [FK_Row_Section_SectionId] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Section] ([SectionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Row] CHECK CONSTRAINT [FK_Row_Section_SectionId]
GO
ALTER TABLE [dbo].[Seat]  WITH CHECK ADD  CONSTRAINT [FK_Seat_Row_RowId] FOREIGN KEY([RowId])
REFERENCES [dbo].[Row] ([RowId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Seat] CHECK CONSTRAINT [FK_Seat_Row_RowId]
GO
ALTER TABLE [dbo].[Section]  WITH CHECK ADD  CONSTRAINT [FK_Section_Venue_VenueId] FOREIGN KEY([VenueId])
REFERENCES [dbo].[Venue] ([VenueId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Section] CHECK CONSTRAINT [FK_Section_Venue_VenueId]
GO
USE [master]
GO
ALTER DATABASE [TicketingDB] SET  READ_WRITE 
GO
