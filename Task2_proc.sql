-----------------------------------------------TASK2---------------------------------------------<|
--1.Повернути інформацію про найпопулярнішого барбера (за кількістю клієнтів)--------------------<|
CREATE FUNCTION Popular_Barber()
RETURNS TABLE
AS
RETURN SELECT TOP(1)(SUM(Achivments.Value)) AS Total_Achivments, Barber.First_name, Barber.Last_name,Barber.Phone_number,Barber.Emai
FROM Achivments,Barber
WHERE Achivments.Employee_Id=Barber.Id
GROUP BY Barber.First_name, Barber.Last_name,Barber.Phone_number,Barber.Emai
ORDER BY Total_Achivments DESC

SELECT * FROM Popular_Barber()
--2.Повернути топ-3 барберів за місяць (за сумою грошей, витрачених клієнтами)---------------------<|
CREATE FUNCTION Top_Barbers()
RETURNS TABLE
AS
RETURN SELECT TOP(3)(SUM(Services.Service_price))AS Total_Price,Barber.First_name, Barber.Last_name,Barber.Phone_number,Barber.Emai
FROM Appointments,Barber,Services
WHERE  Appointments.Employee_Id=Barber.Id AND Appointments.ServiceId=Services.Id
GROUP BY Barber.First_name, Barber.Last_name,Barber.Phone_number,Barber.Emai
ORDER BY Total_Price DESC

SELECT * FROM Top_Barbers()
------------------------------------------------------PROC------------------------------------------<|
create procedure Barber_TOP
AS
SELECT TOP(1)(SUM(Services.Service_price)) AS Total_Price,Barber.First_name, Barber.Last_name,
Barber.Phone_number,Barber.Emai
FROM Appointments,Barber,Services
WHERE  Appointments.Employee_Id=Barber.Id AND Appointments.ServiceId=Services.Id
GROUP BY Barber.First_name, Barber.Last_name,Barber.Phone_number,Barber.Emai
ORDER BY Total_Price DESC

exec Barber_TOP;
--3.Показати розклад на день конкретного барбера. Інформація про барбера та дні передається як параметр-<|
CREATE FUNCTION Schedules_barber(@day INT , @Id INT )
RETURNS TABLE
AS
RETURN SELECT * FROM Employees_schedule
WHERE Employees_schedule.[Day]=@day AND  Employees_schedule.Employee_Id=@Id

------------------------------------------------------PROC------------------------------------------<|

CREATE PROCEDURE Barbers_schedules
@day INT,
@Id INT
AS
SELECT * FROM Employees_schedule
WHERE Employees_schedule.[Day]=@day AND  Employees_schedule.Employee_Id=@Id

EXECUTE Barbers_schedules @day=1,@Id=1

--4.-Перенести в архів інформацію про усі завершені послуги (ті послуги, що відбулися в минулому)----<|
CREATE PROC Archive_Services
AS
INSERT INTO Archive(Date_created,Client_id,Employee_Id,Start_time,end_time_expected,Canceled,Cancellation_reason)
SELECT Date_created,Client_id,Employee_Id,Start_time,end_time_expected,Canceled,Cancellation_reason
FROM Appointments
WHERE Appointments.end_time_expected< GETDATE();

---5 Заборонити додавання нового джуніор-барбера, якщо в  салоні вже працюють 5 джуніор-барберів;
CREATE TRIGGER Insert_Junior
ON Junior_Barber
INSTEAD OF INSERT
AS
BEGIN
DECLARE @Amount INT
SELECT @Amount=(SELECT COUNT(Junior_Barber.Id)
FROM Junior_Barber)
IF(@Amount>=5)
BEGIN
PRINT('CANNOT INSERT. BARBER AMOUNT MORE THAN 5!')
ROLLBACK TRANSACTION
END
ELSE
BEGIN
INSERT Junior_Barber (Barber_Id)
SELECT Barber_Id FROM inserted
END
END
