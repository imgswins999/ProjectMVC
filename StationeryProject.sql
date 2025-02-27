USE [master]
GO
/****** Object:  Database [StationeryStore]    Script Date: 19/1/2568 14:31:57 ******/
CREATE DATABASE [StationeryStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StationeryStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\StationeryStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StationeryStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\StationeryStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [StationeryStore] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StationeryStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StationeryStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StationeryStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StationeryStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StationeryStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StationeryStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [StationeryStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StationeryStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StationeryStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StationeryStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StationeryStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StationeryStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StationeryStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StationeryStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StationeryStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StationeryStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StationeryStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StationeryStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StationeryStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StationeryStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StationeryStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StationeryStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StationeryStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StationeryStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StationeryStore] SET  MULTI_USER 
GO
ALTER DATABASE [StationeryStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StationeryStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StationeryStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StationeryStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StationeryStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StationeryStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [StationeryStore] SET QUERY_STORE = ON
GO
ALTER DATABASE [StationeryStore] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [StationeryStore]
GO
/****** Object:  Table [dbo].[Categories_tb]    Script Date: 19/1/2568 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories_tb](
	[categoryID] [int] NOT NULL,
	[categoryName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products_tb]    Script Date: 19/1/2568 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products_tb](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](max) NULL,
	[img] [nvarchar](max) NULL,
	[price] [decimal](18, 0) NULL,
	[stock] [int] NULL,
	[categoryID] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_tb]    Script Date: 19/1/2568 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_tb](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](max) NULL,
	[userEmail] [nvarchar](max) NULL,
	[userPassword] [nvarchar](50) NULL,
	[role] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Categories_tb] ([categoryID], [categoryName]) VALUES (1, N'เครื่องเขียนพื้นฐาน')
INSERT [dbo].[Categories_tb] ([categoryID], [categoryName]) VALUES (2, N'สมุดและกระดาษ')
INSERT [dbo].[Categories_tb] ([categoryID], [categoryName]) VALUES (3, N'อุปกรณ์การวาดและศิลปะ')
GO
SET IDENTITY_INSERT [dbo].[Products_tb] ON 

INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (2, N'Lamy Safari Fountain Pen', N'https://down-th.img.susercontent.com/file/2b2a7b5bacb797b5ae608ae252a43c3d.webp', CAST(201 AS Decimal(18, 0)), 12, 1)
INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (3, N'Uni-ball Signo 207', N'https://www.mp-uni.com/th/wp-content/uploads/sites/7/2023/10/Signo-UMN-207.jpg', CAST(51 AS Decimal(18, 0)), 15, 1)
INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (4, N'Pentel GraphGear 1000', N'https://pim-cdn0.ofm.co.th/products/large/1091898.jpg', CAST(320 AS Decimal(18, 0)), 7, 1)
INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (5, N'Faber-Castell 9000 Graphite Pencil', N'https://down-th.img.susercontent.com/file/th-11134207-7qul2-lji47vas0f8m4d.webp', CAST(350 AS Decimal(18, 0)), 10, 1)
INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (6, N'Rotring 600 Mechanical Pencil', N'https://down-th.img.susercontent.com/file/th-11134201-7qul8-lj2kafkmfc0h63@resize_w450_nl.webp', CAST(720 AS Decimal(18, 0)), 9, 1)
INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (7, N'Pentel Hi-Polymer Eraser', N'https://www.pentel.co.th/wp-content/uploads/2024/06/product-hipolymer-eraser.jpg', CAST(13 AS Decimal(18, 0)), 30, 1)
INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (8, N'Staedtler Mars Plastic', N'https://inwfile.com/s-fp/o0ze65.jpg', CAST(14 AS Decimal(18, 0)), 25, 1)
INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (9, N'Tombow Mono Eraser', N'https://th.bing.com/th/id/OIP.3J1oizqNl6RqQjwTKvIxVgHaHa?rs=1&pid=ImgDetMain', CAST(27 AS Decimal(18, 0)), 15, 1)
INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (10, N'Staedtler 12-Inch Ruler', N'https://m.media-amazon.com/images/I/61oW9BK9o0L._AC_SX466_.jpg', CAST(238 AS Decimal(18, 0)), 7, 1)
INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (11, N'Aluminum Metal Ruler by Mr. Pen', N'https://m.media-amazon.com/images/I/715oP-74ryL._AC_SX466_.jpg', CAST(150 AS Decimal(18, 0)), 14, 1)
INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (12, N'Westcott 6-Inch Flexible Metric Ruler, Clear', N'https://m.media-amazon.com/images/I/7191XYebArL._SX522_.jpg', CAST(105 AS Decimal(18, 0)), 9, 1)
INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (13, N'Classic Notebook
Hard Cover, Black', N'https://www.moleskine.com/dw/image/v2/BFRN_PRD/on/demandware.static/-/Sites-masterCatalog_Moleskine/default/dw2791c398/images/large-PDP/gtin_9788883701122_01.png?sh=1100', CAST(250 AS Decimal(18, 0)), 5, 2)
INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (14, N'Outlines', N'https://www.leuchtturm1917.us/media/productdetail/3072x3072/801411/outlines.jpg', CAST(175 AS Decimal(18, 0)), 7, 2)
INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (15, N'dot Pads', N'https://rhodiapads.com/images/dotpad.jpg', CAST(160 AS Decimal(18, 0)), 11, 2)
INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (16, N'กระดาษ Double A 80 แกรม ขนาด A4 (รีม)', N'https://delivery.doubleapaper.com/wp-content/uploads/2018/04/208140800312652-2.png', CAST(125 AS Decimal(18, 0)), 24, 2)
INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (17, N'Canson XL Series Mixed Media Pad', N'https://m.media-amazon.com/images/I/81jTVQ4w4tL._AC_SX679_.jpg', CAST(300 AS Decimal(18, 0)), 18, 2)
INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (18, N'Premium Color Copy', N'https://cdn.shopify.com/s/files/1/0685/1166/2378/products/102467_PremColorCopy_11_28_Ream_Right-RGB_d0db5a42-1f17-4c22-b687-0c84e2787d62.jpg?v=1679587744&width=700', CAST(460 AS Decimal(18, 0)), 8, 2)
INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (19, N'Inkjet Premium Glossy PVC Sticker 120 ไมครอน', N'https://down-th.img.susercontent.com/file/0ff41dd992073b6240f1eb1742f3328a', CAST(247 AS Decimal(18, 0)), 15, 2)
INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (20, N'Printable Vinyl', N'https://d62nvtdcnsm38.cloudfront.net/catalog/product/cache/87c823f533b95da1a3c20ea3384c2b46/v/i/vinyl-print_02-xl_9.jpg', CAST(237 AS Decimal(18, 0)), 12, 2)
INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (21, N'Angel Mark PRISMACOLOR', N'https://down-th.img.susercontent.com/file/ph-11134201-7qul3-lfcacx8r163jb3@resize_w450_nl.webp', CAST(1100 AS Decimal(18, 0)), 40, 3)
INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (22, N'Faber-Castell Polychromos Colored Pencils', N'https://down-th.img.susercontent.com/file/sg-11134201-7rdwr-lyf8rv76s6js46.webp', CAST(3420 AS Decimal(18, 0)), 16, 3)
INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (23, N'Winsor & Newton Cotman สีน้ำชุด 20 สี', N'https://down-th.img.susercontent.com/file/cn-11134207-7r98o-ltrt768oq7z1c2.webp', CAST(748 AS Decimal(18, 0)), 12, 3)
INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (24, N'Holbein Transparent Watercolor Set 60 Colors 5ml Tubes W411', N'https://wafuu.com/cdn/shop/files/holbein-transparent-watercolor-set-60-colors-5ml-tubes-w411-903463_1080x.jpg?v=1719389706', CAST(3570 AS Decimal(18, 0)), 10, 3)
INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (25, N'Basics Acrylic Paint Sets - Liquitex', N'https://www.liquitex.com/cdn/shop/files/78739_640x640_crop_center.jpg?v=1706548260', CAST(1366 AS Decimal(18, 0)), 14, 3)
INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (26, N'LIQUITEX HB Acrylic color สีอะคริลิค เกรดอาร์ตติส 59 มล.ซีรีย์.2A - S.3', N'https://down-th.img.susercontent.com/file/th-11134207-7qula-lh8hw2xujhf802.webp', CAST(336 AS Decimal(18, 0)), 7, 3)
INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (27, N'Cotman Brush Series 111 Round - แปรงด้ามสั้น', N'https://down-th.img.susercontent.com/file/id-11134207-7r98x-lm8mxhk2or6zcd.webp', CAST(195 AS Decimal(18, 0)), 10, 3)
INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (28, N'Mijello Airtight Watercolor 18-Well Blue Palette', N'https://m.media-amazon.com/images/I/61TI0md3-oL._AC_SL1500_.jpg', CAST(300 AS Decimal(18, 0)), 5, 3)
INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (29, N'Moleskine สมุดบันทึกแบบ Bullet ปกแข็ง สีดำ ขนาดใหญ่ ART BULLET NOTEBOOK LARGE BLACK', N'https://th.bing.com/th/id/OIP.kLeRP1v6hhQQI2TTyQOjdwHaHa?rs=1&pid=ImgDetMain', CAST(999 AS Decimal(18, 0)), 10, 3)
INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (30, N'Strathmore 400 Series Toned Sketch Paper Pad Wire Bound', N'https://down-th.img.susercontent.com/file/c2a0fa3cebea4dd38219d66d2db5932a.webp', CAST(1586 AS Decimal(18, 0)), 4, 3)
INSERT [dbo].[Products_tb] ([productID], [productName], [img], [price], [stock], [categoryID]) VALUES (32, N'gay', N'https://i2.wp.com/genshinbuilds.aipurrjects.com/genshin/characters/yae_miko/image.png?strip=all&quality=75&w=256', CAST(100 AS Decimal(18, 0)), 10, 2)
SET IDENTITY_INSERT [dbo].[Products_tb] OFF
GO
SET IDENTITY_INSERT [dbo].[User_tb] ON 

INSERT [dbo].[User_tb] ([userID], [userName], [userEmail], [userPassword], [role]) VALUES (1, N'Chompoo', N'Chompoo@gmail.com', N'1234', N'Admin')
INSERT [dbo].[User_tb] ([userID], [userName], [userEmail], [userPassword], [role]) VALUES (2, N'Nungning', N'Nungning@gmail.com', N'4321', N'Admin')
INSERT [dbo].[User_tb] ([userID], [userName], [userEmail], [userPassword], [role]) VALUES (3, N'Bigboss', N'Bigboss@gmail.com', N'1234', N'User')
INSERT [dbo].[User_tb] ([userID], [userName], [userEmail], [userPassword], [role]) VALUES (4, N'Peegetsodsoi', N'Peegetsodsoi@gmail.com', N'1235', N'User')
INSERT [dbo].[User_tb] ([userID], [userName], [userEmail], [userPassword], [role]) VALUES (5, N'Neko', N'Neko@gmail.com', N'1212', N'User')
INSERT [dbo].[User_tb] ([userID], [userName], [userEmail], [userPassword], [role]) VALUES (6, N'Nayaun', N'Nayaun@gmail.com', N'1235', N'User')
INSERT [dbo].[User_tb] ([userID], [userName], [userEmail], [userPassword], [role]) VALUES (7, N'Nongnay', N'Nongnay@gmail.com', N'6547', N'User')
INSERT [dbo].[User_tb] ([userID], [userName], [userEmail], [userPassword], [role]) VALUES (8, N'Jomkang', N'Jomkang@gmail.com', N'2547', N'User')
INSERT [dbo].[User_tb] ([userID], [userName], [userEmail], [userPassword], [role]) VALUES (9, N'Kampong', N'Kampong@gmail.com', N'2548', N'User')
INSERT [dbo].[User_tb] ([userID], [userName], [userEmail], [userPassword], [role]) VALUES (10, N'Diddy', N'Diddy@gmail.com', N'2549', N'User')
INSERT [dbo].[User_tb] ([userID], [userName], [userEmail], [userPassword], [role]) VALUES (11, N'Kati', N'Kati@gmail.com', N'2550', N'User')
INSERT [dbo].[User_tb] ([userID], [userName], [userEmail], [userPassword], [role]) VALUES (12, N'polypoy', N'polypoy@gmail.com', N'2551', N'User')
INSERT [dbo].[User_tb] ([userID], [userName], [userEmail], [userPassword], [role]) VALUES (13, N'Bluewy', N'Bluewy@gmail.com', N'1212', N'User')
INSERT [dbo].[User_tb] ([userID], [userName], [userEmail], [userPassword], [role]) VALUES (14, N'Aomsin', N'Aomsin@gmail.com', N'1245', N'User')
INSERT [dbo].[User_tb] ([userID], [userName], [userEmail], [userPassword], [role]) VALUES (15, N'Toey', N'Toey@gmail.com', N'4521', N'User')
INSERT [dbo].[User_tb] ([userID], [userName], [userEmail], [userPassword], [role]) VALUES (16, N'a', N'a@gmail.com', N'11', N'User')
INSERT [dbo].[User_tb] ([userID], [userName], [userEmail], [userPassword], [role]) VALUES (17, N'jim', N'jim@gmail.com', N'11', N'User')
INSERT [dbo].[User_tb] ([userID], [userName], [userEmail], [userPassword], [role]) VALUES (18, NULL, NULL, NULL, N'User')
INSERT [dbo].[User_tb] ([userID], [userName], [userEmail], [userPassword], [role]) VALUES (19, NULL, NULL, NULL, N'User')
INSERT [dbo].[User_tb] ([userID], [userName], [userEmail], [userPassword], [role]) VALUES (20, NULL, NULL, NULL, N'User')
INSERT [dbo].[User_tb] ([userID], [userName], [userEmail], [userPassword], [role]) VALUES (21, NULL, NULL, NULL, N'User')
INSERT [dbo].[User_tb] ([userID], [userName], [userEmail], [userPassword], [role]) VALUES (22, NULL, NULL, NULL, N'User')
SET IDENTITY_INSERT [dbo].[User_tb] OFF
GO
USE [master]
GO
ALTER DATABASE [StationeryStore] SET  READ_WRITE 
GO
