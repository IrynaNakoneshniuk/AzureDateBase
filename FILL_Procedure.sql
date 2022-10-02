INSERT INTO [Client] (First_name,Last_name, Phone_number, Client_email) 
VALUES
('Dennis', 'S Embry', '651-779-6791', 'dennis_embry@gmail.com'),
( 'Bonnie', 'A Rivera', '714-327-5825', 'bonnie_rivera@yahoo.fr'),
('Keltoum', 'Adrar', '0634355566', 'ad.keltoum@gmail.com'),
('Hachemi', 'Jairi', '03033346655', 'jairi.hachemi123@gmail.com'),
('Idriss', 'Jairi', '0634308303', 'jairiidriss@gmail.com'),
('Arabi', 'Adarar', '033201039290', 'arabi.adrar@gmial.com'),
('Nik', 'Koelo', '030300303', 'qsdqsdqs@d.ss'),
('Kate', 'Jhonson', '1321323223', 'asdas@asds.sdf'),
('Andrew', 'Shwabski', '1234567890', 'asdas@asfds.sdf');
GO
INSERT INTO Barber (First_name, Last_name, Phone_number,Emai) 
VALUES('Daria', 'S Embry', '6517796791', 'dennis_embry@gmail.com'),
('Stive', 'A Rivera', '7143275825', 'bonnie_rivera@yahoo.fr'),
('Olga', 'Adrar', '0634355566', 'ad.keltoum@gmail.com'),
('Maria', 'Jairi', '03033346655', 'jairi.hachemi123@gmail.com'),
('Neiton', 'Jairi', '0634308303', 'jairiidriss@gmail.com'),
('Oggi', 'Adarar', '033201039290', 'arabi.adrar@gmial.com'),
('Samson', 'Koelo', '030300303', 'qsdqsdqs@d.ss');
GO
INSERT INTO Junior_Barber(Barber_Id)
VALUES (1),(2),(3),(4),(5),(6);
GO
INSERT INTO Service_categories(Name)
VALUES ('Shaving'),
('Face Masking'),
('Uncategorized'),
('Haircut');
GO
INSERT INTO Services(Service_name,Service_description,Service_price,Service_duration,Service_categories_Id)
VALUES ('Hair Cut', 'Barber is a person whose occupation is mainly to cut dress groom style and shave men', '21.00', 20, 1),
('Hair Styling', 'Barber is a person whose occupation is mainly to cut dress groom style and shave men', '9.00', 15, 4),
('Hair Triming', 'Barber is a person whose occupation is mainly to cut dress groom style and shave men', '10.00', 10, 4),
('Clean Shaving', 'Barber is a person whose occupation is mainly to cut dress groom style and shave men', '20.00', 20, 2),
('Beard Triming', 'Barber is a person whose occupation is mainly to cut dress groom style and shave men', '20.00', 15, 1),
('Smooth Shave', 'Barber is a person whose occupation is mainly to cut dress groom style and shave men', '15.00', 20, 2),
('White Facial', 'Barber is a person whose occupation is mainly to cut dress groom style and shave men', '16.00', 15, 3),
('Face Cleaning', 'Barber is a person whose occupation is mainly to cut dress groom style and shave men', '20.00', 20, 3),
('Bright Tuning', 'Barber is a person whose occupation is mainly to cut dress groom style and shave men', '14.00', 20, 3);
GO
INSERT INTO Appointments(Date_created,Client_id,Employee_Id,Start_time,end_time_expected,Canceled,Cancellation_reason)
VALUES ('2022-10-06 13:40:00', 5, 3, '2021-02-08 09:30:00', '2021-02-08 09:50:00', 0, NULL),
('2022-10-20 08:22:00', 3, 1, '2021-03-22 06:00:00', '2021-03-22 06:20:00', 0, NULL),
('2022-10-06 13:40:00', 2, 4, '2021-02-08 09:30:00', '2021-02-08 09:50:00', 0, NULL),
('2022-10-20 08:22:00', 1, 5, '2021-03-22 06:00:00', '2021-03-22 06:20:00', 0, NULL);
GO 
INSERT INTO Employees_schedule(Employee_Id,Day,From_hour,To_hour)
VALUES (3, 1, '09:00:00', '18:00:00'),
(2, 7, '09:00:00', '17:00:00'),
(1, 1, '09:00:00', '18:00:00'),
(4, 2, '15:00:00', '22:00:00'),
(5, 3, '09:00:00', '18:00:00'),
(6, 4, '00:00:00', '20:00:00'),
(7, 7, '09:00:00', '18:00:00'),
(6, 1, '09:00:00', '17:00:00'),
(5, 6, '09:00:00', '18:00:00'),
(4, 7, '09:00:00', '18:00:00'),
(3, 7, '09:00:00', '18:00:00'),
(1, 1, '09:00:00', '17:00:00'),
(5, 6, '09:00:00', '18:00:00'),
(2, 7, '09:00:00', '18:00:00');
GO
INSERT INTO Services_booked(Appointment_id,Service_id)
VALUES (1, 1),
(2, 9);
INSERT INTO Achivments(Employee_Id,Client_id,Value)
VALUES (1,1,10),
(2,2,5),
(3,3,6),
(4,4,8),
(5,5,7),
(6,6,9),
(7,7,7),
(2,5,10),
(3,3,9),
(4,4,6),
(5,5,7),
(6,6,9),
(7,7,7);