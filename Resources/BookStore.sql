USE [master]
GO
/****** Object:  Database [BookShop]    Script Date: 16.05.2025 17:20:41 ******/
CREATE DATABASE [BookShop]
GO
ALTER DATABASE [BookShop] SET COMPATIBILITY_LEVEL = 160
GO

USE [BookShop]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 16.05.2025 17:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[AuthorId] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 16.05.2025 17:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookId] [int] IDENTITY(1,1) NOT NULL,
	[AuthorId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Genre] [nvarchar](50) NOT NULL,
	[Price] [decimal](7, 2) NOT NULL,
	[Weight] [decimal](5, 3) NOT NULL,
	[PageCount] [smallint] NOT NULL,
	[ReleaseYear] [smallint] NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 16.05.2025 17:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](20) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](20) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 16.05.2025 17:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[OrderDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderedBook]    Script Date: 16.05.2025 17:20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderedBook](
	[OrderId] [int] NOT NULL,
	[BookId] [int] NOT NULL,
	[Quantity] [tinyint] NOT NULL,
 CONSTRAINT [PK_OrderedBook] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET IDENTITY_INSERT [dbo].[Author] ON 
GO
INSERT [dbo].[Author] ([AuthorId], [Surname], [Name], [Country]) VALUES (1, N'Пушкин', N'Александр', N'Россия')
GO
INSERT [dbo].[Author] ([AuthorId], [Surname], [Name], [Country]) VALUES (2, N'Толстой', N'Лев', N'Россия')
GO
INSERT [dbo].[Author] ([AuthorId], [Surname], [Name], [Country]) VALUES (3, N'Чехов', N'Антон', N'Россия')
GO
INSERT [dbo].[Author] ([AuthorId], [Surname], [Name], [Country]) VALUES (4, N'Оруэлл', N'Джордж', N'Великобритания')
GO
INSERT [dbo].[Author] ([AuthorId], [Surname], [Name], [Country]) VALUES (5, N'Ремарк', N'Эрих Мария', N'Германия')
GO
INSERT [dbo].[Author] ([AuthorId], [Surname], [Name], [Country]) VALUES (6, N'Брэдбери', N'Рэй', N'США')
GO
INSERT [dbo].[Author] ([AuthorId], [Surname], [Name], [Country]) VALUES (7, N'Лондон', N'Джэк', N'США')
GO
INSERT [dbo].[Author] ([AuthorId], [Surname], [Name], [Country]) VALUES (8, N'Толкин', N'Джон', N'Великобритания')
GO
INSERT [dbo].[Author] ([AuthorId], [Surname], [Name], [Country]) VALUES (9, N'Кафка', N'Франц', N'Германия')
GO
INSERT [dbo].[Author] ([AuthorId], [Surname], [Name], [Country]) VALUES (10, N'Верн', N'Жюль', N'Франция')
GO
SET IDENTITY_INSERT [dbo].[Author] OFF
GO
SET IDENTITY_INSERT [dbo].[Book] ON 
GO
INSERT [dbo].[Book] ([BookId], [AuthorId], [Title], [Genre], [Price], [Weight], [PageCount], [ReleaseYear]) VALUES (1, 1, N'Сказка о царе Салтане', N'поэзия', CAST(855.00 AS Decimal(7, 2)), CAST(0.390 AS Decimal(5, 3)), 64, 2023)
GO
INSERT [dbo].[Book] ([BookId], [AuthorId], [Title], [Genre], [Price], [Weight], [PageCount], [ReleaseYear]) VALUES (2, 1, N'Руслан и Людмила', N'поэзия', CAST(191.00 AS Decimal(7, 2)), CAST(0.220 AS Decimal(5, 3)), 128, 2022)
GO
INSERT [dbo].[Book] ([BookId], [AuthorId], [Title], [Genre], [Price], [Weight], [PageCount], [ReleaseYear]) VALUES (3, 2, N'Анна Каренина', N'проза', CAST(321.00 AS Decimal(7, 2)), CAST(0.400 AS Decimal(5, 3)), 864, 2024)
GO
INSERT [dbo].[Book] ([BookId], [AuthorId], [Title], [Genre], [Price], [Weight], [PageCount], [ReleaseYear]) VALUES (4, 3, N'Вишневый сад', N'другое', CAST(299.00 AS Decimal(7, 2)), CAST(0.220 AS Decimal(5, 3)), 352, 2024)
GO
INSERT [dbo].[Book] ([BookId], [AuthorId], [Title], [Genre], [Price], [Weight], [PageCount], [ReleaseYear]) VALUES (5, 4, N'1984', N'проза', CAST(312.00 AS Decimal(7, 2)), CAST(0.200 AS Decimal(5, 3)), 320, 2024)
GO
INSERT [dbo].[Book] ([BookId], [AuthorId], [Title], [Genre], [Price], [Weight], [PageCount], [ReleaseYear]) VALUES (6, 4, N'Скотный Двор', N'другое', CAST(303.00 AS Decimal(7, 2)), CAST(0.170 AS Decimal(5, 3)), 256, 2025)
GO
INSERT [dbo].[Book] ([BookId], [AuthorId], [Title], [Genre], [Price], [Weight], [PageCount], [ReleaseYear]) VALUES (7, 5, N'На Западном фронте без перемен', N'проза', CAST(339.00 AS Decimal(7, 2)), CAST(0.210 AS Decimal(5, 3)), 288, 2025)
GO
INSERT [dbo].[Book] ([BookId], [AuthorId], [Title], [Genre], [Price], [Weight], [PageCount], [ReleaseYear]) VALUES (8, 7, N'Белый клык', N'проза', CAST(827.00 AS Decimal(7, 2)), CAST(0.610 AS Decimal(5, 3)), 672, 2022)
GO
INSERT [dbo].[Book] ([BookId], [AuthorId], [Title], [Genre], [Price], [Weight], [PageCount], [ReleaseYear]) VALUES (9, 6, N'451 градус по Фаренгейту', N'проза', CAST(597.00 AS Decimal(7, 2)), CAST(0.380 AS Decimal(5, 3)), 288, 2024)
GO
INSERT [dbo].[Book] ([BookId], [AuthorId], [Title], [Genre], [Price], [Weight], [PageCount], [ReleaseYear]) VALUES (10, 6, N'Вино из одуванчиков', N'проза', CAST(330.00 AS Decimal(7, 2)), CAST(0.160 AS Decimal(5, 3)), 352, 2024)
GO
INSERT [dbo].[Book] ([BookId], [AuthorId], [Title], [Genre], [Price], [Weight], [PageCount], [ReleaseYear]) VALUES (11, 8, N'Хоббит', N'проза', CAST(358.00 AS Decimal(7, 2)), CAST(0.200 AS Decimal(5, 3)), 320, 2025)
GO
INSERT [dbo].[Book] ([BookId], [AuthorId], [Title], [Genre], [Price], [Weight], [PageCount], [ReleaseYear]) VALUES (12, 8, N'Сильмариллион', N'проза', CAST(413.00 AS Decimal(7, 2)), CAST(0.220 AS Decimal(5, 3)), 448, 2025)
GO
INSERT [dbo].[Book] ([BookId], [AuthorId], [Title], [Genre], [Price], [Weight], [PageCount], [ReleaseYear]) VALUES (13, 9, N'Превращение', N'проза', CAST(303.00 AS Decimal(7, 2)), CAST(0.250 AS Decimal(5, 3)), 416, 2025)
GO
INSERT [dbo].[Book] ([BookId], [AuthorId], [Title], [Genre], [Price], [Weight], [PageCount], [ReleaseYear]) VALUES (14, 10, N'Двадцать тысяч лье под водой', N'проза', CAST(293.00 AS Decimal(7, 2)), CAST(0.250 AS Decimal(5, 3)), 512, 2024)
GO
INSERT [dbo].[Book] ([BookId], [AuthorId], [Title], [Genre], [Price], [Weight], [PageCount], [ReleaseYear]) VALUES (15, 10, N'Вокруг света в восемьдесят дней', N'проза', CAST(299.00 AS Decimal(7, 2)), CAST(0.170 AS Decimal(5, 3)), 288, 2025)
GO
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 
GO
INSERT [dbo].[Customer] ([CustomerId], [Login], [Surname], [Name], [Address], [Phone]) VALUES (1, N'ivan123', N'Иванов', N'Иван', N'г. Архангельск', N'88005553535')
GO
INSERT [dbo].[Customer] ([CustomerId], [Login], [Surname], [Name], [Address], [Phone]) VALUES (2, N'JohnDoe11', N'Миронов', N'Петр', N'г. Архангельск', N'79995554411')
GO
INSERT [dbo].[Customer] ([CustomerId], [Login], [Surname], [Name], [Address], [Phone]) VALUES (6, N'samiy_luchshiy', N'Сваровски', N'Даниил', N'г. Северодвинск', NULL)
GO
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Customer_Login]    Script Date: 16.05.2025 17:20:41 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [UQ_Customer_Login] UNIQUE NONCLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Author] ADD  CONSTRAINT [DF_Author_Country]  DEFAULT (N'Россия') FOR [Country]
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF_Book_Genre]  DEFAULT (N'проза') FOR [Genre]
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF_Book_Price]  DEFAULT ((0.00)) FOR [Price]
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF_Book_Weight]  DEFAULT ((0.000)) FOR [Weight]
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF_Book_PageCount]  DEFAULT ((0)) FOR [PageCount]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_OrderDateTime]  DEFAULT (getdate()) FOR [OrderDateTime]
GO
ALTER TABLE [dbo].[OrderedBook] ADD  CONSTRAINT [DF_OrderedBook_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Author] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Author] ([AuthorId])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Author]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[OrderedBook]  WITH CHECK ADD  CONSTRAINT [FK_OrderedBook_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([BookId])
GO
ALTER TABLE [dbo].[OrderedBook] CHECK CONSTRAINT [FK_OrderedBook_Book]
GO
ALTER TABLE [dbo].[OrderedBook]  WITH CHECK ADD  CONSTRAINT [FK_OrderedBook_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderedBook] CHECK CONSTRAINT [FK_OrderedBook_Order]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [CK_Book_Genre] CHECK  (([Genre]='проза' OR [Genre]='поэзия' OR [Genre]='другое'))
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [CK_Book_Genre]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [CK_Book_Price] CHECK  (([Price]>=(0) AND [Price]<=(10000)))
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [CK_Book_Price]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [CK_Book_Weight] CHECK  (([Weight]>=(0) AND [Weight]<=(10)))
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [CK_Book_Weight]
GO
ALTER TABLE [dbo].[OrderedBook]  WITH CHECK ADD  CONSTRAINT [CK_OrderedBook_Quantity] CHECK  (([Quantity]>=(1) AND [Quantity]<=(100)))
GO
ALTER TABLE [dbo].[OrderedBook] CHECK CONSTRAINT [CK_OrderedBook_Quantity]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Авторы by ReyRom' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Author'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Книги by ReyRom' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Book'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Покупатели by ReyRom' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Заказы by ReyRom' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Заказанные книги by ReyRom' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderedBook'
GO
USE [master]
GO
ALTER DATABASE [BookShop] SET READ_WRITE 
GO
