USE [master]
GO
/****** Object:  Database [PizzaChain]    Script Date: 5/8/2019 9:25:52 AM ******/
CREATE DATABASE [PizzaChain]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PizzaChain', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PizzaChain.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PizzaChain_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PizzaChain_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PizzaChain] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PizzaChain].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PizzaChain] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PizzaChain] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PizzaChain] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PizzaChain] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PizzaChain] SET ARITHABORT OFF 
GO
ALTER DATABASE [PizzaChain] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PizzaChain] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PizzaChain] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PizzaChain] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PizzaChain] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PizzaChain] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PizzaChain] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PizzaChain] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PizzaChain] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PizzaChain] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PizzaChain] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PizzaChain] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PizzaChain] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PizzaChain] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PizzaChain] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PizzaChain] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PizzaChain] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PizzaChain] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PizzaChain] SET  MULTI_USER 
GO
ALTER DATABASE [PizzaChain] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PizzaChain] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PizzaChain] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PizzaChain] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PizzaChain] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PizzaChain]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 5/8/2019 9:25:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer](
	[PersonID] [int] NOT NULL,
	[Title] [varchar](50) NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Suffix] [varchar](50) NULL,
	[DateOfBirth] [date] NOT NULL,
	[EmailAddress] [varchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.customer] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer_address]    Script Date: 5/8/2019 9:25:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_address](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[AddressLine1] [nvarchar](60) NOT NULL,
	[AddressLine2] [nvarchar](60) NULL,
	[City] [nvarchar](30) NOT NULL,
	[State] [nvarchar](2) NOT NULL,
	[ZipCode] [nvarchar](10) NOT NULL,
	[AddressTypeID] [int] NOT NULL,
 CONSTRAINT [PK_address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[customer_phone]    Script Date: 5/8/2019 9:25:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_phone](
	[PhoneID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
	[PhoneNumber] [nvarchar](25) NOT NULL,
	[PhoneType] [int] NOT NULL,
 CONSTRAINT [PK_customer_phone] PRIMARY KEY CLUSTERED 
(
	[PhoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[inventory]    Script Date: 5/8/2019 9:25:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventory](
	[ItemID] [int] NOT NULL,
	[ItemDescription] [nvarchar](50) NULL,
	[InventoryNumber] [int] NOT NULL,
	[ItemType] [int] NOT NULL,
	[WarehouseID] [int] NOT NULL,
 CONSTRAINT [PK_inventory] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LU_AddressType]    Script Date: 5/8/2019 9:25:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_AddressType](
	[AddressTypeID] [int] NOT NULL,
	[AddresType] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_LU_AddressType] PRIMARY KEY CLUSTERED 
(
	[AddressTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LU_ItemType]    Script Date: 5/8/2019 9:25:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_ItemType](
	[ItemID] [int] NOT NULL,
	[Item] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LU_ItemID] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LU_OrderType]    Script Date: 5/8/2019 9:25:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_OrderType](
	[OrderTypeID] [int] NOT NULL,
	[OrderType] [nvarchar](20) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LU_PhoneType]    Script Date: 5/8/2019 9:25:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_PhoneType](
	[PhoneTypeID] [int] NOT NULL,
	[PhoneType] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_LU_PhoneType] PRIMARY KEY CLUSTERED 
(
	[PhoneTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orders]    Script Date: 5/8/2019 9:25:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[orderID] [int] NOT NULL,
	[OrderTypeID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[customer_address]  WITH CHECK ADD  CONSTRAINT [FK_customer_address_customer] FOREIGN KEY([PersonID])
REFERENCES [dbo].[customer] ([PersonID])
GO
ALTER TABLE [dbo].[customer_address] CHECK CONSTRAINT [FK_customer_address_customer]
GO
ALTER TABLE [dbo].[customer_phone]  WITH CHECK ADD  CONSTRAINT [FK_customer_phone_customer] FOREIGN KEY([PersonID])
REFERENCES [dbo].[customer] ([PersonID])
GO
ALTER TABLE [dbo].[customer_phone] CHECK CONSTRAINT [FK_customer_phone_customer]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_customer] FOREIGN KEY([PersonID])
REFERENCES [dbo].[customer] ([PersonID])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_customer]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_inventory] FOREIGN KEY([ItemID])
REFERENCES [dbo].[inventory] ([ItemID])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_inventory]
GO
/****** Object:  StoredProcedure [dbo].[sp_customer_address_update]    Script Date: 5/8/2019 9:25:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_customer_address_update]
 @AddressID int, @PersonID int, @AddressLine1 nvarchar(60), @AddressLine2 nvarchar(60), 
 @City nvarchar(30), @State nvarchar(2), @ZipCode nvarchar(10), @AddressTypeID int

AS
BEGIN
UPDATE customer_address SET
PersonID = @PersonID
,AddressLine1 = @AddressLine1
,AddressLine2 = @AddressLine2
,City = @City
,State = @State
,ZipCode = @ZipCode
,AddressTypeID = @AddressTypeID


END


GO
/****** Object:  StoredProcedure [dbo].[sp_customer_phone_update]    Script Date: 5/8/2019 9:25:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_customer_phone_update]
	@PhoneID int, @PersonID int, @PhoneNumber nvarchar(25), @PhoneType int
AS
BEGIN
	UPDATE customer_phone SET 
	phoneID = @PhoneID
	,PersonID = @PersonID
	,PhoneNumber = @PhoneNumber
	,PhoneType = @PhoneType
END
GO
/****** Object:  StoredProcedure [dbo].[sp_customer_update]    Script Date: 5/8/2019 9:25:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_customer_update]
	@PersonID int, @Title varchar(50), @FirstName varchar(50), @LastName varchar(50),
	@Suffix varchar(50), @DateOfBirth date, @EmailAddress varchar(50)
AS
BEGIN
	UPDATE customer SET Title = @Title
	,FirstName = @FirstName
	,LastName = @LastName
	,Suffix = @Suffix
	,DateOfBirth = DateOfBirth
	,EmailAddress = @EmailAddress
	,PersonID = @PersonID
END


GO
/****** Object:  StoredProcedure [dbo].[sp_inventory]    Script Date: 5/8/2019 9:25:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_inventory]
	@ItemID int, @ItemDescription nvarchar(50), @InventoryNumber int, @ItemType int
AS
BEGIN
	UPDATE inventory SET 
	ItemID = @ItemID
	,ItemDescription = @ItemDescription
	,InventoryNumber = @InventoryNumber
	,ItemType = @ItemType
END
GO
/****** Object:  StoredProcedure [dbo].[sp_order]    Script Date: 5/8/2019 9:25:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_order]
	@OrderID int, @OrderTypeID int, @ItemID int, @PersonID int
AS
BEGIN
	UPDATE orders SET 
	OrderID = @OrderID
	,OrderTypeID = @OrderTypeID
	,ItemID = @ItemID
	,PersonID = @PersonID
END
GO
USE [master]
GO
ALTER DATABASE [PizzaChain] SET  READ_WRITE 
GO
