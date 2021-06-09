USE [QAShop1]
GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_Size]
GO
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_ProductCategory]
GO
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_Material1]
GO
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_User]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/2/2021 11:13:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
DROP TABLE [dbo].[User]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 6/2/2021 11:13:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Size]') AND type in (N'U'))
DROP TABLE [dbo].[Size]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/2/2021 11:13:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Role]') AND type in (N'U'))
DROP TABLE [dbo].[Role]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 6/2/2021 11:13:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductCategory]') AND type in (N'U'))
DROP TABLE [dbo].[ProductCategory]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/2/2021 11:13:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
DROP TABLE [dbo].[Product]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/2/2021 11:13:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetail]') AND type in (N'U'))
DROP TABLE [dbo].[OrderDetail]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/2/2021 11:13:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order]') AND type in (N'U'))
DROP TABLE [dbo].[Order]
GO
/****** Object:  Table [dbo].[News]    Script Date: 6/2/2021 11:13:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[News]') AND type in (N'U'))
DROP TABLE [dbo].[News]
GO
/****** Object:  Table [dbo].[Material1]    Script Date: 6/2/2021 11:13:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Material1]') AND type in (N'U'))
DROP TABLE [dbo].[Material1]
GO
USE [master]
GO
/****** Object:  Database [QAShop1]    Script Date: 6/2/2021 11:13:01 PM ******/
DROP DATABASE [QAShop1]
GO
/****** Object:  Database [QAShop1]    Script Date: 6/2/2021 11:13:02 PM ******/
CREATE DATABASE [QAShop1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QAShop1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\QAShop1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QAShop1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\QAShop1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QAShop1] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QAShop1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QAShop1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QAShop1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QAShop1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QAShop1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QAShop1] SET ARITHABORT OFF 
GO
ALTER DATABASE [QAShop1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QAShop1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QAShop1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QAShop1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QAShop1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QAShop1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QAShop1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QAShop1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QAShop1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QAShop1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QAShop1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QAShop1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QAShop1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QAShop1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QAShop1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QAShop1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QAShop1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QAShop1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QAShop1] SET  MULTI_USER 
GO
ALTER DATABASE [QAShop1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QAShop1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QAShop1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QAShop1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QAShop1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QAShop1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QAShop1] SET QUERY_STORE = OFF
GO
USE [QAShop1]
GO
/****** Object:  Table [dbo].[Material1]    Script Date: 6/2/2021 11:13:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material1](
	[ID_Material] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Material1] PRIMARY KEY CLUSTERED 
(
	[ID_Material] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 6/2/2021 11:13:03 PM ******/
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
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/2/2021 11:13:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/2/2021 11:13:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ID_OrderDetail] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
	[Discount] [int] NULL,
	[TotalPrice] [float] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ID_OrderDetail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/2/2021 11:13:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 6/2/2021 11:13:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameCategory] [nvarchar](250) NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/2/2021 11:13:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID_Role] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID_Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 6/2/2021 11:13:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[IDSize] [int] IDENTITY(1,1) NOT NULL,
	[NameSize] [nvarchar](50) NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[IDSize] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/2/2021 11:13:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](32) NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [int] NULL,
	[Address] [nvarchar](50) NULL,
	[Province] [int] NULL,
	[District] [int] NULL,
	[ID_Role] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Material1] ON 

INSERT [dbo].[Material1] ([ID_Material], [Name]) VALUES (1, N'Lụa')
INSERT [dbo].[Material1] ([ID_Material], [Name]) VALUES (2, N'Nhung')
SET IDENTITY_INSERT [dbo].[Material1] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([NewID], [Title], [Description], [CreatedDate], [Image]) VALUES (1, N'Sale 1 tặng 1', N'Rất đẹp', NULL, N'/Content/images/giayđỏ.jpg')
INSERT [dbo].[News] ([NewID], [Title], [Description], [CreatedDate], [Image]) VALUES (1002, N'Sale 1 tặng 2', N'Rất đẹp', CAST(N'2021-05-31' AS Date), N'/Content/images/doan.png')
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [UserID], [CreatedDate], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Status]) VALUES (1, 1004, NULL, N'MyTien', 5423441, N'123', N'', NULL)
INSERT [dbo].[Order] ([OrderID], [UserID], [CreatedDate], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Status]) VALUES (2, 1004, CAST(N'2021-05-31' AS Date), N'Huỳnh Thị Kim Tiền', 916909535, N'Gò Công', N'huynhthikimtien123@gmail.com', NULL)
INSERT [dbo].[Order] ([OrderID], [UserID], [CreatedDate], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Status]) VALUES (4, 1003, CAST(N'2021-05-03' AS Date), N'= Kim Tiền', 916909535, N'Gò Công', N'mtien123@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([ID_OrderDetail], [OrderID], [ProductID], [Quantity], [Price], [Discount], [TotalPrice]) VALUES (1, 1, 1, 1, 320000, NULL, 320000)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Image], [Price], [TotalQuantity], [CreatedBy], [CreatedDate], [ID_Material], [IDSize]) VALUES (1, 1, N'Váy đỏ', N'Rất đẹp', N'/Content/images/111.2.jpg', 320000, 10, N'Kim tiền', NULL, 1, 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Image], [Price], [TotalQuantity], [CreatedBy], [CreatedDate], [ID_Material], [IDSize]) VALUES (2, 1, N'Váy hồng', N'Rất đẹp', N'/Content/images/download.jpg', 100000, 15, N'KT', NULL, 2, 2)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Image], [Price], [TotalQuantity], [CreatedBy], [CreatedDate], [ID_Material], [IDSize]) VALUES (1003, 1, N'maxi trắng', N'Rất đẹp', NULL, 320000, 20, N'KT', CAST(N'2021-05-31T00:00:00.000' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([Id], [NameCategory]) VALUES (1, N'Váy')
INSERT [dbo].[ProductCategory] ([Id], [NameCategory]) VALUES (2, N'Quần')
INSERT [dbo].[ProductCategory] ([Id], [NameCategory]) VALUES (3, N'Maxi')
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID_Role], [RoleName]) VALUES (1, N'Manager')
INSERT [dbo].[Role] ([ID_Role], [RoleName]) VALUES (2, N'Staff')
INSERT [dbo].[Role] ([ID_Role], [RoleName]) VALUES (3, N'Customer')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([IDSize], [NameSize]) VALUES (1, N'S')
INSERT [dbo].[Size] ([IDSize], [NameSize]) VALUES (2, N'L')
INSERT [dbo].[Size] ([IDSize], [NameSize]) VALUES (3, N'M')
INSERT [dbo].[Size] ([IDSize], [NameSize]) VALUES (7, N'XS')
SET IDENTITY_INSERT [dbo].[Size] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserName], [Password], [Email], [PhoneNumber], [Address], [Province], [District], [ID_Role]) VALUES (1, N'KimTien', N'123456', N'huynhthikimtien@gmail.com', 92353355, N'81 Nguyễn Thị Min Khau', 1, 10, 1)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Email], [PhoneNumber], [Address], [Province], [District], [ID_Role]) VALUES (3, N'admin1', N'123456', N'huynhthikimtien123@gmail.com', 916909535, N'Gò Công', NULL, NULL, 1)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Email], [PhoneNumber], [Address], [Province], [District], [ID_Role]) VALUES (4, N'tien', N'123456', N'tien@gmail.com', 916909535, N'Gò Công', NULL, NULL, 2)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Email], [PhoneNumber], [Address], [Province], [District], [ID_Role]) VALUES (5, N'admin2', N'e10adc3949ba59abbe56e057f20f883e', N'huynhthikimtien123@gmail.com', 916909535, N'Gò Công', NULL, NULL, 2)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Email], [PhoneNumber], [Address], [Province], [District], [ID_Role]) VALUES (1002, N'robert', NULL, N'kiun123@gmail.com', 916909535, N'Gò Công', 701, 70121, NULL)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Email], [PhoneNumber], [Address], [Province], [District], [ID_Role]) VALUES (1003, N'robert1', N'e10adc3949ba59abbe56e057f20f883e', N'huynhthien123@gmail.com', 916909535, N'Gò Công', 717, 71705, 3)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Email], [PhoneNumber], [Address], [Province], [District], [ID_Role]) VALUES (1004, N'robert2', N'e10adc3949ba59abbe56e057f20f883e', N'hmtien123@gmail.com', 916909535, N'Gò Công', 507, 50703, 3)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Email], [PhoneNumber], [Address], [Province], [District], [ID_Role]) VALUES (1005, N'thu13', N'e10adc3949ba59abbe56e057f20f883e', N'huynhthik]123@gmail.com', 916909535, N'Gò Công', NULL, NULL, 1)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Email], [PhoneNumber], [Address], [Province], [District], [ID_Role]) VALUES (1006, N'thu18', N'123456', N'mtien123@gmail.com', 916909535, N'Gò Công', NULL, NULL, 3)
SET IDENTITY_INSERT [dbo].[User] OFF
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
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([ID_Role])
REFERENCES [dbo].[Role] ([ID_Role])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [QAShop1] SET  READ_WRITE 
GO
