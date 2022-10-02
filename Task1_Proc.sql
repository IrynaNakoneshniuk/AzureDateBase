----------------------------------------TASK1-----------------------------------------------<|
--Використовуючи тригери, користувацькі функції та збережені процедури реалізуйте наступну
-- функціональність:------------------------------------------------------------------------
--1.Повернути інформацію про барбера, який обслужив максимальну кількість клієнтів у вказаному
-- діапазоні дат. Дати передаються як параметр----------------------------------------------<|
CREATE FUNCTION Max_Amount_Clients(@created DATETIME,@end_time DATETIME )
RETURNS TABLE
AS
return SELECT TOP(1) (COUNT( Appointments.Employee_Id)) AS Amount, Barber.First_name,Barber.Last_name
FROM Barber, Appointments
WHERE Barber.Id=Appointments.Employee_Id AND  Appointments.Date_created >= @created 
AND Appointments.end_time_expected <=@end_time
GROUP BY Appointments.Employee_Id,Barber.First_name,Barber.Last_name
ORDER BY Amount DESC
GO
SELECT* FROM Max_Amount_Clients('2021-01-06 13:40:00',CURRENT_TIMESTAMP);

--2.Повернути інформацію про клієнта, який відвідав барбершоп максимальну кількість разів--<|
CREATE FUNCTION Regular_Customer()
RETURNS TABLE
AS
RETURN SELECT TOP(1)(COUNT(Appointments.Client_id)) AS Amount, Client.First_name, Client.Last_name, Client.Phone_number,Client.Client_email
FROM Client,Appointments 
WHERE Appointments .Client_id=Client.Id
GROUP BY Appointments.Client_id, Client.First_name, Client.Last_name, Client.Phone_number,Client.Client_email
ORDER BY Amount DESC
SELECT* FROM Regular_Customer();

--3.Повернути інформацію про клієнта, який витратив у барбершопі максимальну суму грошей--------<|
CREATE FUNCTION Max_Sum()
RETURNS TABLE
AS
RETURN SELECT TOP(1)(SUM(Services.Service_price)) AS Total_price,Client.First_name, Client.Last_name, Client.Phone_number,Client.Client_email
FROM Client,Services,Appointments 
WHERE Appointments.Client_id=Client.Id AND Appointments.ServiceId=Services.Id
GROUP BY Client.First_name, Client.Last_name, Client.Phone_number,Client.Client_email
ORDER BY Total_price DESC

SELECT * FROM Max_Sum()
--4.Повернути інформацію про найдовшу за часом послугу у барбершопі-----------------------------<|
CREATE FUNCTION Max_Duration_Service()
RETURNS TABLE
AS
RETURN SELECT TOP(4) (MAX(Services.Service_duration) )AS Duration,Services.Service_name, Services.Service_description,Services.Service_price
FROM Services
GROUP BY Services.Service_name, Services.Service_description,Services.Service_price
ORDER BY  Duration  DESC

SELECT * FROM Max_Duration_Service()