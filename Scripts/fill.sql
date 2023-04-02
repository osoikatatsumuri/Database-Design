USE Schedule;

DECLARE @subjectIndex int = 1;
WHILE (@subjectIndex <= 30)
BEGIN
    INSERT INTO [Subject] (SubjectName)
    VALUES (N'Предмет ' + CAST(@subjectIndex AS nvarchar));
    SET @subjectIndex = @subjectIndex + 1;
END;

DECLARE @groupIndex int = 1;
WHILE (@groupIndex <= 30)
BEGIN
    INSERT INTO [Group] (Course, GroupNumber, AmountOfStudents)
    VALUES ((@groupIndex % 5) + 1, N'Группа ' + CAST(@groupIndex AS nvarchar), 10 + (@groupIndex % 21));
    SET @groupIndex = @groupIndex + 1;
END;

DECLARE @teacherIndex int = 1;
WHILE (@teacherIndex <= 30)
BEGIN
    INSERT INTO Teacher (Surname, Name, Patronymic, Adress, Phone, AcademicDegree, AcademicPosition, Seniority)
    VALUES (N'Фамилия ' + CAST(@teacherIndex AS nvarchar), N'Имя ' + CAST(@teacherIndex AS nvarchar), N'Отчество ' + CAST(@teacherIndex AS nvarchar), N'Адрес ' + CAST(@teacherIndex AS nvarchar), N'8950123456' + CAST((@teacherIndex % 10) AS nvarchar), N'Кандидат наук', 'Доцент', @teacherIndex % 15);
    SET @teacherIndex = @teacherIndex + 1;
END;

DECLARE @classIndex int = 1;
WHILE (@classIndex <= 200)
BEGIN
    INSERT INTO Class (ClassTypeID, GroupID, SubjectID, TeacherID)
    VALUES ((@classIndex % 3) + 1, (@classIndex % 30) + 1, (@classIndex % 30) + 1, (@classIndex % 30) + 1);
    SET @classIndex = @classIndex + 1;
END;

DECLARE @classScheduleIndex int = 1;
WHILE (@classScheduleIndex <= 200)
BEGIN
    INSERT INTO ClassSchedule (ClassID, StartTime, EndTime, Auditorium)
    VALUES (@classScheduleIndex, DATEADD(minute, 80 * ((@classScheduleIndex - 1) % 4), '08:15:00'), DATEADD(minute, 80 * ((@classScheduleIndex - 1) % 4) + 80, '08:15:00'), N'Ауд. ' + CAST((@classScheduleIndex % 20) + 100 AS nvarchar));
    SET @classScheduleIndex = @classScheduleIndex + 1;
END;

DECLARE @classPlanIndex int = 1;
WHILE (@classPlanIndex <= 200)
BEGIN
    INSERT INTO ClassPlan (ClassID, AcademicHoursCount)
    VALUES (@classPlanIndex, 20 + (@classPlanIndex % 30));
    SET @classPlanIndex = @classPlanIndex + 1;
END;
