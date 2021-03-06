USE [master]
GO
/****** Object:  Database [mid-term]    Script Date: 2018/10/14 下午 08:41:40 ******/
CREATE DATABASE [mid-term]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mid-term', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\mid-term.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mid-term_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\mid-term_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [mid-term] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mid-term].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mid-term] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mid-term] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mid-term] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mid-term] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mid-term] SET ARITHABORT OFF 
GO
ALTER DATABASE [mid-term] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mid-term] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mid-term] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mid-term] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mid-term] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mid-term] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mid-term] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mid-term] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mid-term] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mid-term] SET  DISABLE_BROKER 
GO
ALTER DATABASE [mid-term] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mid-term] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mid-term] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mid-term] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mid-term] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mid-term] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mid-term] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mid-term] SET RECOVERY FULL 
GO
ALTER DATABASE [mid-term] SET  MULTI_USER 
GO
ALTER DATABASE [mid-term] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mid-term] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mid-term] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mid-term] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [mid-term] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'mid-term', N'ON'
GO
ALTER DATABASE [mid-term] SET QUERY_STORE = OFF
GO
USE [mid-term]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [mid-term]
GO
/****** Object:  Table [dbo].[customerlist]    Script Date: 2018/10/14 下午 08:41:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customerlist](
	[cus_id] [int] IDENTITY(100,1) NOT NULL,
	[cus_name] [nvarchar](50) NOT NULL,
	[cus_tel] [nvarchar](50) NOT NULL,
	[address] [nvarchar](100) NULL,
	[relationship] [nvarchar](100) NULL,
	[all order number] [int] NULL,
	[all consume amount] [int] NULL,
 CONSTRAINT [PK_customerlist] PRIMARY KEY CLUSTERED 
(
	[cus_tel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderdetail]    Script Date: 2018/10/14 下午 08:41:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderdetail](
	[order_id] [int] NOT NULL,
	[pro_id] [int] NOT NULL,
	[product] [nvarchar](50) NOT NULL,
	[quantity] [int] NULL,
	[total] [int] NULL,
	[discount] [int] NULL,
	[finaltotal] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 2018/10/14 下午 08:41:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] IDENTITY(1000,1) NOT NULL,
	[cus_name] [nvarchar](50) NOT NULL,
	[cus_tel] [nvarchar](50) NOT NULL,
	[orderdate] [datetime] NULL,
	[deliverdate] [date] NULL,
	[paid_statement] [bit] NULL,
	[delivered_statement] [bit] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product1]    Script Date: 2018/10/14 下午 08:41:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product1](
	[Pro_id] [int] IDENTITY(0,1) NOT NULL,
	[product] [nvarchar](50) NOT NULL,
	[price] [int] NULL,
	[manufactor date] [date] NULL,
	[stock] [int] NULL,
 CONSTRAINT [PK_product1] PRIMARY KEY CLUSTERED 
(
	[Pro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[customerlist] ON 

INSERT [dbo].[customerlist] ([cus_id], [cus_name], [cus_tel], [address], [relationship], [all order number], [all consume amount]) VALUES (100, N'other', N'0', NULL, NULL, NULL, NULL)
INSERT [dbo].[customerlist] ([cus_id], [cus_name], [cus_tel], [address], [relationship], [all order number], [all consume amount]) VALUES (101, N'george', N'091122', NULL, NULL, NULL, NULL)
INSERT [dbo].[customerlist] ([cus_id], [cus_name], [cus_tel], [address], [relationship], [all order number], [all consume amount]) VALUES (102, N'emily', N'091133', N'屏東市', NULL, NULL, NULL)
INSERT [dbo].[customerlist] ([cus_id], [cus_name], [cus_tel], [address], [relationship], [all order number], [all consume amount]) VALUES (103, N'bella', N'091144', NULL, NULL, NULL, NULL)
INSERT [dbo].[customerlist] ([cus_id], [cus_name], [cus_tel], [address], [relationship], [all order number], [all consume amount]) VALUES (104, N'ashiley', N'091155', N'高雄市鳥松區', NULL, NULL, NULL)
INSERT [dbo].[customerlist] ([cus_id], [cus_name], [cus_tel], [address], [relationship], [all order number], [all consume amount]) VALUES (105, N'berny', N'091166', N'雲林縣', NULL, NULL, NULL)
INSERT [dbo].[customerlist] ([cus_id], [cus_name], [cus_tel], [address], [relationship], [all order number], [all consume amount]) VALUES (106, N'melisa', N'091177', NULL, NULL, NULL, NULL)
INSERT [dbo].[customerlist] ([cus_id], [cus_name], [cus_tel], [address], [relationship], [all order number], [all consume amount]) VALUES (107, N'marry', N'098811', N'高雄市前金區', N'000aunt', NULL, NULL)
INSERT [dbo].[customerlist] ([cus_id], [cus_name], [cus_tel], [address], [relationship], [all order number], [all consume amount]) VALUES (108, N'peter', N'098822', N'新北市板橋區', NULL, NULL, NULL)
INSERT [dbo].[customerlist] ([cus_id], [cus_name], [cus_tel], [address], [relationship], [all order number], [all consume amount]) VALUES (109, N'leo', N'098833', N'台南市', NULL, NULL, NULL)
INSERT [dbo].[customerlist] ([cus_id], [cus_name], [cus_tel], [address], [relationship], [all order number], [all consume amount]) VALUES (110, N'kevin', N'098844', N'台北市大安區', N'XXXuncle', NULL, NULL)
INSERT [dbo].[customerlist] ([cus_id], [cus_name], [cus_tel], [address], [relationship], [all order number], [all consume amount]) VALUES (111, N'grace', N'098855', N'宜蘭市', NULL, NULL, NULL)
INSERT [dbo].[customerlist] ([cus_id], [cus_name], [cus_tel], [address], [relationship], [all order number], [all consume amount]) VALUES (112, N'leno', N'098866', N'嘉義市', NULL, NULL, NULL)
INSERT [dbo].[customerlist] ([cus_id], [cus_name], [cus_tel], [address], [relationship], [all order number], [all consume amount]) VALUES (113, N'una', N'098888', NULL, N'221''s aunt', NULL, NULL)
INSERT [dbo].[customerlist] ([cus_id], [cus_name], [cus_tel], [address], [relationship], [all order number], [all consume amount]) VALUES (114, N'tanya', N'098899', N'台東市', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[customerlist] OFF
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1000, 0, N'餛飩(大盒)', 2, 150, 0, 150)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1000, 1, N'餛飩(小盒)', 5, 250, 0, 250)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1001, 0, N'餛飩(大盒)', 3, 225, 0, 225)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1002, 1, N'餛飩(小盒)', 10, 500, 1, 450)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1003, 2, N'破布籽醬', 2, 200, 0, 200)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1003, 0, N'餛飩(大盒)', 2, 150, 0, 150)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1004, 0, N'餛飩(大盒)', 10, 750, 1, 675)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1005, 0, N'餛飩(大盒)', 3, 225, 0, 225)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1006, 1, N'餛飩(小盒)', 5, 250, 0, 250)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1007, 0, N'餛飩(大盒)', 3, 225, 0, 225)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1007, 2, N'破布籽醬', 5, 500, 0, 500)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1034, 0, N'餛飩(大盒)', 2, 150, 0, 150)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1035, 0, N'餛飩(大盒)', 2, 150, 0, 150)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1036, 2, N'破布籽醬', 2, 200, 0, 200)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1047, 1, N'餛飩(小盒)', 10, 500, 0, 500)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1057, 0, N'餛飩(大盒)', 4, 300, 0, 300)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1058, 0, N'餛飩(大盒)', 3, 225, 0, 225)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1037, 0, N'餛飩(大盒)', 2, 150, 0, 150)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1046, 2, N'破布籽醬', 2, 200, 0, 200)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1046, 1, N'餛飩(小盒)', 5, 250, 0, 250)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1046, 0, N'餛飩(大盒)', 2, 150, 0, 150)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1048, 0, N'餛飩(大盒)', 2, 150, 0, 150)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1048, 2, N'破布籽醬', 1, 100, 0, 100)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1049, 0, N'餛飩(大盒)', 2, 150, 0, 150)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1049, 1, N'餛飩(小盒)', 5, 250, 0, 250)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1051, 0, N'餛飩(大盒)', 2, 150, 0, 150)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1051, 1, N'餛飩(小盒)', 5, 250, 0, 250)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1053, 0, N'餛飩(大盒)', 2, 150, 0, 150)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1056, 0, N'餛飩(大盒)', 2, 150, 0, 150)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1052, 0, N'餛飩(大盒)', 2, 150, 0, 150)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1052, 1, N'餛飩(小盒)', 5, 250, 0, 250)
INSERT [dbo].[orderdetail] ([order_id], [pro_id], [product], [quantity], [total], [discount], [finaltotal]) VALUES (1055, 0, N'餛飩(大盒)', 2, 150, 0, 150)
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1000, N'marry', N'098811', CAST(N'2018-04-01T00:00:00.000' AS DateTime), CAST(N'2018-04-03' AS Date), 1, 1)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1001, N'peter', N'098822', CAST(N'2018-04-05T00:00:00.000' AS DateTime), CAST(N'2018-04-07' AS Date), 1, 1)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1002, N'leo', N'098833', CAST(N'2018-04-10T00:00:00.000' AS DateTime), CAST(N'2018-04-13' AS Date), 1, 1)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1003, N'berny', N'091166', CAST(N'2018-04-12T00:00:00.000' AS DateTime), CAST(N'2018-04-13' AS Date), 1, 1)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1004, N'kevin', N'098844', CAST(N'2018-04-15T00:00:00.000' AS DateTime), CAST(N'2018-04-18' AS Date), 1, 1)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1005, N'grace', N'098855', CAST(N'2018-05-03T00:00:00.000' AS DateTime), CAST(N'2018-05-05' AS Date), 1, 1)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1006, N'tanya', N'098899', CAST(N'2018-05-25T00:00:00.000' AS DateTime), CAST(N'2018-05-27' AS Date), 1, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1007, N'george', N'091122', CAST(N'2018-05-28T00:00:00.000' AS DateTime), CAST(N'2018-05-30' AS Date), 1, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1008, N'leo', N'098833', CAST(N'2018-06-26T22:13:04.000' AS DateTime), CAST(N'2018-06-26' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1009, N'marry', N'098811', CAST(N'2018-06-26T22:16:01.000' AS DateTime), CAST(N'2018-06-26' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1010, N'ashiley', N'091155', CAST(N'2018-06-26T22:17:02.000' AS DateTime), CAST(N'2018-06-26' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1011, N'ashiley', N'091155', CAST(N'2018-06-26T22:20:09.000' AS DateTime), CAST(N'2018-06-26' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1012, N'ashiley', N'091155', CAST(N'2018-06-26T22:37:39.000' AS DateTime), CAST(N'2018-06-26' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1013, N'ashiley', N'091155', CAST(N'2018-06-26T23:09:16.000' AS DateTime), CAST(N'2018-06-26' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1014, N'ashiley', N'091155', CAST(N'2018-06-26T23:15:04.000' AS DateTime), CAST(N'2018-06-25' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1015, N'bella', N'091144', CAST(N'2018-06-26T23:17:45.000' AS DateTime), CAST(N'2018-06-26' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1016, N'ashiley', N'091155', CAST(N'2018-06-26T23:19:33.000' AS DateTime), CAST(N'2018-06-26' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1017, N'melisa', N'091177', CAST(N'2018-06-26T23:29:07.000' AS DateTime), CAST(N'2018-06-26' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1018, N'berny', N'091166', CAST(N'2018-06-26T23:38:10.000' AS DateTime), CAST(N'2018-06-26' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1019, N'ashiley', N'091155', CAST(N'2018-06-26T23:42:11.000' AS DateTime), CAST(N'2018-06-26' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1020, N'grace', N'098855', CAST(N'2018-06-27T09:04:19.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1021, N'bella', N'091144', CAST(N'2018-06-27T10:21:36.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1022, N'george', N'091122', CAST(N'2018-06-27T10:33:51.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1023, N'berny', N'091166', CAST(N'2018-06-27T10:42:56.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1024, N'una', N'098888', CAST(N'2018-06-27T10:44:27.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1025, N'grace', N'098855', CAST(N'2018-06-27T10:47:38.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1026, N'una', N'098888', CAST(N'2018-06-27T11:08:11.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1027, N'kevin', N'098844', CAST(N'2018-06-27T11:11:24.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1028, N'kevin', N'098844', CAST(N'2018-06-27T11:11:24.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1029, N'kevin', N'098844', CAST(N'2018-06-27T11:11:24.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1030, N'kevin', N'098844', CAST(N'2018-06-27T11:11:24.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1031, N'ashiley', N'091155', CAST(N'2018-06-27T11:23:34.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1032, N'george', N'091122', CAST(N'2018-06-27T11:31:28.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1033, N'other', N'0', CAST(N'2018-06-27T11:33:28.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1034, N'other', N'0', CAST(N'2018-06-27T11:36:03.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1035, N'other', N'0', CAST(N'2018-06-27T11:36:03.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1036, N'berny', N'091166', CAST(N'2018-06-27T11:44:05.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1037, N'ashiley', N'091155', CAST(N'2018-06-27T11:48:06.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1038, N'marry', N'098811', CAST(N'2018-06-27T11:58:40.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1039, N'ashiley', N'091155', CAST(N'2018-06-27T14:46:34.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1040, N'emily', N'091133', CAST(N'2018-06-27T14:48:59.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1041, N'bella', N'091144', CAST(N'2018-06-27T14:53:36.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1042, N'berny', N'091166', CAST(N'2018-06-27T14:54:28.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1043, N'bella', N'091144', CAST(N'2018-06-27T15:02:42.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1044, N'bella', N'091144', CAST(N'2018-06-27T15:04:12.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1045, N'melisa', N'091177', CAST(N'2018-06-27T15:07:29.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1046, N'bella', N'091144', CAST(N'2018-06-27T15:10:11.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1047, N'leo', N'098833', CAST(N'2018-06-27T19:43:45.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1048, N'berny', N'091166', CAST(N'2018-06-27T19:45:19.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1049, N'una', N'098888', CAST(N'2018-06-27T19:46:48.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1050, N'melisa', N'091177', CAST(N'2018-06-27T19:48:57.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1051, N'grace', N'098855', CAST(N'2018-06-27T19:51:18.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1052, N'peter', N'098822', CAST(N'2018-06-27T20:05:22.000' AS DateTime), CAST(N'2018-06-27' AS Date), 1, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1053, N'peter', N'098822', CAST(N'2018-06-27T20:10:21.000' AS DateTime), CAST(N'2018-06-29' AS Date), 1, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1054, N'peter', N'098822', CAST(N'2018-06-27T20:13:20.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1055, N'peter', N'098822', CAST(N'2018-06-27T20:14:43.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1056, N'peter', N'098822', CAST(N'2018-06-27T20:21:24.000' AS DateTime), CAST(N'2018-06-27' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1057, N'peter', N'098822', CAST(N'2018-06-27T21:19:28.000' AS DateTime), CAST(N'2018-07-01' AS Date), 0, 0)
INSERT [dbo].[orders] ([order_id], [cus_name], [cus_tel], [orderdate], [deliverdate], [paid_statement], [delivered_statement]) VALUES (1058, N'ashiley', N'091155', CAST(N'2018-06-27T22:51:07.000' AS DateTime), CAST(N'2018-06-29' AS Date), 0, 1)
SET IDENTITY_INSERT [dbo].[orders] OFF
SET IDENTITY_INSERT [dbo].[product1] ON 

INSERT [dbo].[product1] ([Pro_id], [product], [price], [manufactor date], [stock]) VALUES (0, N'餛飩(大盒)', 75, CAST(N'2018-06-12' AS Date), 0)
INSERT [dbo].[product1] ([Pro_id], [product], [price], [manufactor date], [stock]) VALUES (1, N'餛飩(小盒)', 50, CAST(N'2018-06-12' AS Date), 0)
INSERT [dbo].[product1] ([Pro_id], [product], [price], [manufactor date], [stock]) VALUES (2, N'破布籽醬', 100, CAST(N'2018-06-12' AS Date), 0)
INSERT [dbo].[product1] ([Pro_id], [product], [price], [manufactor date], [stock]) VALUES (3, N'333', 3, CAST(N'2018-06-01' AS Date), 15)
SET IDENTITY_INSERT [dbo].[product1] OFF
ALTER TABLE [dbo].[orderdetail]  WITH CHECK ADD  CONSTRAINT [FK_orderdetail_orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orderdetail] CHECK CONSTRAINT [FK_orderdetail_orders]
GO
ALTER TABLE [dbo].[orderdetail]  WITH CHECK ADD  CONSTRAINT [FK_orderdetail_product1] FOREIGN KEY([pro_id])
REFERENCES [dbo].[product1] ([Pro_id])
GO
ALTER TABLE [dbo].[orderdetail] CHECK CONSTRAINT [FK_orderdetail_product1]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_customerlist] FOREIGN KEY([cus_tel])
REFERENCES [dbo].[customerlist] ([cus_tel])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_customerlist]
GO
USE [master]
GO
ALTER DATABASE [mid-term] SET  READ_WRITE 
GO
