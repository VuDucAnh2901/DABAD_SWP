USE [FreelancePlatform]
GO
/****** Object:  Table [dbo].[Apply]    Script Date: 6/5/2022 10:12:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apply](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FreelancerID] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
	[CreateDate] [date] NULL,
	[Bid] [int] NOT NULL,
	[ApplyStatusID] [int] NOT NULL,
 CONSTRAINT [PK__Apply__3214EC275B3AD714] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApplyStatus]    Script Date: 6/5/2022 10:12:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplyStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Description] [nvarchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company]    Script Date: 6/5/2022 10:12:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Location] [nvarchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerAccount]    Script Date: 6/5/2022 10:12:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAccount](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CompanyID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Field]    Script Date: 6/5/2022 10:12:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Field](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Description] [nvarchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FreelancerAccount]    Script Date: 6/5/2022 10:12:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FreelancerAccount](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Overview] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment]    Script Date: 6/5/2022 10:12:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ApplyID] [int] NULL,
	[Date] [datetime] NOT NULL,
	[PaymentMethod] [nvarchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Project]    Script Date: 6/5/2022 10:12:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Title] [nvarchar](64) NOT NULL,
	[Description] [nvarchar](128) NULL,
	[Duration] [nvarchar](64) NOT NULL,
	[Scope] [nvarchar](64) NOT NULL,
	[HrsPerWeek] [int] NOT NULL,
	[MaximumBudget] [int] NOT NULL,
	[FieldID] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreateDate] [date] NULL,
	[UpdateDate] [date] NULL,
 CONSTRAINT [PK__Project__3214EC273D899CAF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Report]    Script Date: 6/5/2022 10:12:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FreelancerID] [int] NULL,
	[ApplyID] [int] NULL,
	[CustomerID] [int] NULL,
	[Title] [nvarchar](64) NOT NULL,
	[Date] [datetime] NOT NULL,
	[ReportItem] [nvarchar](128) NOT NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Skill]    Script Date: 6/5/2022 10:12:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skill](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FreelancerID] [int] NULL,
	[TechID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tag]    Script Date: 6/5/2022 10:12:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FreelancerID] [int] NULL,
	[TechID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tech]    Script Date: 6/5/2022 10:12:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tech](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Description] [nvarchar](128) NOT NULL,
	[FieldID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 6/5/2022 10:12:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentID] [int] NULL,
	[FreelancerID] [int] NULL,
	[Amount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserAccount]    Script Date: 6/5/2022 10:12:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserAccount](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](128) NOT NULL,
	[Password] [varchar](32) NULL,
	[FullName] [nvarchar](128) NOT NULL,
	[Avatar] [varchar](128) NULL,
	[RoleID] [int] NOT NULL,
	[CreateDate] [date] NULL,
	[Balance] [float] NOT NULL,
	[Status] [int] NOT NULL,
	[UpdateDate] [date] NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
 CONSTRAINT [PK__UserAcco__3214EC27E22AC880] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__UserAcco__A9D10534B22722E8] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Apply]  WITH CHECK ADD  CONSTRAINT [FK__Apply__ApplyStat__300424B4] FOREIGN KEY([ApplyStatusID])
REFERENCES [dbo].[ApplyStatus] ([ID])
GO
ALTER TABLE [dbo].[Apply] CHECK CONSTRAINT [FK__Apply__ApplyStat__300424B4]
GO
ALTER TABLE [dbo].[Apply]  WITH CHECK ADD  CONSTRAINT [FK__Apply__Freelance__2E1BDC42] FOREIGN KEY([FreelancerID])
REFERENCES [dbo].[FreelancerAccount] ([ID])
GO
ALTER TABLE [dbo].[Apply] CHECK CONSTRAINT [FK__Apply__Freelance__2E1BDC42]
GO
ALTER TABLE [dbo].[Apply]  WITH CHECK ADD  CONSTRAINT [FK__Apply__ProjectID__2F10007B] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ID])
GO
ALTER TABLE [dbo].[Apply] CHECK CONSTRAINT [FK__Apply__ProjectID__2F10007B]
GO
ALTER TABLE [dbo].[CustomerAccount]  WITH CHECK ADD FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[CustomerAccount]  WITH CHECK ADD  CONSTRAINT [FK__CustomerA__UserI__182C9B23] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserAccount] ([ID])
GO
ALTER TABLE [dbo].[CustomerAccount] CHECK CONSTRAINT [FK__CustomerA__UserI__182C9B23]
GO
ALTER TABLE [dbo].[FreelancerAccount]  WITH CHECK ADD  CONSTRAINT [FK__Freelance__UserI__1367E606] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserAccount] ([ID])
GO
ALTER TABLE [dbo].[FreelancerAccount] CHECK CONSTRAINT [FK__Freelance__UserI__1367E606]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK__Payment__ApplyID__37A5467C] FOREIGN KEY([ApplyID])
REFERENCES [dbo].[Apply] ([ID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK__Payment__ApplyID__37A5467C]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK__Project__Custome__24927208] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CustomerAccount] ([ID])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK__Project__Custome__24927208]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK__Project__FieldID__25869641] FOREIGN KEY([FieldID])
REFERENCES [dbo].[Field] ([ID])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK__Project__FieldID__25869641]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK__Report__ApplyID__33D4B598] FOREIGN KEY([ApplyID])
REFERENCES [dbo].[Apply] ([ID])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK__Report__ApplyID__33D4B598]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CustomerAccount] ([ID])
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD FOREIGN KEY([FreelancerID])
REFERENCES [dbo].[FreelancerAccount] ([ID])
GO
ALTER TABLE [dbo].[Skill]  WITH CHECK ADD FOREIGN KEY([FreelancerID])
REFERENCES [dbo].[FreelancerAccount] ([ID])
GO
ALTER TABLE [dbo].[Skill]  WITH CHECK ADD FOREIGN KEY([TechID])
REFERENCES [dbo].[Tech] ([ID])
GO
ALTER TABLE [dbo].[Tag]  WITH CHECK ADD FOREIGN KEY([FreelancerID])
REFERENCES [dbo].[FreelancerAccount] ([ID])
GO
ALTER TABLE [dbo].[Tag]  WITH CHECK ADD FOREIGN KEY([TechID])
REFERENCES [dbo].[Tech] ([ID])
GO
ALTER TABLE [dbo].[Tech]  WITH CHECK ADD FOREIGN KEY([FieldID])
REFERENCES [dbo].[Field] ([ID])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([FreelancerID])
REFERENCES [dbo].[FreelancerAccount] ([ID])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([PaymentID])
REFERENCES [dbo].[Payment] ([ID])
GO

----Trigger for create/update
--User
CREATE TRIGGER User_CreateDate ON UserAccount AFTER INSERT AS
BEGIN
	UPDATE UserAccount SET CreateDate = (SELECT CAST(GETDATE() AS DATE))
	UPDATE UserAccount SET UpdateDate = (SELECT CAST(GETDATE() AS DATE))
END

CREATE TRIGGER User_UpdateDate ON UserAccount AFTER UPDATE AS
BEGIN
	UPDATE UserAccount SET UpdateDate = (SELECT CAST(GETDATE() AS DATE))
END

--Project
CREATE TRIGGER Project_CreateDate ON Project AFTER INSERT AS
BEGIN
	UPDATE Project SET CreateDate = (SELECT CAST(GETDATE() AS DATE))
	UPDATE Project SET UpdateDate = (SELECT CAST(GETDATE() AS DATE))
END

CREATE TRIGGER Project_UpdateDate ON Project AFTER UPDATE AS
BEGIN
	UPDATE Project SET UpdateDate = (SELECT CAST(GETDATE() AS DATE))
END

--Apply
CREATE TRIGGER Apply_CreateDate ON Apply AFTER INSERT AS
BEGIN
	UPDATE Apply SET CreateDate = (SELECT CAST(GETDATE() AS DATE))
END