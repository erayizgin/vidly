USE [Vidly]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 10.12.2018 17:17:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[IsSubscribedToNewslette] [bit] NOT NULL,
	[MembershipTypeId] [tinyint] NOT NULL,
	[Birthdate] [datetime] NULL,
 CONSTRAINT [PK_dbo.Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Genres]    Script Date: 10.12.2018 17:17:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[Id] [tinyint] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_dbo.Genres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MembershipTypes]    Script Date: 10.12.2018 17:17:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembershipTypes](
	[Id] [tinyint] NOT NULL,
	[SignUpFree] [smallint] NOT NULL,
	[DurationInMonths] [tinyint] NOT NULL,
	[DiscountRate] [tinyint] NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.MembershipTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Movies]    Script Date: 10.12.2018 17:17:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[GenreId] [tinyint] NOT NULL,
	[ReleaseDate] [datetime] NOT NULL,
	[NumberInStock] [tinyint] NOT NULL,
	[NumberAvailable] [tinyint] NOT NULL,
	[DateAdded] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Movies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rentals]    Script Date: 10.12.2018 17:17:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rentals](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateRented] [datetime] NOT NULL,
	[DateReturned] [datetime] NULL,
	[Customer_Id] [int] NOT NULL,
	[Movie_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Rentals] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [Name], [IsSubscribedToNewslette], [MembershipTypeId], [Birthdate]) VALUES (1, N'John Smith', 0, 1, CAST(N'1980-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Customers] ([Id], [Name], [IsSubscribedToNewslette], [MembershipTypeId], [Birthdate]) VALUES (2, N'Mary Williams', 0, 2, NULL)
INSERT [dbo].[Customers] ([Id], [Name], [IsSubscribedToNewslette], [MembershipTypeId], [Birthdate]) VALUES (4, N'Joe Smith', 0, 1, CAST(N'1980-01-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Customers] OFF
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (1, N'Comedy')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (2, N'Action')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (3, N'Family')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (4, N'Romance')
INSERT [dbo].[MembershipTypes] ([Id], [SignUpFree], [DurationInMonths], [DiscountRate], [Name]) VALUES (1, 0, 0, 0, N'Pay as You Go')
INSERT [dbo].[MembershipTypes] ([Id], [SignUpFree], [DurationInMonths], [DiscountRate], [Name]) VALUES (2, 30, 1, 10, N'Monthly')
INSERT [dbo].[MembershipTypes] ([Id], [SignUpFree], [DurationInMonths], [DiscountRate], [Name]) VALUES (3, 0, 0, 0, N'Quarterly')
INSERT [dbo].[MembershipTypes] ([Id], [SignUpFree], [DurationInMonths], [DiscountRate], [Name]) VALUES (4, 300, 12, 20, N'Annual')
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([Id], [Name], [GenreId], [ReleaseDate], [NumberInStock], [NumberAvailable], [DateAdded]) VALUES (1, N'Hangover', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 6, 3, CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Movies] ([Id], [Name], [GenreId], [ReleaseDate], [NumberInStock], [NumberAvailable], [DateAdded]) VALUES (2, N'Die Hard', 2, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 6, 5, CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Movies] ([Id], [Name], [GenreId], [ReleaseDate], [NumberInStock], [NumberAvailable], [DateAdded]) VALUES (3, N'The Terminator', 2, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 6, 5, CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Movies] ([Id], [Name], [GenreId], [ReleaseDate], [NumberInStock], [NumberAvailable], [DateAdded]) VALUES (5, N'Titanic', 4, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 6, 5, CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Movies] ([Id], [Name], [GenreId], [ReleaseDate], [NumberInStock], [NumberAvailable], [DateAdded]) VALUES (6, N'Forgotten', 3, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 6, 5, CAST(N'1900-01-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Movies] OFF
SET IDENTITY_INSERT [dbo].[Rentals] ON 

INSERT [dbo].[Rentals] ([Id], [DateRented], [DateReturned], [Customer_Id], [Movie_Id]) VALUES (1, CAST(N'2018-12-09T23:08:19.720' AS DateTime), NULL, 1, 1)
INSERT [dbo].[Rentals] ([Id], [DateRented], [DateReturned], [Customer_Id], [Movie_Id]) VALUES (2, CAST(N'2018-12-09T23:08:19.893' AS DateTime), NULL, 1, 2)
INSERT [dbo].[Rentals] ([Id], [DateRented], [DateReturned], [Customer_Id], [Movie_Id]) VALUES (3, CAST(N'2018-12-10T16:07:52.990' AS DateTime), NULL, 2, 1)
INSERT [dbo].[Rentals] ([Id], [DateRented], [DateReturned], [Customer_Id], [Movie_Id]) VALUES (4, CAST(N'2018-12-10T16:38:01.780' AS DateTime), NULL, 2, 1)
SET IDENTITY_INSERT [dbo].[Rentals] OFF
ALTER TABLE [dbo].[Movies] ADD  DEFAULT ((0)) FOR [GenreId]
GO
ALTER TABLE [dbo].[Movies] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [ReleaseDate]
GO
ALTER TABLE [dbo].[Movies] ADD  DEFAULT ((0)) FOR [NumberInStock]
GO
ALTER TABLE [dbo].[Movies] ADD  DEFAULT ((0)) FOR [NumberAvailable]
GO
ALTER TABLE [dbo].[Movies] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [DateAdded]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Customers_dbo.MembershipTypes_MembershipTypeId] FOREIGN KEY([MembershipTypeId])
REFERENCES [dbo].[MembershipTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_dbo.Customers_dbo.MembershipTypes_MembershipTypeId]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Movies_dbo.Genres_GenreId] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genres] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_dbo.Movies_dbo.Genres_GenreId]
GO
ALTER TABLE [dbo].[Rentals]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Rentals_dbo.Customers_Customer_Id] FOREIGN KEY([Customer_Id])
REFERENCES [dbo].[Customers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rentals] CHECK CONSTRAINT [FK_dbo.Rentals_dbo.Customers_Customer_Id]
GO
ALTER TABLE [dbo].[Rentals]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Rentals_dbo.Movies_Movie_Id] FOREIGN KEY([Movie_Id])
REFERENCES [dbo].[Movies] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rentals] CHECK CONSTRAINT [FK_dbo.Rentals_dbo.Movies_Movie_Id]
GO
