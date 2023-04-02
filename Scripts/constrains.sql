USE Schedule

SELECT *
FROM ClassSchedule

INSERT INTO [Group] (Course, GroupNumber, AmountOfStudents)
VALUES (1, 'Группа 58', 5)

INSERT INTO [Group] (Course, GroupNumber, AmountOfStudents)
VALUES(1, 'Группа 58', 35)

INSERT INTO [Group] (Course, GroupNumber, AmountOfStudents)
VALUES(1, 'Группа 1', 25)

INSERT INTO [Group] (Course, GroupNumber, AmountOfStudents)
VALUES(6, 'Группа 58', 20)


INSERT INTO Subject (SubjectName)
VALUES('Предмет 1')


INSERT INTO ClassPlan (ClassID, AcademicHoursCount)
VALUES(1, -5)


INSERT INTO ClassSchedule (ClassID, StartTime, EndTime, Auditorium)
VALUES(1, '08:15:00', '09:35:00')