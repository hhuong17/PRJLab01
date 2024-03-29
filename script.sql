USE [master]
GO
/****** Object:  Database [lab01]    Script Date: 10/10/2023 5:47:13 PM ******/
CREATE DATABASE [lab01]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Lab01', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Lab01.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Lab01_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Lab01_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [lab01] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [lab01].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [lab01] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [lab01] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [lab01] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [lab01] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [lab01] SET ARITHABORT OFF 
GO
ALTER DATABASE [lab01] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [lab01] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [lab01] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [lab01] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [lab01] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [lab01] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [lab01] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [lab01] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [lab01] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [lab01] SET  DISABLE_BROKER 
GO
ALTER DATABASE [lab01] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [lab01] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [lab01] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [lab01] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [lab01] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [lab01] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [lab01] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [lab01] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [lab01] SET  MULTI_USER 
GO
ALTER DATABASE [lab01] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [lab01] SET DB_CHAINING OFF 
GO
ALTER DATABASE [lab01] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [lab01] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [lab01] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [lab01] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [lab01] SET QUERY_STORE = ON
GO
ALTER DATABASE [lab01] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [lab01]
GO
/****** Object:  UserDefinedFunction [dbo].[MD5]    Script Date: 10/10/2023 5:47:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[MD5](@input VARCHAR(MAX))
RETURNS VARCHAR(32)
AS
BEGIN
    DECLARE @result VARCHAR(32)
    SET @result = CONVERT(VARCHAR(32), HASHBYTES('MD5', @input), 2)
    RETURN @result
END
GO
/****** Object:  Table [dbo].[account]    Script Date: 10/10/2023 5:47:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](32) NOT NULL,
	[fullname] [varchar](100) NOT NULL,
	[gender] [varchar](50) NOT NULL,
	[birthday] [date] NOT NULL,
	[department] [varchar](100) NOT NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[account] ([username], [password], [fullname], [gender], [birthday], [department]) VALUES (N'ntb', N'ec3f6f85da61f967351dea7821020a30', N'Nguyen Thi B', N'Female', CAST(N'2003-05-05' AS Date), N'Sale')
INSERT [dbo].[account] ([username], [password], [fullname], [gender], [birthday], [department]) VALUES (N'nthh', N'f9a23fd93dae223dad21ae71e7f76226', N'Nguyen Thi Huynh Huong', N'Female', CAST(N'2003-10-17' AS Date), N'Sale')
INSERT [dbo].[account] ([username], [password], [fullname], [gender], [birthday], [department]) VALUES (N'ntl', N'74c4fef95341388f4196db0ef5799676', N'Nguyen Thi Lun', N'Female', CAST(N'2003-05-05' AS Date), N'Tester')
INSERT [dbo].[account] ([username], [password], [fullname], [gender], [birthday], [department]) VALUES (N'nva', N'0e7517141fb53f21ee439b355b5a1d0a', N'Nguyen Van A', N'Male', CAST(N'2003-05-01' AS Date), N'Sale')
INSERT [dbo].[account] ([username], [password], [fullname], [gender], [birthday], [department]) VALUES (N'nvt', N'd45d285d972ea48bf364111e50537be6', N'Nguyen Van Teo', N'Male', CAST(N'2003-01-01' AS Date), N'Coder')
INSERT [dbo].[account] ([username], [password], [fullname], [gender], [birthday], [department]) VALUES (N'user1', N'7C6A180B36896A0A8C02787EEAFB0E4C', N'John Doe', N'Male', CAST(N'1990-01-01' AS Date), N'IT')
INSERT [dbo].[account] ([username], [password], [fullname], [gender], [birthday], [department]) VALUES (N'user2', N'6CB75F652A9B52798EB6CF2201057C73', N'Jane Smith', N'Female', CAST(N'1995-02-15' AS Date), N'HR')
INSERT [dbo].[account] ([username], [password], [fullname], [gender], [birthday], [department]) VALUES (N'user3', N'819B0643D6B89DC9B579FDFC9094F28E', N'Mike Johnson', N'Male', CAST(N'1985-05-10' AS Date), N'Finance')
INSERT [dbo].[account] ([username], [password], [fullname], [gender], [birthday], [department]) VALUES (N'user4', N'34CC93ECE0BA9E3F6F235D4AF979B16C', N'Sarah Williams', N'Female', CAST(N'1992-09-20' AS Date), N'Sales')
INSERT [dbo].[account] ([username], [password], [fullname], [gender], [birthday], [department]) VALUES (N'user5', N'DB0EDD04AAAC4506F7EDAB03AC855D56', N'David Lee', N'Male', CAST(N'1988-04-05' AS Date), N'Marketing')
GO
USE [master]
GO
ALTER DATABASE [lab01] SET  READ_WRITE 
GO
