USE [master]
GO
/****** Object:  Database [QAShop1]    Script Date: 6/10/2021 8:25:33 PM ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 6/10/2021 8:25:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[IDfeedback] [int] IDENTITY(1,1) NOT NULL,
	[Mail] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[IDfeedback] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material1]    Script Date: 6/10/2021 8:25:33 PM ******/
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
/****** Object:  Table [dbo].[News]    Script Date: 6/10/2021 8:25:33 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 6/10/2021 8:25:33 PM ******/
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/10/2021 8:25:33 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 6/10/2021 8:25:33 PM ******/
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
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 6/10/2021 8:25:33 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 6/10/2021 8:25:33 PM ******/
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
/****** Object:  Table [dbo].[Size]    Script Date: 6/10/2021 8:25:33 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 6/10/2021 8:25:33 PM ******/
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
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([IDfeedback], [Mail], [Name], [Description]) VALUES (1, N'huynhthikimtien123@gmail.com', N'Huỳnh Thị Kim Tiền', N'vui qua')
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Material1] ON 

INSERT [dbo].[Material1] ([ID_Material], [Name]) VALUES (1, N'Lụa')
INSERT [dbo].[Material1] ([ID_Material], [Name]) VALUES (2, N'Nhung')
INSERT [dbo].[Material1] ([ID_Material], [Name]) VALUES (3, N'Lụa')
INSERT [dbo].[Material1] ([ID_Material], [Name]) VALUES (4, N'Nhung')
INSERT [dbo].[Material1] ([ID_Material], [Name]) VALUES (5, N'Cotton')
INSERT [dbo].[Material1] ([ID_Material], [Name]) VALUES (6, N'Mango')
SET IDENTITY_INSERT [dbo].[Material1] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([NewID], [Title], [Description], [CreatedDate], [Image]) VALUES (2002, N'Sale 1 tặng 1', N'Rất đẹp', CAST(N'2021-05-31' AS Date), N'/Content/images/111.5.jpg')
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [UserID], [CreatedDate], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Status]) VALUES (1, 1004, NULL, N'MyTien', 5423441, N'123', N'', NULL)
INSERT [dbo].[Order] ([OrderID], [UserID], [CreatedDate], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Status]) VALUES (2002, 2003, CAST(N'2021-06-09' AS Date), N'Hu?nh Th? Kim Ti?n', 916909535, N'quan 9', N'huynhthikimtien123@gmail.com', NULL)
INSERT [dbo].[Order] ([OrderID], [UserID], [CreatedDate], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Status]) VALUES (2003, 2004, CAST(N'2021-06-10' AS Date), N'Hu?nh Th? Kim Ti?n', 916909535, N'quan 9', N'huynhthikimtien123@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([ID_OrderDetail], [OrderID], [ProductID], [Quantity], [Price], [Discount], [TotalPrice]) VALUES (1003, 2003, 2008, 1, 450, NULL, NULL)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Image], [Price], [TotalQuantity], [CreatedBy], [CreatedDate], [ID_Material], [IDSize]) VALUES (2004, 1, N'MIRA JUMP', N'Đầm ngắn cúp ngực,thun chun lưng,tay phồng,phần chân váy xòe 3 tầng,khóa kéo phía sau.', N'/Content/images/189325155_4333292683367619_2255653059550134943_n7345_200x250.jpg', 500, 20, N'KT', CAST(N'2021-02-02T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Image], [Price], [TotalQuantity], [CreatedBy], [CreatedDate], [ID_Material], [IDSize]) VALUES (2006, 2, N'KARA DRESS', N'Đầm form babydoll xoè, hai dây có tăng đơ điều chỉnh độ dài, phía sau có chi tiết cách điệu buộc nơ.', N'/Content/images/18800318943456105188025024836272787438130629n-803404_242x250.jpg', 320, 50, N'KT1', CAST(N'2021-02-02T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Image], [Price], [TotalQuantity], [CreatedBy], [CreatedDate], [ID_Material], [IDSize]) VALUES (2008, 1, N'OLIA DRESS', N'Đầm form midi, xẻ tà, cổ tròn, khoá kéo bên hông, có chi tiết xẻ V sau lưng.', N'/Content/images/184334634_4290237777673110_5204764120964162889_n6668_200x250.jpg', 450, 19, N'KT1', CAST(N'2021-02-06T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Image], [Price], [TotalQuantity], [CreatedBy], [CreatedDate], [ID_Material], [IDSize]) VALUES (2010, 2, N'NALIA DRESS', N'Đầm form Babydoll, có viền bèo, tay phồng thắt nơ, cổ chữ V.', N'/Content/images/176325558_4234563593240529_3078809699099260139_n2792_200x250.jpg', 460, 30, N'KT1', CAST(N'2021-02-02T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Image], [Price], [TotalQuantity], [CreatedBy], [CreatedDate], [ID_Material], [IDSize]) VALUES (2012, 2, N'KELLY DRESS', N'Đầm ôm mini cổ tròn, tay bồng ở vai, phần thân dưới có nhún và phần bèo. Có lớp lót, dây kéo phía sau.', N'/Content/images/178103745_4243614009002154_6794289097108408667_n9190_200x250.jpg', 550, 1, N'KT', CAST(N'2021-02-03T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Image], [Price], [TotalQuantity], [CreatedBy], [CreatedDate], [ID_Material], [IDSize]) VALUES (2014, 4, N'ALLURIN TEE', N'Áo thun tay ngắn, có hình thêu, cổ tròn', N'/Content/images/173214249_4208952009135021_7028991529901844009_n9960_200x250.jpg', 200, 10, N'KT', CAST(N'2021-02-08T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Image], [Price], [TotalQuantity], [CreatedBy], [CreatedDate], [ID_Material], [IDSize]) VALUES (2018, 4, N'PIE TOP', N'Áo form ngang eo: cổ tròn rộng vừa, có phần trang trí rút dây một bên.', N'/Content/images/182248634_4270269326336622_2078743900245572677_n0659_201x250.jpg', 160, 4, N'KT1', CAST(N'2021-02-08T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Image], [Price], [TotalQuantity], [CreatedBy], [CreatedDate], [ID_Material], [IDSize]) VALUES (2019, 4, N'VOGUE TEE', N'Áo form vừa người, cổ tròn, tay ngắn', N'/Content/images/18417282542878898879078997359412596078640961n-42266533_200x250.jpg', 160, 23, N'KT1', CAST(N'2021-02-02T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Image], [Price], [TotalQuantity], [CreatedBy], [CreatedDate], [ID_Material], [IDSize]) VALUES (2020, 4, N'BITCH BADAS TEE', N'Áo thun cổ tròn, có thêu hình Minion ở ngực trái', N'/Content/images/182893673_4290642164299338_6101123314326918045_n0576_200x250.jpg', 220, 2, NULL, CAST(N'2021-02-06T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Image], [Price], [TotalQuantity], [CreatedBy], [CreatedDate], [ID_Material], [IDSize]) VALUES (2021, 3, N'LUTIA SKIRT', N'Váy ngắn , form A, họa tiết viền nổi, có dây kéo ', N'/Content/images/74458866_2838763229487246_7892634174614405120_o2163_250x250.jpg', 370, 0, N'KT1', CAST(N'2021-02-08T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Image], [Price], [TotalQuantity], [CreatedBy], [CreatedDate], [ID_Material], [IDSize]) VALUES (2022, 3, N'DENIM SKIRT', N'Quần short giả váy có 2 hàng nút bọc, form dáng A.', N'/Content/images/86457895_3027051193991781_3348841062171934720_o9716_210x250.jpg', 320, 5, N'KT', CAST(N'2021-02-06T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Image], [Price], [TotalQuantity], [CreatedBy], [CreatedDate], [ID_Material], [IDSize]) VALUES (2023, 3, N'GODY SKIRT', N'Chân váy ngắn, form A, vạt đắp chéo, lưng cao.', N'/Content/images/85220204_3027143873982513_3237763694544814080_o1104_250x250.jpg', 350, 1, N'KT1', CAST(N'2021-02-02T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Image], [Price], [TotalQuantity], [CreatedBy], [CreatedDate], [ID_Material], [IDSize]) VALUES (2024, 3, N'ELLEN SKIRT', N'Chân váy dáng bút chì, có rã 1 bên thân váy: xê tà, có đính nút giả. Có lót, dây kéo thân sau.', N'/Content/images/87019694_586932115493989_7106252630816456704_n3651_250x250.jpg', 420, 1, N'KT1', CAST(N'2021-02-02T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Image], [Price], [TotalQuantity], [CreatedBy], [CreatedDate], [ID_Material], [IDSize]) VALUES (2026, 1, N'FLORIS DRESS', N'đầm ngắn linen nút gỗ, dây bản to, có khoá kéo phía sau', N'/Content/images/185707984_4299509283412626_5827506655323841812_n0107_200x250.jpg', 440, 10, N'KT1', CAST(N'2021-02-08T00:00:00.000' AS DateTime), 2, 3)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([Id], [NameCategory]) VALUES (1, N'Đầm')
INSERT [dbo].[ProductCategory] ([Id], [NameCategory]) VALUES (2, N'Đầm công sở')
INSERT [dbo].[ProductCategory] ([Id], [NameCategory]) VALUES (3, N'Váy')
INSERT [dbo].[ProductCategory] ([Id], [NameCategory]) VALUES (4, N'Váy')
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
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Email], [PhoneNumber], [Address], [Province], [District], [ID_Role]) VALUES (1003, N'robert1', N'e10adc3949ba59abbe56e057f20f883e', N'huynhthien123@gmail.com', 916909535, N'Gò Công', 717, 71705, 3)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Email], [PhoneNumber], [Address], [Province], [District], [ID_Role]) VALUES (1004, N'robert2', N'e10adc3949ba59abbe56e057f20f883e', N'hmtien123@gmail.com', 916909535, N'Gò Công', 507, 50703, 3)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Email], [PhoneNumber], [Address], [Province], [District], [ID_Role]) VALUES (1005, N'thu13', N'e10adc3949ba59abbe56e057f20f883e', N'huynhthik]123@gmail.com', 916909535, N'Gò Công', NULL, NULL, 1)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Email], [PhoneNumber], [Address], [Province], [District], [ID_Role]) VALUES (1006, N'thu18', N'123456', N'mtien123@gmail.com', 916909535, N'Gò Công', NULL, NULL, 3)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Email], [PhoneNumber], [Address], [Province], [District], [ID_Role]) VALUES (2002, N'NgocLoan', N'e10adc3949ba59abbe56e057f20f883e', N'loankimtien123@gmail.com', 916909535, N'Gò Công', NULL, NULL, 2)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Email], [PhoneNumber], [Address], [Province], [District], [ID_Role]) VALUES (2003, N'Hu?nh Th? Kim Ti?n', NULL, N'huynhthikimtien123@gmail.com', 916909535, N'quan 9', NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Email], [PhoneNumber], [Address], [Province], [District], [ID_Role]) VALUES (2004, N'Hu?nh Th? Kim Ti?n', NULL, N'huynhthikimtien123@gmail.com', 916909535, N'quan 9', NULL, NULL, NULL)
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
