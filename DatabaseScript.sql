USE [master]
GO
/****** Object:  Database [Mentor_on_Demand]    Script Date: 11/20/2019 6:43:01 PM ******/
CREATE DATABASE [Mentor_on_Demand]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Mentor_on_Demand', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Mentor_on_Demand.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Mentor_on_Demand_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Mentor_on_Demand_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Mentor_on_Demand] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Mentor_on_Demand].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Mentor_on_Demand] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Mentor_on_Demand] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Mentor_on_Demand] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Mentor_on_Demand] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Mentor_on_Demand] SET ARITHABORT OFF 
GO
ALTER DATABASE [Mentor_on_Demand] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Mentor_on_Demand] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Mentor_on_Demand] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Mentor_on_Demand] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Mentor_on_Demand] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Mentor_on_Demand] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Mentor_on_Demand] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Mentor_on_Demand] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Mentor_on_Demand] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Mentor_on_Demand] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Mentor_on_Demand] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Mentor_on_Demand] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Mentor_on_Demand] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Mentor_on_Demand] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Mentor_on_Demand] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Mentor_on_Demand] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Mentor_on_Demand] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Mentor_on_Demand] SET RECOVERY FULL 
GO
ALTER DATABASE [Mentor_on_Demand] SET  MULTI_USER 
GO
ALTER DATABASE [Mentor_on_Demand] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Mentor_on_Demand] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Mentor_on_Demand] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Mentor_on_Demand] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Mentor_on_Demand] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Mentor_on_Demand]
GO
/****** Object:  Table [dbo].[Mentor]    Script Date: 11/20/2019 6:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mentor](
	[id] [int] IDENTITY(1000,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[mentor_password] [nvarchar](16) NOT NULL,
	[first_name] [nvarchar](20) NOT NULL,
	[last_name] [nvarchar](20) NULL,
	[contact_number] [bigint] NOT NULL,
	[reg_datetime] [datetime] NULL,
	[reg_code] [nvarchar](10) NULL CONSTRAINT [Default_Code]  DEFAULT ('000'),
	[force_reset_password] [bit] NULL DEFAULT ((0)),
	[linkedin_url] [nvarchar](100) NULL,
	[years_of_experience] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mentor_Skills]    Script Date: 11/20/2019 6:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mentor_Skills](
	[id] [int] IDENTITY(1000,1) NOT NULL,
	[m_id] [int] NULL,
	[s_id] [int] NULL,
	[self_rating] [decimal](3, 1) NULL,
	[years_of_exp] [int] NULL,
	[trainings_delivered] [int] NULL,
	[facilities_offered] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Skills]    Script Date: 11/20/2019 6:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skills](
	[id] [int] IDENTITY(1000,1) NOT NULL,
	[s_name] [nvarchar](30) NOT NULL,
	[s_toc] [nvarchar](20) NULL CONSTRAINT [Default_TOC]  DEFAULT ('000'),
	[s_duration_hrs] [int] NOT NULL,
	[prerequisites] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_Admin]    Script Date: 11/20/2019 6:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Admin](
	[id] [int] IDENTITY(1000,1) NOT NULL,
	[username] [nvarchar](20) NOT NULL,
	[ad_password] [nvarchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Trainings]    Script Date: 11/20/2019 6:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainings](
	[id] [int] IDENTITY(1000,1) NOT NULL,
	[userid] [int] NULL,
	[mentor_id] [int] NULL,
	[skill_id] [int] NULL,
	[status] [nvarchar](15) NULL DEFAULT ('Pending'),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserDtls]    Script Date: 11/20/2019 6:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDtls](
	[id] [int] IDENTITY(1000,1) NOT NULL,
	[username] [nvarchar](20) NOT NULL,
	[user_password] [nvarchar](16) NOT NULL,
	[first_name] [nvarchar](20) NOT NULL,
	[last_name] [nvarchar](20) NULL,
	[contact_number] [bigint] NOT NULL,
	[reg_datetime] [datetime] NULL,
	[reg_code] [nvarchar](10) NULL CONSTRAINT [Default_Reg_Code]  DEFAULT ('000'),
	[force_reset_password] [bit] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Mentor] ON 

GO
INSERT [dbo].[Mentor] ([id], [username], [mentor_password], [first_name], [last_name], [contact_number], [reg_datetime], [reg_code], [force_reset_password], [linkedin_url], [years_of_experience]) VALUES (1002, N'iris.jestin@gmail.com', N'iris', N'Iris', N'Jestin', 6758493021, CAST(N'2019-02-14 15:00:00.000' AS DateTime), N'000', 0, N'www.linkedin.com/iris.jestin', 4)
GO
INSERT [dbo].[Mentor] ([id], [username], [mentor_password], [first_name], [last_name], [contact_number], [reg_datetime], [reg_code], [force_reset_password], [linkedin_url], [years_of_experience]) VALUES (1003, N'samuel.george@gmail.com', N'samuel', N'Samuel', N'George', 6753493022, CAST(N'2019-03-14 15:00:00.000' AS DateTime), N'000', 0, N'www.linkedin.com/samuel.george', 5)
GO
INSERT [dbo].[Mentor] ([id], [username], [mentor_password], [first_name], [last_name], [contact_number], [reg_datetime], [reg_code], [force_reset_password], [linkedin_url], [years_of_experience]) VALUES (1004, N'mathew.jovit@gmail.com', N'mathew', N'Mathew', N'Jovit', 3758493021, CAST(N'2013-12-14 03:00:00.000' AS DateTime), N'000', 0, N'www.linkedin.com/mathew.jovit', 12)
GO
INSERT [dbo].[Mentor] ([id], [username], [mentor_password], [first_name], [last_name], [contact_number], [reg_datetime], [reg_code], [force_reset_password], [linkedin_url], [years_of_experience]) VALUES (1005, N'joseph.chungath@gmail.com', N'chungath', N'Joseph', N'Chungath', 7158493021, CAST(N'2017-12-14 15:00:00.000' AS DateTime), N'000', 0, N'www.linkedin.com/joseph.chungath', 6)
GO
SET IDENTITY_INSERT [dbo].[Mentor] OFF
GO
SET IDENTITY_INSERT [dbo].[Mentor_Skills] ON 

GO
INSERT [dbo].[Mentor_Skills] ([id], [m_id], [s_id], [self_rating], [years_of_exp], [trainings_delivered], [facilities_offered]) VALUES (1000, 1002, 1000, CAST(9.2 AS Decimal(3, 1)), 4, 8, N'Hands-on Workshop')
GO
INSERT [dbo].[Mentor_Skills] ([id], [m_id], [s_id], [self_rating], [years_of_exp], [trainings_delivered], [facilities_offered]) VALUES (1001, 1003, 1001, CAST(9.8 AS Decimal(3, 1)), 5, 12, N'Online Course')
GO
INSERT [dbo].[Mentor_Skills] ([id], [m_id], [s_id], [self_rating], [years_of_exp], [trainings_delivered], [facilities_offered]) VALUES (1002, 1004, 1002, CAST(9.9 AS Decimal(3, 1)), 10, 35, N'Classroom Training')
GO
INSERT [dbo].[Mentor_Skills] ([id], [m_id], [s_id], [self_rating], [years_of_exp], [trainings_delivered], [facilities_offered]) VALUES (1003, 1005, 1001, CAST(8.2 AS Decimal(3, 1)), 2, 5, N'Hands-on Session')
GO
SET IDENTITY_INSERT [dbo].[Mentor_Skills] OFF
GO
SET IDENTITY_INSERT [dbo].[Skills] ON 

GO
INSERT [dbo].[Skills] ([id], [s_name], [s_toc], [s_duration_hrs], [prerequisites]) VALUES (1000, N'Java', N'Programming', 12, N'NIL')
GO
INSERT [dbo].[Skills] ([id], [s_name], [s_toc], [s_duration_hrs], [prerequisites]) VALUES (1001, N'Python', N'Programming', 8, N'NIL')
GO
INSERT [dbo].[Skills] ([id], [s_name], [s_toc], [s_duration_hrs], [prerequisites]) VALUES (1002, N'.NET Core', N'Framework', 40, N'Basic Programming in any language')
GO
SET IDENTITY_INSERT [dbo].[Skills] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Admin] ON 

GO
INSERT [dbo].[Tbl_Admin] ([id], [username], [ad_password]) VALUES (1000, N'admin', N'admin')
GO
SET IDENTITY_INSERT [dbo].[Tbl_Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Trainings] ON 

GO
INSERT [dbo].[Trainings] ([id], [userid], [mentor_id], [skill_id], [status]) VALUES (1001, 1001, 1003, 1000, N'Pending')
GO
INSERT [dbo].[Trainings] ([id], [userid], [mentor_id], [skill_id], [status]) VALUES (1002, 1000, 1002, 1001, N'Confirmed')
GO
INSERT [dbo].[Trainings] ([id], [userid], [mentor_id], [skill_id], [status]) VALUES (1003, 1000, 1004, 1002, N'Pending')
GO
INSERT [dbo].[Trainings] ([id], [userid], [mentor_id], [skill_id], [status]) VALUES (1004, 1003, 1004, 1002, N'Pending')
GO
INSERT [dbo].[Trainings] ([id], [userid], [mentor_id], [skill_id], [status]) VALUES (1005, 1000, 1002, 1000, N'Pending')
GO
INSERT [dbo].[Trainings] ([id], [userid], [mentor_id], [skill_id], [status]) VALUES (1006, 1000, 1003, 1001, N'Pending')
GO
INSERT [dbo].[Trainings] ([id], [userid], [mentor_id], [skill_id], [status]) VALUES (1007, 1003, 1003, 1001, N'Pending')
GO
INSERT [dbo].[Trainings] ([id], [userid], [mentor_id], [skill_id], [status]) VALUES (1008, 1003, 1003, 1001, N'Pending')
GO
INSERT [dbo].[Trainings] ([id], [userid], [mentor_id], [skill_id], [status]) VALUES (1009, 1001, 1004, 1002, N'Pending')
GO
INSERT [dbo].[Trainings] ([id], [userid], [mentor_id], [skill_id], [status]) VALUES (1010, 1000, 1004, 1002, N'Pending')
GO
SET IDENTITY_INSERT [dbo].[Trainings] OFF
GO
SET IDENTITY_INSERT [dbo].[UserDtls] ON 

GO
INSERT [dbo].[UserDtls] ([id], [username], [user_password], [first_name], [last_name], [contact_number], [reg_datetime], [reg_code], [force_reset_password]) VALUES (1000, N'finu.nazar@gmail.com', N'finu', N'Finu', N'Nazar', 1234567899, CAST(N'2019-10-12 10:20:00.000' AS DateTime), N'1000', 0)
GO
INSERT [dbo].[UserDtls] ([id], [username], [user_password], [first_name], [last_name], [contact_number], [reg_datetime], [reg_code], [force_reset_password]) VALUES (1001, N'venky.guru@gmail.com', N'venky', N'Venkatesan', N'Gurusamy', 1234567849, CAST(N'2019-09-03 11:20:00.000' AS DateTime), N'000', 0)
GO
INSERT [dbo].[UserDtls] ([id], [username], [user_password], [first_name], [last_name], [contact_number], [reg_datetime], [reg_code], [force_reset_password]) VALUES (1002, N'goat.gopal@gmail.com', N'goat', N'Gautam', N'Gopal', 1244567899, CAST(N'2018-07-27 14:20:00.000' AS DateTime), N'000', 0)
GO
INSERT [dbo].[UserDtls] ([id], [username], [user_password], [first_name], [last_name], [contact_number], [reg_datetime], [reg_code], [force_reset_password]) VALUES (1003, N'a.hitler@gmail.com', N'hitler', N'Adolf', N'Hitler', 5757589898, CAST(N'2017-12-18 12:20:00.000' AS DateTime), N'000', 0)
GO
INSERT [dbo].[UserDtls] ([id], [username], [user_password], [first_name], [last_name], [contact_number], [reg_datetime], [reg_code], [force_reset_password]) VALUES (1004, N'm.manoj@gmail.com', N'mervin', N'Mervin', N'Manoj', 5334567849, CAST(N'2017-11-03 23:20:00.000' AS DateTime), N'000', 0)
GO
INSERT [dbo].[UserDtls] ([id], [username], [user_password], [first_name], [last_name], [contact_number], [reg_datetime], [reg_code], [force_reset_password]) VALUES (1006, N'venessa@gmail.com', N'venessa', N'Venessa', N'Quadros', 3239514681, CAST(N'2019-11-19 13:07:25.000' AS DateTime), N'000', 0)
GO
SET IDENTITY_INSERT [dbo].[UserDtls] OFF
GO
/****** Object:  Index [UQ__Mentor__A1D1BF21C017D356]    Script Date: 11/20/2019 6:43:01 PM ******/
ALTER TABLE [dbo].[Mentor] ADD UNIQUE NONCLUSTERED 
(
	[contact_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Mentor__F3DBC5728F36FE49]    Script Date: 11/20/2019 6:43:01 PM ******/
ALTER TABLE [dbo].[Mentor] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Mentor__F3DBC572ADA4C3CA]    Script Date: 11/20/2019 6:43:01 PM ******/
ALTER TABLE [dbo].[Mentor] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Skills__8D00F45A08A0F7DD]    Script Date: 11/20/2019 6:43:01 PM ******/
ALTER TABLE [dbo].[Skills] ADD UNIQUE NONCLUSTERED 
(
	[s_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Tbl_Admi__F3DBC572E2CBDF5B]    Script Date: 11/20/2019 6:43:01 PM ******/
ALTER TABLE [dbo].[Tbl_Admin] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__UserDtls__A1D1BF211889E60D]    Script Date: 11/20/2019 6:43:01 PM ******/
ALTER TABLE [dbo].[UserDtls] ADD UNIQUE NONCLUSTERED 
(
	[contact_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__UserDtls__F3DBC57295240848]    Script Date: 11/20/2019 6:43:01 PM ******/
ALTER TABLE [dbo].[UserDtls] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Mentor_Skills]  WITH CHECK ADD  CONSTRAINT [FK_MS_Mentor] FOREIGN KEY([m_id])
REFERENCES [dbo].[Mentor] ([id])
GO
ALTER TABLE [dbo].[Mentor_Skills] CHECK CONSTRAINT [FK_MS_Mentor]
GO
ALTER TABLE [dbo].[Mentor_Skills]  WITH CHECK ADD  CONSTRAINT [FK_MS_Skills] FOREIGN KEY([s_id])
REFERENCES [dbo].[Skills] ([id])
GO
ALTER TABLE [dbo].[Mentor_Skills] CHECK CONSTRAINT [FK_MS_Skills]
GO
ALTER TABLE [dbo].[Trainings]  WITH CHECK ADD  CONSTRAINT [FK_Trainings_Mentor] FOREIGN KEY([mentor_id])
REFERENCES [dbo].[Mentor] ([id])
GO
ALTER TABLE [dbo].[Trainings] CHECK CONSTRAINT [FK_Trainings_Mentor]
GO
ALTER TABLE [dbo].[Trainings]  WITH CHECK ADD  CONSTRAINT [FK_Trainings_Skills] FOREIGN KEY([skill_id])
REFERENCES [dbo].[Skills] ([id])
GO
ALTER TABLE [dbo].[Trainings] CHECK CONSTRAINT [FK_Trainings_Skills]
GO
ALTER TABLE [dbo].[Trainings]  WITH CHECK ADD  CONSTRAINT [FK_Trainings_User] FOREIGN KEY([userid])
REFERENCES [dbo].[UserDtls] ([id])
GO
ALTER TABLE [dbo].[Trainings] CHECK CONSTRAINT [FK_Trainings_User]
GO
/****** Object:  StoredProcedure [dbo].[addNewSkill]    Script Date: 11/20/2019 6:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[addNewSkill] @name nvarchar(30), @toc nvarchar(20), @duration int, @prereq nvarchar(100)
as
	INSERT INTO [dbo].[Skills]
           ([s_name]
           ,[s_toc]
           ,[s_duration_hrs]
           ,[prerequisites])
     VALUES
           (@name
           ,@toc
           ,@duration
           ,@prereq)
GO
/****** Object:  StoredProcedure [dbo].[addSkillForMentor]    Script Date: 11/20/2019 6:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[addSkillForMentor] @mid int, @sid int, @rating decimal(3,1), @yoe int, @trainingsDelivered int, @facilitiesOffered nvarchar(100)
as
	INSERT INTO [dbo].[Mentor_Skills]
           ([m_id]
           ,[s_id]
           ,[self_rating]
           ,[years_of_exp]
           ,[trainings_delivered]
           ,[facilities_offered])
     VALUES
           (@mid
           ,@sid
           ,@rating
           ,@yoe
           ,@trainingsDelivered
           ,@facilitiesOffered)
GO
/****** Object:  StoredProcedure [dbo].[authenticateAdmin]    Script Date: 11/20/2019 6:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[authenticateAdmin] @username nvarchar(20), @password nvarchar(16)
as
	select id, username, ad_password from Tbl_Admin where username=@username and ad_password=@password
GO
/****** Object:  StoredProcedure [dbo].[authenticateMentor]    Script Date: 11/20/2019 6:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[authenticateMentor] @username nvarchar(20), @password nvarchar(16)
as
	select id, username,mentor_password,first_name,last_name,contact_number,reg_datetime,reg_code,force_reset_password,linkedin_url,years_of_experience from Mentor where username=@username and mentor_password=@password
GO
/****** Object:  StoredProcedure [dbo].[authenticateUser]    Script Date: 11/20/2019 6:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[authenticateUser] @username nvarchar(20), @password nvarchar(16)
as
	select id,username,user_password,first_name,last_name,contact_number,reg_datetime,reg_code,force_reset_password from UserDtls where username=@username and user_password=@password
GO
/****** Object:  StoredProcedure [dbo].[editMentorProfile]    Script Date: 11/20/2019 6:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[editMentorProfile] @username nvarchar(20), @mentor_password nvarchar(16), @firstName nvarchar(20), @lastName nvarchar(20),
	@contactNumber bigint, @linkedinURL nvarchar(100), @yoe int, @mid int
as
	update Mentor set username=@username, mentor_password=@mentor_password, first_name=@firstName, last_name=@lastName,
		contact_number=@contactNumber, linkedin_url=@linkedinURL, years_of_experience=@yoe where id=@mid
GO
/****** Object:  StoredProcedure [dbo].[editSkill]    Script Date: 11/20/2019 6:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[editSkill] @toc nvarchar(20), @duration int, @prereq nvarchar(100), @id int
as
	update Skills set s_toc=@toc, s_duration_hrs=@duration, prerequisites=@prereq where id=@id
GO
/****** Object:  StoredProcedure [dbo].[getAllMentors]    Script Date: 11/20/2019 6:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getAllMentors]
as
	select id,username,mentor_password,first_name,last_name,contact_number,reg_datetime,reg_code,force_reset_password,linkedin_url,years_of_experience from Mentor
GO
/****** Object:  StoredProcedure [dbo].[getAllMentorsDetails]    Script Date: 11/20/2019 6:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[getAllMentorsDetails] 
as
	select M.id as MentorId, M.username as MentorEmail, M.contact_number as MentorPhone, M.first_name as MentorFirstName, M.last_name as MentorLastName,
		M.linkedin_url as MentorLinkedInURL, M.years_of_experience as MentorYOE,
		MS.self_rating as MentorSkillRating, MS.trainings_delivered as MentorSkillTrainingsDelivered, MS.years_of_exp as MentorSkillYOE,
		MS.facilities_offered as MentorSkillFacilitiesOffered,
		S.s_name as MentorSkillName, S.id as MentorSkillId
	from Mentor as M, Mentor_Skills as MS, Skills as S where M.id=MS.m_id and MS.s_id=S.id
GO
/****** Object:  StoredProcedure [dbo].[getAllSkills]    Script Date: 11/20/2019 6:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getAllSkills]
as
	select id, s_name,s_toc,s_duration_hrs,prerequisites from Skills
GO
/****** Object:  StoredProcedure [dbo].[getAllTechnologies]    Script Date: 11/20/2019 6:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getAllTechnologies]
as
	select id, s_name, s_toc, s_duration_hrs, prerequisites from Skills
GO
/****** Object:  StoredProcedure [dbo].[getAllTrainingsForMentor]    Script Date: 11/20/2019 6:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getAllTrainingsForMentor] @mid int
as
	select T.id as TrainingId, S.id as SkillId, S.s_name as SkillName, S.s_duration_hrs as Duration, U.first_name as UserFirstName, U.last_name as UserLastName, U.contact_number as UserContactNumber, U.username as UserEmail, T.[status] as TrainingStatus from Skills as S, UserDtls as U,Trainings as T where T.skill_id=S.id and T.userid=U.id and T.mentor_id=@mid
GO
/****** Object:  StoredProcedure [dbo].[getAllUsers]    Script Date: 11/20/2019 6:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getAllUsers]
as
	select id, username, user_password, first_name, last_name, contact_number, reg_datetime, reg_code, force_reset_password from UserDtls
GO
/****** Object:  StoredProcedure [dbo].[getSkillsForMentor]    Script Date: 11/20/2019 6:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getSkillsForMentor] @id int
as
	select MS.id as MentorSkillId, S.id as SkillId, S.s_name as SkillName, S.s_duration_hrs as SkillDuration, S.s_toc as SToc, 
	MS.self_rating as MentorSkillRating, MS.trainings_delivered as MentorSkillRTrainingsDelivered, MS.years_of_exp as MentorSkillYoe, 
	MS.facilities_offered as MentorSkillFacilities
	from Mentor_Skills as MS,Skills as S where MS.s_id=S.id and MS.m_id=@id
GO
/****** Object:  StoredProcedure [dbo].[registerNewMentor]    Script Date: 11/20/2019 6:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[registerNewMentor] @username nvarchar(20), @m_password nvarchar(16),@firstName nvarchar(20), @lastName nvarchar(20),
	@contactNumber bigint, @reg_datetime datetime, @linkedinUrl nvarchar(100), @yoe int
as
	INSERT INTO [dbo].[Mentor]
           ([username]
           ,[mentor_password]
           ,[first_name]
           ,[last_name]
           ,[contact_number]
           ,[reg_datetime]
           ,[linkedin_url]
           ,[years_of_experience])
     VALUES
           (@username
           ,@m_password
           ,@firstName
           ,@lastName
           ,@contactNumber
           ,@reg_datetime
           ,@linkedinUrl
           ,@yoe)

GO
/****** Object:  StoredProcedure [dbo].[registerNewUser]    Script Date: 11/20/2019 6:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[registerNewUser] @username nvarchar(20), @user_password nvarchar(16), @firstName nvarchar(20), @lastName nvarchar(20)
	, @contactNumber bigint, @regDateTime datetime
as
	INSERT INTO [dbo].[UserDtls]
           ([username]
           ,[user_password]
           ,[first_name]
           ,[last_name]
           ,[contact_number]
           ,[reg_datetime])
     VALUES
           (@username,
		   @user_password,
		   @firstName,
		   @lastName,
		   @contactNumber,
		   @regDateTime)
GO
/****** Object:  StoredProcedure [dbo].[setTraining]    Script Date: 11/20/2019 6:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[setTraining] @userid int, @mentorid int, @skillid int
as
	INSERT INTO [dbo].[Trainings]
           ([userid]
           ,[mentor_id]
           ,[skill_id])
     VALUES
           (@userid
           ,@mentorid
           ,@skillid)
GO
/****** Object:  StoredProcedure [dbo].[updateTrainingStatus]    Script Date: 11/20/2019 6:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updateTrainingStatus] @tid int, @status nvarchar(15)
as
	update Trainings set [status]=@status where id=@tid
GO
USE [master]
GO
ALTER DATABASE [Mentor_on_Demand] SET  READ_WRITE 
GO
