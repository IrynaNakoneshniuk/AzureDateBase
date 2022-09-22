-------------------------------------------QUERY-1----------------------------------------<|
----------------Вивести назви аудиторій, де читає лекції викладач “Edward Hopper”---------<|
USE ACADEMY2
SELECT LectureRooms.Name
FROM  LectureRooms INNER JOIN Schedules ON LectureRooms.Id= Schedules.LectureRoomId
INNER JOIN Lectures ON Lectures.Id=Schedules.LectureId
INNER JOIN Teachers ON Lectures.TeacherId=Teachers.Id
WHERE Teachers.Name='Edward' AND Teachers.Surname='Hopper';
--------------------------------------------QUERY-2----------------------------------------<|
------------------Вивести прізвища асистентів, які читають лекції у групі“F505”------------<|
SELECT Teachers.Name +' '+ Teachers.Surname AS [Teachers Name]
FROM Teachers INNER JOIN Lectures ON Teachers.Id=Lectures.TeacherId
INNER JOIN GroupsLectures ON Lectures.Id=GroupsLectures.LectureId
INNER JOIN Groups ON GroupsLectures.GroupId=Groups .Id
WHERE Groups.Name='F505';
------------------------------------------QUERY-3------------------------------------------<|
---------------3. Вивести дисципліни, які читає викладач “Olga Obesniuk” для груп 5 курсу--<|
SELECT Subjects.Name 
FROM Subjects INNER JOIN Lectures ON Lectures.SubjectId=Subjects.Id
INNER JOIN Teachers ON Teachers.Id=Lectures.TeacherId
WHERE Teachers.Name='Olga' AND Teachers.Surname='Obesniuk';
------------------------------------------QUERY-4------------------------------------------<|
---------------4.Вивести прізвища викладачів, які не читають лекції у понеділок------------<|
SELECT DISTINCT Teachers.Name +' '+ Teachers.Surname AS [Teacher Name]
FROM Teachers INNER JOIN Lectures ON Lectures.TeacherId =Teachers.Id
INNER JOIN Schedules ON Schedules.LectureId=Lectures.Id
WHERE NOT EXISTS (SELECT Teachers.Name +' '+ Teachers.Surname AS [Teacher Name] FROM Teachers 
WHERE Schedules.DayOfWeek=1);
 ------------------------------------------QUERY-5------------------------------------------<|
--5. Вивести назви аудиторій, із зазначенням їх корпусів, у яких немає лекцій у
--середу другого тижня на третій парі-------------------------------------------------------<|
SELECT LectureRooms.Name ,LectureRooms.Building,Schedules.Week,Schedules.DayOfWeek
FROM LectureRooms INNER JOIN Schedules ON LectureRooms.Id=Schedules.LectureRoomId
WHERE NOT EXISTS (SELECT LectureRooms.Name ,LectureRooms.Building FROM LectureRooms 
WHERE  DayOfWeek=3 AND Schedules.Week=2);
------------------------------------------QUERY-6-------------------------------------------<|
--6. Вивести повні імена викладачів факультету “Computer Science”,які не ---
--курирують групи кафедри “Software Development”--------------------------------------------<|
SELECT Teachers.Name +' '+ Teachers.Surname AS [Teachers Name]
FROM Teachers INNER JOIN Dean ON Dean.TeacherId=Teachers.Id
INNER JOIN Faculties ON Faculties.DeanId=Dean.Id
INNER JOIN Departmens ON Departmens.FucultyId=Faculties.Id
WHERE Faculties.Name = 'Computer Science' AND NOT EXISTS (SELECT Teachers.Name +' '
+ Teachers.Surname AS [Teachers Name] 
FROM Teachers  WHERE  Departmens.Name='Software Development');
------------------------------------------QUERY-7-------------------------------------------<|
--7 Вивести список номерів усіх корпусів, які є у таблицях факультетів, кафедр та аудиторій-<|
SELECT Departmens.Building
FROM Departmens
UNION ALL
SELECT Faculties .Building
FROM  Faculties
UNION ALL
SELECT LectureRooms.Building
FROM LectureRooms;
------------------------------------------QUERY-8-------------------------------------------<|
--8 Вивести повні імена викладачів у такому порядку: декани факультетів, завідувачі кафедр,--
--викладачі, куратори, асистенти.--------------------------------------------------------------<|
SELECT Teachers.Name +' '+ Teachers.Surname AS [Deans Name] 
FROM Teachers,Dean 
WHERE Teachers.Id=Dean.TeacherId
UNION ALL
SELECT Teachers.Name +' '+ Teachers.Surname AS [Heads Name] 
FROM Teachers , Heads
WHERE  Heads.TeacherId=Teachers.Id
UNION ALL
SELECT Teachers.Name +' '+ Teachers.Surname AS [Curators Name] 
FROM Teachers,Curators 
WHERE Curators.TeacherId=Teachers.Id
UNION ALL
SELECT Teachers.Name +' '+ Teachers.Surname AS [Assistans Name] 
FROM Teachers, Assistans 
WHERE Assistans.TeacherId=Teachers.Id;
------------------------------------------QUERY-9-------------------------------------------<|
--Вивести дні тижня (без повторень), в які є заняття в аудиторіях «A311» та «A104» корпусу.-<|
SELECT DISTINCT Schedules.DayOfWeek 
FROM Schedules INNER JOIN LectureRooms 
ON LectureRooms .Id=Schedules.LectureRoomId
WHERE LectureRooms.Name='A106' AND LectureRooms.Name='A104';
