CREATE DATABASE [StaffordUniversity];
Go
Use [StaffordUniversity];


------------------------- Create Tables --------------------
--FACULTY table
CREATE TABLE [dbo].[FACULTY](
	[FacultyName] [varchar](10) NOT NULL,
	[Dean] [varchar](30) NOT NULL,
	[Building] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[FacultyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
--Program Table
CREATE TABLE [dbo].[PROGRAM](
	[ProgramCode] [varchar](10) NOT NULL,
	[Level] [varchar](20) NOT NULL,
	[Title] [varchar](40) NOT NULL,
	[Duration] [varchar](20) NOT NULL,
	[FacultyName] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[ProgramCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[PROGRAM]  WITH CHECK ADD FOREIGN KEY([FacultyName])
REFERENCES [dbo].[FACULTY] ([FacultyName])
GO

--Course Table
CREATE TABLE [dbo].[COURSE](
	[CourseID] [varchar](10) NOT NULL,
	[CourseName] [varchar](40) NOT NULL,
	[ProgramCode] [varchar](10) NOT NULL,
	[Course_ID] [varchar](10) NULL,
PRIMARY KEY CLUSTERED
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[COURSE]  WITH CHECK ADD FOREIGN KEY([Course_ID])
REFERENCES [dbo].[COURSE] ([CourseID])
GO

ALTER TABLE [dbo].[COURSE]  WITH CHECK ADD FOREIGN KEY([ProgramCode])
REFERENCES [dbo].[PROGRAM] ([ProgramCode])
GO

--Committee Table
CREATE TABLE [dbo].[COMMITTEE](
	[CommitteeName] [varchar](50) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[FacultyName] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[CommitteeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[COMMITTEE]  WITH CHECK ADD FOREIGN KEY([FacultyName])
REFERENCES [dbo].[FACULTY] ([FacultyName])
GO

--Supervisor Table
CREATE TABLE [dbo].[SUPERVISOR](
	[SupervisorID] [varchar](10) NOT NULL,
	[SupervisorName] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[SupervisorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- Lecturer Table
CREATE TABLE [dbo].[LECTURER](
	[LecturerID] [varchar](10) NOT NULL,
	[LecturerName] [varchar](40) NOT NULL,
	[OfficeRoom] [varchar](40) NOT NULL,
	[Title] [varchar](40) NOT NULL,
	[SupervisorID] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[LecturerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[LECTURER]  WITH CHECK ADD FOREIGN KEY([SupervisorID])
REFERENCES [dbo].[SUPERVISOR] ([SupervisorID])
GO

-- Lecturer  Committee Table
CREATE TABLE [dbo].[LECTURER_COMMITTEE](
	[LecturerID] [varchar](10) NOT NULL,
	[CommitteeName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[LecturerID] ASC,
	[CommitteeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[LECTURER_COMMITTEE]  WITH CHECK ADD FOREIGN KEY([CommitteeName])
REFERENCES [dbo].[COMMITTEE] ([CommitteeName])
GO

ALTER TABLE [dbo].[LECTURER_COMMITTEE]  WITH CHECK ADD FOREIGN KEY([LecturerID])
REFERENCES [dbo].[LECTURER] ([LecturerID])
GO

-- Lecturer Course Table
CREATE TABLE [dbo].[LECTURER_COURSE](
	[LecturerID] [varchar](10) NOT NULL,
	[CourseID] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[LecturerID] ASC,
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[LECTURER_COURSE]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[COURSE] ([CourseID])
GO

ALTER TABLE [dbo].[LECTURER_COURSE]  WITH CHECK ADD FOREIGN KEY([LecturerID])
REFERENCES [dbo].[LECTURER] ([LecturerID])
GO

--Student Table
CREATE TABLE [dbo].[STUDENT](
	[StudentID] [varchar](10) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](40) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[YearEnrolled] [date] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--Student Course Table
CREATE TABLE [dbo].[STUDENT_COURSE](
	[StudentID] [varchar](10) NOT NULL,
	[CourseID] [varchar](10) NOT NULL,
	[Grade] [char](1) NOT NULL,
	[Term] [varchar](20) NOT NULL,
	[Year] [date] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[StudentID] ASC,
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[STUDENT_COURSE]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[COURSE] ([CourseID])
GO

ALTER TABLE [dbo].[STUDENT_COURSE]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[STUDENT] ([StudentID])
GO
