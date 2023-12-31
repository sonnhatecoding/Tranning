USE [master]
GO
/****** Object:  Database [Tranning]    Script Date: 12/09/2023 9:33:41 PM ******/
CREATE DATABASE [Tranning]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tranning', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Tranning.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tranning_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Tranning_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Tranning] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tranning].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tranning] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tranning] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tranning] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tranning] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tranning] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tranning] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Tranning] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tranning] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tranning] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tranning] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tranning] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tranning] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tranning] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tranning] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tranning] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Tranning] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tranning] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tranning] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tranning] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tranning] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tranning] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tranning] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tranning] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Tranning] SET  MULTI_USER 
GO
ALTER DATABASE [Tranning] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tranning] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tranning] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tranning] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Tranning] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Tranning] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Tranning] SET QUERY_STORE = OFF
GO
USE [Tranning]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 12/09/2023 9:33:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](150) NULL,
	[icon] [varchar](200) NULL,
	[status] [varchar](50) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 12/09/2023 9:33:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[description] [varchar](200) NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NULL,
	[vote] [int] NULL,
	[avatar] [varchar](500) NOT NULL,
	[status] [varchar](50) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK_courses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 12/09/2023 9:33:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](150) NULL,
	[status] [tinyint] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[topics]    Script Date: 12/09/2023 9:33:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[topics](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](150) NULL,
	[videos] [varchar](500) NULL,
	[documents] [varchar](500) NULL,
	[attach_file] [varchar](500) NULL,
	[status] [varchar](50) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK_topics] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trainee_course]    Script Date: 12/09/2023 9:33:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trainee_course](
	[trainee_id] [bigint] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[userid] [bigint] NULL,
 CONSTRAINT [PK_trainee_course] PRIMARY KEY CLUSTERED 
(
	[trainee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trainner_topic]    Script Date: 12/09/2023 9:33:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trainner_topic](
	[trainner_id] [bigint] IDENTITY(1,1) NOT NULL,
	[topic_id] [bigint] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[userid] [bigint] NULL,
 CONSTRAINT [PK_trainner_topic] PRIMARY KEY CLUSTERED 
(
	[trainner_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 12/09/2023 9:33:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[role_id] [bigint] NOT NULL,
	[extra_code] [varchar](50) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[address] [varchar](100) NULL,
	[gender] [int] NOT NULL,
	[birthday] [date] NULL,
	[avatar] [varchar](100) NULL,
	[last_login] [datetime] NULL,
	[last_logout] [datetime] NULL,
	[status] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[full_name] [nvarchar](500) NOT NULL,
	[education] [varchar](500) NULL,
	[programming_language] [varchar](500) NULL,
	[toeic_score] [int] NULL,
	[experience] [text] NULL,
	[department] [nvarchar](500) NULL,
	[type] [int] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [name], [description], [icon], [status], [created_at], [updated_at], [deleted_at]) VALUES (1, N'abc', N'ádfghffdsa', N'19f2ccdc-3d41-4fd6-ac3b-857b8758d05a-unnamed.jpg', N'Active', CAST(N'2023-12-09T13:37:55.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[courses] ON 

INSERT [dbo].[courses] ([id], [category_id], [name], [description], [start_date], [end_date], [vote], [avatar], [status], [created_at], [updated_at], [deleted_at]) VALUES (2, 1, N'Khóa h?c a', N'avcbvbv', CAST(N'2023-12-09' AS Date), CAST(N'2023-12-31' AS Date), NULL, N'21b88533-d7b5-4388-b07c-8bdc2cf82d92-unnamed.jpg', N'Active', CAST(N'2023-12-09T14:58:55.000' AS DateTime), CAST(N'2023-12-09T17:06:51.517' AS DateTime), NULL)
INSERT [dbo].[courses] ([id], [category_id], [name], [description], [start_date], [end_date], [vote], [avatar], [status], [created_at], [updated_at], [deleted_at]) VALUES (3, 1, N'?12122112', N'1234', CAST(N'2023-12-09' AS Date), CAST(N'2023-12-29' AS Date), NULL, N'90f2fb14-d32e-4a11-9ce9-4471d42970b2-11.jpg', N'Active', CAST(N'2023-12-09T16:44:55.000' AS DateTime), NULL, NULL)
INSERT [dbo].[courses] ([id], [category_id], [name], [description], [start_date], [end_date], [vote], [avatar], [status], [created_at], [updated_at], [deleted_at]) VALUES (10, 1, N'aaaaaa', N'aaa', CAST(N'2023-12-09' AS Date), CAST(N'2023-12-21' AS Date), NULL, N'ab34e433-3690-439e-8a61-8481e107a22c-fightting.jpg', N'Active', CAST(N'2023-12-09T21:21:47.000' AS DateTime), CAST(N'2023-12-09T21:21:53.747' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[courses] OFF
GO
SET IDENTITY_INSERT [dbo].[topics] ON 

INSERT [dbo].[topics] ([id], [course_id], [name], [description], [videos], [documents], [attach_file], [status], [created_at], [updated_at], [deleted_at]) VALUES (1, 2, N'abc', N'acc', N'99409919-f188-43b5-8aba-4da4aa8bc922-11.jpg', NULL, N'b9e49af7-1b72-4bb5-a062-3dea7a21f4a1-maxresdefault.jpg', N'Active', CAST(N'2023-12-09T16:08:59.233' AS DateTime), NULL, NULL)
INSERT [dbo].[topics] ([id], [course_id], [name], [description], [videos], [documents], [attach_file], [status], [created_at], [updated_at], [deleted_at]) VALUES (2, 2, N'abc', N'aaaa', N'c4ffb435-ba3c-46b5-8f5b-b0e3bc7dd481-chi_dan.jpg', NULL, N'ce21c092-723e-453a-bb8c-92852488d8b7-error403.jpg', N'Active', CAST(N'2023-12-09T15:14:52.943' AS DateTime), NULL, NULL)
INSERT [dbo].[topics] ([id], [course_id], [name], [description], [videos], [documents], [attach_file], [status], [created_at], [updated_at], [deleted_at]) VALUES (6, 2, N'aaa', N'aaaâ', N'd916e579-7429-4ae9-be67-1a7b624e9835-videosabc.mp4', N'52c937b9-d4c8-4ef8-a398-861056d9c6d8-fightting.jpg', N'a6efbeab-60ec-484e-9077-4a829ba47dc4-unnamed.jpg', N'Active', CAST(N'2023-12-09T21:22:49.193' AS DateTime), CAST(N'2023-12-09T21:22:49.193' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[topics] OFF
GO
SET IDENTITY_INSERT [dbo].[trainee_course] ON 

INSERT [dbo].[trainee_course] ([trainee_id], [course_id], [created_at], [updated_at], [deleted_at], [userid]) VALUES (6, 3, CAST(N'2023-12-09T17:07:52.677' AS DateTime), CAST(N'2023-12-09T17:07:55.503' AS DateTime), NULL, 0)
INSERT [dbo].[trainee_course] ([trainee_id], [course_id], [created_at], [updated_at], [deleted_at], [userid]) VALUES (7, 2, CAST(N'2023-12-09T20:43:08.553' AS DateTime), NULL, NULL, 7)
SET IDENTITY_INSERT [dbo].[trainee_course] OFF
GO
SET IDENTITY_INSERT [dbo].[trainner_topic] ON 

INSERT [dbo].[trainner_topic] ([trainner_id], [topic_id], [created_at], [updated_at], [deleted_at], [userid]) VALUES (7, 6, CAST(N'2023-12-09T21:23:40.227' AS DateTime), NULL, NULL, 4)
SET IDENTITY_INSERT [dbo].[trainner_topic] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [role_id], [extra_code], [username], [password], [email], [phone], [address], [gender], [birthday], [avatar], [last_login], [last_logout], [status], [created_at], [updated_at], [deleted_at], [full_name], [education], [programming_language], [toeic_score], [experience], [department], [type]) VALUES (3, 0, N'MC01', N'admin', N'123456', N'thanh123@gmail.com', N'0997752127', N'30 Ð?ng Thùy Trâm', 0, CAST(N'1999-12-09' AS Date), NULL, NULL, NULL, 0, CAST(N'2023-12-09T20:02:53.523' AS DateTime), NULL, NULL, N'thanhpv', NULL, NULL, 0, NULL, NULL, 1)
INSERT [dbo].[users] ([id], [role_id], [extra_code], [username], [password], [email], [phone], [address], [gender], [birthday], [avatar], [last_login], [last_logout], [status], [created_at], [updated_at], [deleted_at], [full_name], [education], [programming_language], [toeic_score], [experience], [department], [type]) VALUES (4, 0, N'MCCC1', N'admin', N'123456', N'thanh123@gmail.com', N'0997752127', N'35 Ð?ng Thùy Trâm', 0, CAST(N'1999-12-09' AS Date), NULL, NULL, NULL, 0, CAST(N'2023-12-09T20:22:43.313' AS DateTime), NULL, NULL, N'thanhpv', NULL, NULL, 0, NULL, NULL, 1)
INSERT [dbo].[users] ([id], [role_id], [extra_code], [username], [password], [email], [phone], [address], [gender], [birthday], [avatar], [last_login], [last_logout], [status], [created_at], [updated_at], [deleted_at], [full_name], [education], [programming_language], [toeic_score], [experience], [department], [type]) VALUES (5, 0, N'okrrr', N'admin', N'123456', N'thanh12333@gmail.com', N'0997752127', N'90 Ð?ng Thùy Trâm', 0, CAST(N'2000-12-09' AS Date), NULL, NULL, NULL, 0, CAST(N'2023-12-09T20:24:32.847' AS DateTime), NULL, NULL, N'Thanh Phạm', NULL, NULL, 0, NULL, NULL, 1)
INSERT [dbo].[users] ([id], [role_id], [extra_code], [username], [password], [email], [phone], [address], [gender], [birthday], [avatar], [last_login], [last_logout], [status], [created_at], [updated_at], [deleted_at], [full_name], [education], [programming_language], [toeic_score], [experience], [department], [type]) VALUES (7, 0, N'aaaa', N'admin', N'123456', N'abc@gmail.com', N'0997752127', N'30 Ð?ng Thùy Trâm', 0, NULL, NULL, NULL, NULL, 0, CAST(N'2023-12-09T20:41:53.113' AS DateTime), NULL, NULL, N'aaaaa', N'avc', N'C#', 8, N'aaa', N'aaaaa', 2)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[categories] ADD  CONSTRAINT [DF_categories_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[courses] ADD  CONSTRAINT [DF_courses_vote]  DEFAULT ((0)) FOR [vote]
GO
ALTER TABLE [dbo].[courses] ADD  CONSTRAINT [DF_courses_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[roles] ADD  CONSTRAINT [DF_roles_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[topics] ADD  CONSTRAINT [DF_topics_staus]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[trainee_course] ADD  CONSTRAINT [DF_trainee_course_userid]  DEFAULT ((0)) FOR [userid]
GO
ALTER TABLE [dbo].[trainner_topic] ADD  CONSTRAINT [DF_trainner_topic_userid]  DEFAULT ((0)) FOR [userid]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_role_id]  DEFAULT ((0)) FOR [role_id]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_gender]  DEFAULT ((1)) FOR [gender]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_categories]
GO
ALTER TABLE [dbo].[topics]  WITH CHECK ADD  CONSTRAINT [FK_topics_courses] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[topics] CHECK CONSTRAINT [FK_topics_courses]
GO
ALTER TABLE [dbo].[trainee_course]  WITH CHECK ADD  CONSTRAINT [FK_trainee_course_courses] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[trainee_course] CHECK CONSTRAINT [FK_trainee_course_courses]
GO
USE [master]
GO
ALTER DATABASE [Tranning] SET  READ_WRITE 
GO
