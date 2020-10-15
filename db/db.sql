USE [master]
GO
/****** Object:  Database [wsrtrainning]    Script Date: 15.10.2020 13:22:22 ******/
CREATE DATABASE [wsrtrainning]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'wsrtrainning', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXP14\MSSQL\DATA\wsrtrainning.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'wsrtrainning_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXP14\MSSQL\DATA\wsrtrainning_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [wsrtrainning] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [wsrtrainning].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [wsrtrainning] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [wsrtrainning] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [wsrtrainning] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [wsrtrainning] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [wsrtrainning] SET ARITHABORT OFF 
GO
ALTER DATABASE [wsrtrainning] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [wsrtrainning] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [wsrtrainning] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [wsrtrainning] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [wsrtrainning] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [wsrtrainning] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [wsrtrainning] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [wsrtrainning] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [wsrtrainning] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [wsrtrainning] SET  DISABLE_BROKER 
GO
ALTER DATABASE [wsrtrainning] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [wsrtrainning] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [wsrtrainning] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [wsrtrainning] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [wsrtrainning] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [wsrtrainning] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [wsrtrainning] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [wsrtrainning] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [wsrtrainning] SET  MULTI_USER 
GO
ALTER DATABASE [wsrtrainning] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [wsrtrainning] SET DB_CHAINING OFF 
GO
ALTER DATABASE [wsrtrainning] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [wsrtrainning] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [wsrtrainning] SET DELAYED_DURABILITY = DISABLED 
GO
USE [wsrtrainning]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 15.10.2020 13:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Code] [nchar](2) NOT NULL,
	[Name] [nchar](10) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 15.10.2020 13:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[id] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[CountOfStars] [int] NULL,
	[CountryCode] [nchar](2) NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HotelComment]    Script Date: 15.10.2020 13:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelComment](
	[id] [int] NOT NULL,
	[Hotelid] [int] NULL,
	[Test] [nvarchar](max) NULL,
	[Author] [nvarchar](100) NULL,
	[CreationDate] [datetime] NULL,
 CONSTRAINT [PK_HotelComment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HotelImage]    Script Date: 15.10.2020 13:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HotelImage](
	[id] [int] NOT NULL,
	[Hotelid] [int] NULL,
	[ImageSource] [varbinary](max) NULL,
 CONSTRAINT [PK_HotelImage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HotelOfTour]    Script Date: 15.10.2020 13:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelOfTour](
	[HotelId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_HotelOfTour] PRIMARY KEY CLUSTERED 
(
	[HotelId] ASC,
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tour]    Script Date: 15.10.2020 13:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tour](
	[id] [int] NOT NULL,
	[TicketCount] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[ImagePreview] [varbinary](max) NULL,
	[Price] [money] NULL,
	[IsActual] [bit] NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Type]    Script Date: 15.10.2020 13:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[id] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Descroption] [nvarchar](max) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TypeOfTour]    Script Date: 15.10.2020 13:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfTour](
	[TourID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
 CONSTRAINT [PK_TypeOfTour] PRIMARY KEY CLUSTERED 
(
	[TourID] ASC,
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([Code])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Country]
GO
ALTER TABLE [dbo].[HotelComment]  WITH CHECK ADD  CONSTRAINT [FK_HotelComment_Hotel] FOREIGN KEY([Hotelid])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelComment] CHECK CONSTRAINT [FK_HotelComment_Hotel]
GO
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD  CONSTRAINT [FK_HotelImage_Hotel] FOREIGN KEY([Hotelid])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelImage] CHECK CONSTRAINT [FK_HotelImage_Hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_Hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_Type] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Type] ([id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_Type]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Tour] FOREIGN KEY([TourID])
REFERENCES [dbo].[Tour] ([id])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Tour]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Type] FOREIGN KEY([TypeID])
REFERENCES [dbo].[Type] ([id])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Type]
GO
USE [master]
GO
ALTER DATABASE [wsrtrainning] SET  READ_WRITE 
GO
