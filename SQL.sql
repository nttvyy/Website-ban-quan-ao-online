USE [master]
GO
/****** Object:  Database [QAShop]    Script Date: 5/12/2021 1:57:26 PM ******/
CREATE DATABASE [QAShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QAShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\QAShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QAShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\QAShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QAShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QAShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QAShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QAShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QAShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QAShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QAShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [QAShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QAShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QAShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QAShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QAShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QAShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QAShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QAShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QAShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QAShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QAShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QAShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QAShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QAShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QAShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QAShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QAShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QAShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QAShop] SET  MULTI_USER 
GO
ALTER DATABASE [QAShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QAShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QAShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QAShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QAShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QAShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QAShop] SET QUERY_STORE = OFF
GO
USE [QAShop]
GO
/****** Object:  Table [dbo].[Material1]    Script Date: 5/12/2021 1:57:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material1](
	[ID_Material] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Material1] PRIMARY KEY CLUSTERED 
(
	[ID_Material] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 5/12/2021 1:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[Description] [nvarchar](250) NULL,
	[CreatedDate] [date] NULL,
	[Image] [nvarchar](250) NULL,
 CONSTRAINT [PK_Newss] PRIMARY KEY CLUSTERED 
(
	[NewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 5/12/2021 1:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] NOT NULL,
	[UserID] [int] NULL,
	[CreatedDate] [date] NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipPhone] [int] NULL,
	[ShipAddress] [nvarchar](50) NULL,
	[ShipEmail] [nvarchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 5/12/2021 1:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ID_OrderDetail] [int] NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ID_OrderDetail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/12/2021 1:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] NOT NULL,
	[CategoryID] [int] NULL,
	[ProductName] [nvarchar](250) NULL,
	[Description] [nvarchar](250) NULL,
	[Image] [nvarchar](250) NULL,
	[Price] [float] NULL,
	[TotalQuantity] [int] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[ID_Material] [int] NULL,
	[IDSize] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 5/12/2021 1:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[Id] [int] NOT NULL,
	[NameCategory] [nvarchar](250) NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 5/12/2021 1:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[IDSize] [int] NOT NULL,
	[Name Size] [nvarchar](50) NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[IDSize] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/12/2021 1:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](32) NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [int] NULL,
	[Address] [nvarchar](50) NULL,
	[Province] [int] NULL,
	[District] [int] NULL,
	[Role] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Material1] ([ID_Material], [Name]) VALUES (1, N'Lụa')
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([NewID], [Title], [Description], [CreatedDate], [Image]) VALUES (1, N'Sale 1 tặng 1', N'Rất đẹp', NULL, N'/Content/images/Screenshot (1).png')
INSERT [dbo].[News] ([NewID], [Title], [Description], [CreatedDate], [Image]) VALUES (2, N'Sale 1 tặng ', N'Rất đẹp', NULL, N'/Content/images/333.4.jpg')
SET IDENTITY_INSERT [dbo].[News] OFF
GO
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Image], [Price], [TotalQuantity], [CreatedBy], [CreatedDate], [ID_Material], [IDSize]) VALUES (1, 1, N'Váy đỏ', N'Rất đẹp', N'/Content/images/Screenshot (149).png', 500000, 10, N'KT', NULL, 1, 2)
GO
INSERT [dbo].[ProductCategory] ([Id], [NameCategory]) VALUES (1, N'Váy')
GO
INSERT [dbo].[Size] ([IDSize], [Name Size]) VALUES (1, NULL)
INSERT [dbo].[Size] ([IDSize], [Name Size]) VALUES (2, N'S')
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Material1] FOREIGN KEY([ID_Material])
REFERENCES [dbo].[Material1] ([ID_Material])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Material1]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ProductCategory] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Size] FOREIGN KEY([IDSize])
REFERENCES [dbo].[Size] ([IDSize])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Size]
GO
USE [master]
GO
ALTER DATABASE [QAShop] SET  READ_WRITE 
GO
