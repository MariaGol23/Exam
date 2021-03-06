USE [master]
GO
/****** Object:  Database [Lombard]    Script Date: 02.07.2022 13:21:23 ******/
CREATE DATABASE [Lombard]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Lombard', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Lombard.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Lombard_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Lombard_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Lombard] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Lombard].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Lombard] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Lombard] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Lombard] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Lombard] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Lombard] SET ARITHABORT OFF 
GO
ALTER DATABASE [Lombard] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Lombard] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Lombard] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Lombard] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Lombard] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Lombard] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Lombard] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Lombard] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Lombard] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Lombard] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Lombard] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Lombard] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Lombard] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Lombard] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Lombard] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Lombard] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Lombard] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Lombard] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Lombard] SET  MULTI_USER 
GO
ALTER DATABASE [Lombard] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Lombard] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Lombard] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Lombard] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Lombard] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Lombard] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Lombard] SET QUERY_STORE = OFF
GO
USE [Lombard]
GO
/****** Object:  User [DESKTOP-2P93UGK\Администратор]    Script Date: 02.07.2022 13:21:23 ******/
CREATE USER [DESKTOP-2P93UGK\Администратор] FOR LOGIN [DESKTOP-2P93UGK\Администратор] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 02.07.2022 13:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Phone] [nvarchar](11) NULL,
	[Passport] [nvarchar](50) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 02.07.2022 13:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Graph]    Script Date: 02.07.2022 13:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Graph](
	[GraphID] [int] IDENTITY(1,1) NOT NULL,
	[StatusID] [int] NULL,
	[EmployeeID] [int] NULL,
	[Almost] [float] NULL,
	[ExtremeDateOfPay] [datetime] NULL,
	[FactDateOfPay] [datetime] NULL,
 CONSTRAINT [PK_Graph] PRIMARY KEY CLUSTERED 
(
	[GraphID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 02.07.2022 13:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductsID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NULL,
	[GraphID] [nchar](10) NULL,
	[EmployeeID] [int] NULL,
	[TypeID] [int] NULL,
	[Title] [nvarchar](50) NULL,
	[DateOfDelivery] [datetime] NULL,
	[EstimatedСost] [float] NULL,
	[AmountSecured] [float] NULL,
	[AmountRedemption] [float] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 02.07.2022 13:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[SaleID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NULL,
	[ProductID] [int] NULL,
	[StatusID] [int] NULL,
	[DateSale] [datetime] NULL,
	[Cost] [float] NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[SaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 02.07.2022 13:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 02.07.2022 13:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ClientID], [Surname], [Name], [Patronymic], [Phone], [Passport]) VALUES (1, N'Голубева', N'Мария', N'Александровна', N'89831334145', N'123456789')
INSERT [dbo].[Client] ([ClientID], [Surname], [Name], [Patronymic], [Phone], [Passport]) VALUES (2, N'Великанова', N'Марина', N'Михайловна', N'87654321234', N'987654321')
INSERT [dbo].[Client] ([ClientID], [Surname], [Name], [Patronymic], [Phone], [Passport]) VALUES (3, N'Шалагина', N'Екатерина', N'Владимировна', N'89765456785', N'345678765')
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeID], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (1, N'Кашкарова', N'Виктория', N'Андреевна', N'Vict', N'55')
INSERT [dbo].[Employee] ([EmployeeID], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (2, N'Клименко', N'Анастасия', N'Ивановна', N'Anast', N'101')
INSERT [dbo].[Employee] ([EmployeeID], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (3, N'Миренко', N'Антон', N'Антонович', N'Mirenko', N'22')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Graph] ON 

INSERT [dbo].[Graph] ([GraphID], [StatusID], [EmployeeID], [Almost], [ExtremeDateOfPay], [FactDateOfPay]) VALUES (1, 1, 1, 14000, CAST(N'2022-06-27T00:00:00.000' AS DateTime), CAST(N'2022-06-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Graph] ([GraphID], [StatusID], [EmployeeID], [Almost], [ExtremeDateOfPay], [FactDateOfPay]) VALUES (2, 1, 2, 13000, CAST(N'2022-06-27T00:00:00.000' AS DateTime), CAST(N'2022-06-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Graph] ([GraphID], [StatusID], [EmployeeID], [Almost], [ExtremeDateOfPay], [FactDateOfPay]) VALUES (3, 1, 3, 25000, CAST(N'2022-06-27T00:00:00.000' AS DateTime), CAST(N'2022-06-22T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Graph] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductsID], [ClientID], [GraphID], [EmployeeID], [TypeID], [Title], [DateOfDelivery], [EstimatedСost], [AmountSecured], [AmountRedemption]) VALUES (1, 1, N'1         ', 1, 2, N'Золотое колье', CAST(N'2022-06-12T00:00:00.000' AS DateTime), 12000, 12000, 14000)
INSERT [dbo].[Products] ([ProductsID], [ClientID], [GraphID], [EmployeeID], [TypeID], [Title], [DateOfDelivery], [EstimatedСost], [AmountSecured], [AmountRedemption]) VALUES (2, 2, N'2         ', 2, 1, N'Серебряное кольцо', CAST(N'2022-07-10T00:00:00.000' AS DateTime), 10000, 10000, 13000)
INSERT [dbo].[Products] ([ProductsID], [ClientID], [GraphID], [EmployeeID], [TypeID], [Title], [DateOfDelivery], [EstimatedСost], [AmountSecured], [AmountRedemption]) VALUES (3, 3, N'3         ', 3, 3, N'Бриллиантовые сережки', CAST(N'2022-05-10T00:00:00.000' AS DateTime), 20000, 20000, 25000)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Sale] ON 

INSERT [dbo].[Sale] ([SaleID], [EmployeeID], [ProductID], [StatusID], [DateSale], [Cost]) VALUES (1, 1, 1, 2, CAST(N'2022-08-29T00:00:00.000' AS DateTime), 16000)
INSERT [dbo].[Sale] ([SaleID], [EmployeeID], [ProductID], [StatusID], [DateSale], [Cost]) VALUES (2, 2, 2, 2, CAST(N'2022-07-28T00:00:00.000' AS DateTime), 13000)
INSERT [dbo].[Sale] ([SaleID], [EmployeeID], [ProductID], [StatusID], [DateSale], [Cost]) VALUES (3, 3, 3, 2, CAST(N'2022-09-29T00:00:00.000' AS DateTime), 25000)
SET IDENTITY_INSERT [dbo].[Sale] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([StatusID], [Status]) VALUES (1, N'Принят')
INSERT [dbo].[Status] ([StatusID], [Status]) VALUES (2, N'Просрочен')
INSERT [dbo].[Status] ([StatusID], [Status]) VALUES (3, N'Отменен')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([TypeID], [Title]) VALUES (1, N'Кольца')
INSERT [dbo].[Type] ([TypeID], [Title]) VALUES (2, N'Колье')
INSERT [dbo].[Type] ([TypeID], [Title]) VALUES (3, N'Сережки')
SET IDENTITY_INSERT [dbo].[Type] OFF
GO
ALTER TABLE [dbo].[Graph]  WITH CHECK ADD  CONSTRAINT [FK_Graph_Employee] FOREIGN KEY([GraphID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Graph] CHECK CONSTRAINT [FK_Graph_Employee]
GO
ALTER TABLE [dbo].[Graph]  WITH CHECK ADD  CONSTRAINT [FK_Graph_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[Graph] CHECK CONSTRAINT [FK_Graph_Status]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ClientID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Client]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Employee]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Type] FOREIGN KEY([TypeID])
REFERENCES [dbo].[Type] ([TypeID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Type]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Employee]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Status]
GO
USE [master]
GO
ALTER DATABASE [Lombard] SET  READ_WRITE 
GO
