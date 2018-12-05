USE [Vidly]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 12/5/2018 11:49:25 PM ******/
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
/****** Object:  Table [dbo].[Genres]    Script Date: 12/5/2018 11:49:25 PM ******/
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
/****** Object:  Table [dbo].[MembershipTypes]    Script Date: 12/5/2018 11:49:25 PM ******/
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
/****** Object:  Table [dbo].[Movies]    Script Date: 12/5/2018 11:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[GenreId] [tinyint] NOT NULL,
	[ReleaseDate] [datetime] NOT NULL,
	[NumberInStock] [tinyint] NOT NULL,
	[NumberAvailable] [tinyint] NOT NULL,
 CONSTRAINT [PK_dbo.Movies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [Name], [IsSubscribedToNewslette], [MembershipTypeId], [Birthdate]) VALUES (1, N'John Smith', 0, 1, CAST(N'1980-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Customers] ([Id], [Name], [IsSubscribedToNewslette], [MembershipTypeId], [Birthdate]) VALUES (2, N'Mary Williams', 0, 2, NULL)
INSERT [dbo].[Customers] ([Id], [Name], [IsSubscribedToNewslette], [MembershipTypeId], [Birthdate]) VALUES (3, N'John Smith5', 0, 3, CAST(N'1900-01-01T00:00:00.000' AS DateTime))
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

INSERT [dbo].[Movies] ([Id], [Name], [GenreId], [ReleaseDate], [NumberInStock], [NumberAvailable]) VALUES (1, N'Hangover', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[Movies] ([Id], [Name], [GenreId], [ReleaseDate], [NumberInStock], [NumberAvailable]) VALUES (2, N'Die Hard', 2, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[Movies] ([Id], [Name], [GenreId], [ReleaseDate], [NumberInStock], [NumberAvailable]) VALUES (3, N'The Terminator', 2, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[Movies] ([Id], [Name], [GenreId], [ReleaseDate], [NumberInStock], [NumberAvailable]) VALUES (4, N'Toy Story', 3, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[Movies] ([Id], [Name], [GenreId], [ReleaseDate], [NumberInStock], [NumberAvailable]) VALUES (5, N'Titanic', 4, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[Movies] ([Id], [Name], [GenreId], [ReleaseDate], [NumberInStock], [NumberAvailable]) VALUES (6, N'Forgotten', 3, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[Movies] OFF
ALTER TABLE [dbo].[Movies] ADD  DEFAULT ((0)) FOR [GenreId]
GO
ALTER TABLE [dbo].[Movies] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [ReleaseDate]
GO
ALTER TABLE [dbo].[Movies] ADD  DEFAULT ((0)) FOR [NumberInStock]
GO
ALTER TABLE [dbo].[Movies] ADD  DEFAULT ((0)) FOR [NumberAvailable]
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
