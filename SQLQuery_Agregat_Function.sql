-----------------------------QUERY1-------------------------------------------<|
--1. Вивести кількість викладачів кафедри «Software Development»--------------<|
SELECT COUNT(*) [AMOUNT OF TEACHERS]
FROM Teacher INNER JOIN Lecture ON Lecture.TeacherId=Teacher.Id
INNER JOIN GroupLecture ON GroupLecture.LectureId=Lecture.Id
INNER JOIN Groups2 ON Groups2.Id=GroupLecture.GroupId
INNER JOIN Department ON Groups2.DepartmentId= Department.Id
WHERE Department.Name ='Software Development';
--2. Вивести кількість лекцій, які читає викладач “Dave McQueen”---------------<|
SELECT COUNT(*) AS [Numbers of lectures] 
FROM Teacher INNER JOIN Lecture ON Lecture.TeacherId=Teacher.Id
WHERE Teacher.Name ='Tom' AND Teacher.Surname= 'Kruz'
GROUP BY Lecture.Id;
--3.Вивести кількість занять, які проводяться в аудиторії “D201”---------------<|
SELECT COUNT (Subjects.Id) AS  [Count of lectures]
FROM Subjects INNER JOIN Lecture ON Lecture.SubjectId= Subjects.Id
WHERE Lecture.LectureRoom= 'D201'
GROUP BY Subjects.Id;
--4 Вивести назви аудиторій та кількість лекцій, що проводяться в них---------<|
SELECT COUNT(GroupLecture.Id) AS [AMOUNT Lectures ],Lecture.LectureRoom
FROM Lecture INNER JOIN GroupLecture ON  GroupLecture.LectureId=Lecture.Id
GROUP BY Lecture.LectureRoom;
--5 Вивести груп, які відвідують лекції викладача “Jack Underhill”--<|
SELECT COUNT(Groups2.Id) AS [AMOUNT GROUPS]
FROM Groups2 INNER JOIN GroupLecture ON GroupLecture.GroupId =Groups2.Id
INNER JOIN Lecture ON  GroupLecture.LectureId=Lecture.Id
INNER JOIN Teacher ON Lecture.TeacherId=TeacheR.Id
WHERE Teacher.Name ='Jack' AND Teacher.Surname= 'Underhill';
--6 Вивести середню ставку викладачів факультету Software Development-------<|
SELECT AVG(Teacher.Salary) AS [AVG_SALARY]
FROM Teacher INNER JOIN Lecture ON Lecture.TeacherId= Teacher.Id
INNER JOIN GroupLecture ON GroupLecture.LectureId =Lecture.Id
INNER JOIN Groups2 ON Groups2 .Id=GroupLecture.GroupId
INNER JOIN Department ON Groups2.DepartmentId= Department.Id
WHERE Department.Name= 'Department of computer control systems';
--7 Вивести мінімальну та максимальну кількість студентів серед усіх груп.--<|
--8 Вивести середній фонд фінансування кафедр-------------------------------<|
SELECT AVG(Department.Financing) AS [Financing departments]
FROM Department
--9 Вивести повні імена викладачів та кількість читаних ними дисциплін------<|
SELECT COUNT(Subjects.Id) AS [AMOUNT SUBJECTS],Teacher.Id [TEACHER ID]
FROM Teacher INNER JOIN Lecture ON Lecture.TeacherId =Teacher.Id
INNER JOIN Subjects ON Lecture.SubjectId=Subjects.Id
GROUP BY  Teacher.Id;
--10 Вивести кількість лекцій щодня протягом тижня-------------------------<|
SELECT COUNT(GroupLecture.LectureId) [AMOUNT OF LECTURES],Lecture.DayOfWeek
FROM GroupLecture INNER JOIN Lecture ON GroupLecture.LectureId=Lecture.Id
GROUP BY lecture.DayOfWeek;
--11 Вивести номери аудиторій та кількість кафедр, чиї лекції в них читаються--<|
SELECT COUNT (Department.Id) AS [Amount of Department], Lecture.LectureRoom
FROM Lecture INNER JOIN GroupLecture ON GroupLecture.LectureId=Lecture.Id
INNER JOIN Groups2 ON Groups2.Id=  GroupLecturE.GroupId
INNER JOIN Department ON Groups2.DepartmentId= Department.Id
GROUP BY Lecture.LectureRoom;
--12 Вивести назви факультетів та кількість дисциплін, які на них читаються.---<|
SELECT Facultiet.Name AS [NAME], COUNT(Subjects.Id) AS [AMOUNT SUBJECTS]
FROM Facultiet INNER JOIN Department ON Department.FacultyId=Facultiet.Id
INNER JOIN Groups2 ON Groups2.DepartmentId =Department.Id
INNER JOIN GroupLecture ON GroupLecture.GroupId=Groups2.Id
INNER JOIN Lecture ON GroupLecture.LectureId=Lecture.Id
INNER JOIN Subjects ON Subjects.Id=Lecture.SubjectId
GROUP BY Facultiet.Name;
--13 Вивести кількість лекцій для кожної пари викладач-аудиторія.-------------<|
SELECT COUNT(GroupLecture.LectureId) AS [AMOUNT LECTURES], Teacher.Name, Lecture.LectureRoom
FROM GroupLecture INNER JOIN Lecture ON GroupLecture.LectureId=Lecture.Id
INNER JOIN Teacher ON Lecture.TeacherId=Teacher.Id
GROUP BY Teacher.Name, Lecture.LectureRoom;