INSERT INTO LectureRooms(Building,Name)
VALUES (1,'A311'),
(2,'A104'),
(3,'A105'),
(4,'A106'),
(5,'A107'),
(1,'A108'),
(2,'A109'),
(3,'A110'),
(4,'A111'),
(5,'A112');
GO
INSERT INTO Subjects(Name)
VALUES ('Logic'),
('Mathematics'),
('Statistics'),
('Systems Science'),
('Physics'),
('Space Sciences'),
('Chemistry'),
('Anthropology'),
('Political Science'),
('Sociology');
GO
INSERT INTO Teachers(Name,Surname)
VALUES ('Olga','Obesniuk'),
('Edward ','Hopper'),
('Olena','Hmil'),
('Anna','Yefimenko'),
('Volodymyr','Bilenko'),
('Olena','Stefanchuk'),
('Anatoliy','Vovchuk');
GO 
INSERT INTO Assistans(TeacherId)
VALUES (1),(2),(3),(4),(5),(6),(7);
GO 
INSERT INTO Dean(TeacherId)
VALUES (1),(2),(3),(4),(5),(6),(7);
GO
INSERT INTO Faculties(Building,Name,DeanId)
VALUES (1,'Facultad de Filosofía',1),
(2,'Business Administration',2),
(3,'Entrepreneurship',3),
(4,'Applied sciences',4),
(5,'Natural and physical sciences',5),
(2,'Accountancy',6),
(3,'Computer Science',7),
(4,'Information Systems',1),
(1,'Information Technology',2),
(5,'Hospitality Management',4);
GO
INSERT INTO Heads(TeacherId)
VALUES (1),(2),(3),(4),(5),(6),(7),(1),(2),
(3);
GO
INSERT INTO Departmens(Building,Name,FucultyId,HeadId)
VALUES (1,'Departments in the Faculty of Engineering',1,1),
(2,'Departments in the Faculty of Environmental Sciences',2,2),
(3,'Software Development',3,3),
(4,'Departments in the Faculty of Law',4,4),
(5,'Departments in the Faculty of Management Sciences',5,5),
(1,'Department in the College of Medical Sciences',6,6),
(2,'Departments in the Faculty of Science',7,7),
(3,'Departments in the Faculty of Social Sciences',8,8),
(4,'Banking and Finance',9,9),
(5,'Office and Information Management',10,10);
GO
INSERT INTO Groups(Name,Year,DepartmensId)
VALUES('F505',1,1),
('F506',2,2),
('F507',3,3),
('F508',4,4),
('F509',5,5),
('F501',1,6),
('F502',2,7),
('F503',3,8),
('F504',4,9),
('F512',5,10);
GO
INSERT INTO Curators(TeacherId)
VALUES (1),(2),(3),(4),(5),(6),(7),(1),(2),
(3);
GO
INSERT INTO GroupCurators(CuratorId,GroupId)
VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),
(7,7),(8,8),(9,9),(10,10);
GO 
INSERT INTO Lectures(SubjectId,TeacherId)
VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),
(7,7),(8,1),(9,2),(10,3);
GO
INSERT INTO GroupsLectures(GroupId,LectureId)
VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),
(7,7),(8,8),(9,9),(10,10),
(1,10),(2,9),(3,8),(4,7),(5,6),(6,7),
(7,8),(8,9),(9,10),(10,1);
GO
INSERT INTO Schedules(Class,DayOfWeek,Week,LectureId,LectureRoomId)
VALUES (1,1,1,1,11),
(2,2,2,2,12),
(3,3,3,3,13),
(4,4,4,4,14),
(5,5,5,5,15),
(6,6,6,6,16),
(7,7,7,7,17),
(8,1,8,8,18),
(1,2,9,9,19),
(2,2,10,10,20);

