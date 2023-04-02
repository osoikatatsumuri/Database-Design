USE master;

ALTER DATABASE Schedule SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

DROP DATABASE IF EXISTS Schedule;

CREATE DATABASE Schedule
COLLATE Cyrillic_General_CI_AS;

USE Schedule;

CREATE TABLE [Subject] (
	SubjectID int IDENTITY NOT NULL PRIMARY KEY CLUSTERED,	
	SubjectName nvarchar(50) NOT NULL,
		CONSTRAINT AK_Subject_SubjectName UNIQUE (SubjectName)
);

CREATE TABLE [Group] (
	GroupID int IDENTITY NOT NULL PRIMARY KEY CLUSTERED,
	Course tinyint NOT NULL DEFAULT 1,
		CONSTRAINT CK_Group_Course CHECK (Course BETWEEN 1 AND 5),
	GroupNumber nvarchar(10) NOT NULL UNIQUE,
	AmountOfStudents tinyint NOT NULL DEFAULT 10,
		CONSTRAINT CK_GROUP_AMOUNTOFSTUDENTS CHECK (AmountOfStudents BETWEEN 10 AND 30),
		CONSTRAINT UQ_Course_GroupNumber UNIQUE (Course, GroupNumber)

)


CREATE TABLE Teacher (
	TeacherID int IDENTITY NOT NULL PRIMARY KEY CLUSTERED,
	Surname nvarchar(30) NOT NULL,
	Name nvarchar(30) NOT NULL,
	Patronymic nvarchar(30) NULL,
	Adress nvarchar(50) NOT NULL,	
	Phone nvarchar(20) NOT NULL,
	AcademicDegree nvarchar(50) NOT NULL,
	AcademicPosition nvarchar(50) NOT NULL,
	Seniority tinyint NOT NULL,
)

CREATE TABLE Class (
	ClassID int IDENTITY NOT NULL PRIMARY KEY CLUSTERED,
	ClassTypeID int,
	GroupID int,
	SubjectID int,
	TeacherId int,
)

CREATE TABLE ClassSchedule (
	ClassScheduleID int IDENTITY NOT NULL PRIMARY KEY CLUSTERED,
	ClassID int, 
	StartTime time,
	EndTime time,
	CONSTRAINT CK_ClassSchedule_EndTime CHECK (EndTime > StartTime),
	Auditorium nvarchar(50)
)

CREATE TABLE ClassPlan (
	ClassPlanID int IDENTITY NOT NULL PRIMARY KEY CLUSTERED,
	ClassID int,
	AcademicHoursCount int
		CONSTRAINT CK_LessonPlan_AcademicHoursCount CHECK (AcademicHoursCount > 0)
)

ALTER TABLE Class
ADD CONSTRAINT FK_Class_Teacher
FOREIGN KEY (TeacherID)
REFERENCES Teacher (TeacherID);

ALTER TABLE Class
ADD CONSTRAINT FK_Class_Subject
FOREIGN KEY (SubjectID)
REFERENCES Subject (SubjectID)

ALTER TABLE Class
ADD CONSTRAINT FK_Class_Group
FOREIGN KEY (GroupID)
REFERENCES [Group] (GroupID)

ALTER TABLE ClassSchedule
ADD CONSTRAINT FK_ClassSchedule_Class
FOREIGN KEY (ClassID)
REFERENCES Class (ClassID);

ALTER TABLE ClassPlan
ADD CONSTRAINT FK_ClassPlan_Class
FOREIGN KEY (ClassID)
REFERENCES Class (ClassID);