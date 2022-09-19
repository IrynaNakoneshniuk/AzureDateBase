INSERT INTO Subjects(Name)
VALUES('Information technology'),
('T-SQL'),
('Softwere development C#'),
('Konfiguration Windows'),
('English'),
('Software engineering'),
('Network systems');
GO
INSERT INTO Teacher(Name,Salary,Surname)
VALUES('Jack',12000,'Underhill'),
('Tom',13000,'Kruz'),
('Anrew',10000,'Shvab'),
('Olga',23000,'Obesniuk'),
('David',34000,'Shevchenko');
GO
INSERT INTO Lecture(DayOfWeek,LectureRoom,SubjectId,TeacherId)
VALUES(1,'D201',1,1),
(2,'R109',2,2),
(3,'P456',3,3),
(5,'P78',4,4),
(6,'O56',5,5),
(7,'I890',6,5);
GO
INSERT INTO Facultiet(Name)
VALUES('Computer Science'),
('Software engineering'),
('Network systems'),
('Robot technician'),
('Softwere development');
GO
INSERT INTO Department(Financing,Name,FacultyId)
VALUES (230000,'Software Development',1),
(450000,'Department of computer control systems',2),
(450000,'Department of System Analysis and Information Technologies',3),
(340000,'Department of integration of education and production',4),
(230000,'Department of computer technology',5),
(340000,'Department of technology and automation of mechanical engineering',5);
GO
INSERT INTO Groups2(Name,Year,DepartmentId)
VALUES ('RT123',1,7),
('ER234',3,2),
('DF678',2,3),
('TO345',5,4),
('FT567',3,5),
('PL345',4,7),
('JT567',2,6);
GO 
INSERT INTO GroupLecture(GroupId,LectureId)
VALUES (10,2),
(11,2),
(12,3),
(13,4),
(14,5),
(15,6),
(16,6);