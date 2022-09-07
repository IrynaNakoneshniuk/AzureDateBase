-----------------------------------Query1-------------------------------------------------<|
--1. Вивести всі можливі пари рядків викладачів та груп-----------------------------------<|
SELECT Curators.Name +' '+Surname+ ' 'AS [Full Name Teacher], Groups.Name AS [Name group]
From Curators,Groups,GroupsCurators
WHERE GroupsCurators.GroupId=Groups.Id AND GroupsCurators.CuratorId= Curators.Id;
-----------------------------------Query2-------------------------------------------------<|
--2. Вивести назви факультетів, фонд фінансування кафедр яких перевищує фонд фінансування--
 --факультету-----------------------------------------------------------------------------<|
 SELECT Faculties.Name,Departments.Financing
 FROM Faculties,Departments
 WHERE Departments.FacultyId= Faculties.Id AND Faculties.FinancingFaculties> Departments.Financing;
 -----------------------------------Query3-------------------------------------------------<|
 --3. Вивести прізвища кураторів груп та назви груп, які вони курирують--------------------<|
 SELECT Curators.Name +' '+Surname+ ' 'AS [Full Name Teacher], Groups.Name AS [Name group]
From Curators,Groups,GroupsCurators
WHERE GroupsCurators.GroupId=Groups.Id AND GroupsCurators.CuratorId= Curators.Id;
-----------------------------------Query4-------------------------------------------------<|
--Вивести імена та прізвища викладачів, які читають лекції у групі “P107”-----------------<|
 SELECT Curators.Name +' '+Surname+ ' 'AS [Full Name Teacher], Groups.Name AS [Name group]
From Curators,Groups,GroupsCurators
WHERE GroupsCurators.GroupId=Groups.Id AND GroupsCurators.CuratorId= Curators.Id 
AND Groups.Name='P-107';
-----------------------------------Query5-------------------------------------------------<|
--5. Вивести прізвища викладачів та назви факультетів, на яких вони читають лекції--------<|
SELECT Teachers.Surname ,Faculties.Name
FROM Lectures,Teachers,GroupsLectures,Groups,Departments,Faculties
WHERE Lectures.TeacherId=Teachers.Id AND GroupsLectures.LectureId= Lectures.Id AND 
Groups.Id=GroupsLectures.GroupId AND Departments.Id=Groups.DepartmentId
 AND Faculties.Id=Departments.FacultyId;
 -----------------------------------Query6-------------------------------------------------<|
 --Вивести назви кафедр та назви груп, які до них належать---------------------------------<|
 SELECT Departments.Name, Groups.Name
 FROM  Departments,Groups
 WHERE Departments.Id=Groups.DepartmentId;
 -----------------------------------Query7-------------------------------------------------<|
 --Вивести назви дисциплін, які читає викладач “Samantha Adams”----------------------------<|
 SELECT Subjects.Name
 FROM Subjects,Teachers,Lectures
 WHERE Teachers.Id=Lectures.TeacherId AND Lectures.SubjectId=Subjects.Id AND Teachers.Name='Samantha'
 AND Teachers.Surname='Adams';
 -----------------------------------Query8--------------------------------------------------<|
--8. Вивести назви кафедр, де читається дисципліна “Descret Math”---------------------------<|
SELECT Departments.Name
FROM Departments,Groups,Lectures,Subjects,GroupsLectures
WHERE Departments.Id=Groups.DepartmentId AND GroupsLectures.GroupId=Groups.Id AND 
GroupsLectures.LectureId=Lectures.Id AND Subjects.Id=Lectures.SubjectId AND Subjects.Name='Descret Math';
-----------------------------------Query9----------------------------------------------------<|
--9. Вивести назви груп, що належать до факультету Computer Science--------------------------<|
SELECT Groups.Name
FROM Groups,Departments,Faculties
WHERE Groups.DepartmentId=Departments.Id AND Departments.FacultyId=Faculties.Id AND Departments.Name='Computer Science';
-----------------------------------Query10-----------------------------------------------------<|
--10.Вивести назви груп 4-го курсу, а також назву факультетів, до яких вони належать-----------<|

SELECT Groups.Name, Faculties.Name
FROM Groups,Faculties,Departments
WHERE Groups.DepartmentId=Departments.Id AND Departments.FacultyId=Faculties.Id AND Groups.Year=4;
-----------------------------------Query11-----------------------------------------------------<|
--11. Вивести повні імена викладачів та лекції, які вони читають (назви дисциплін та груп), причому 
--відібрати лише ті лекції, що читаються в аудиторії “B103”------------------------------------<|
SELECT Teachers.Name+' '+Teachers.Surname AS [Teacher],Subjects.Name
FROM Teachers,Subjects,Lectures
WHERE Lectures.TeacherId=Teachers.Id AND Lectures.SubjectId=Subjects.Id;