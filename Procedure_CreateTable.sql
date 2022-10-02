CREATE DATABASE BarberShop;
GO
USE BarberShop;
CREATE TABLE Client (
  [Id] INT IDENTITY(1,1) PRIMARY KEY  NOT NULL,
  [First_name] varchar(30) NOT NULL,
  [Last_name] varchar(30) NOT NULL,
  [Phone_number] varchar(30) NOT NULL,
  [Client_email] varchar(50) NOT NULL
) 
GO
CREATE TABLE Barber (
  [Id] INT IDENTITY(1,1) PRIMARY KEY  NOT NULL,
  [First_name] varchar(20) NOT NULL,
  [Last_name] varchar(20) NOT NULL,
  [Phone_number] varchar(30) NOT NULL,
  [Emai] varchar(50) NOT NULL
) 
GO
CREATE TABLE Junior_Barber(
[Id] INT IDENTITY(1,1) PRIMARY KEY  NOT NULL,
[Barber_Id] INT  NOT NULL,
CONSTRAINT FK_Junior_Barber FOREIGN KEY (Barber_Id) REFERENCES Barber(Id)
);
GO
CREATE TABLE  [Service_categories] (
 [Id] INT IDENTITY(1,1) PRIMARY KEY  NOT NULL,
 [Name] varchar(50) UNIQUE NOT NULL,
) 
GO
CREATE TABLE Services (
  [Id] INT IDENTITY(1,1) PRIMARY KEY  NOT NULL,
  [Service_name] varchar(50) NOT NULL,
  [Service_description] varchar(255) NOT NULL,
  [Service_price] decimal(6,2) NOT NULL,
  [Service_duration] DECIMAL NOT NULL,
  [Service_categories_Id] int NOT NULL
  CONSTRAINT FK_Services FOREIGN KEY (Service_categories_Id) REFERENCES Service_categories(Id)
)
GO
CREATE TABLE Appointments (
  [Id] INT IDENTITY(1,1) PRIMARY KEY  NOT NULL,
  [Date_created] DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  [Client_id] INT NOT NULL,
  [Employee_Id] INT NOT NULL,
  [Start_time] DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  [end_time_expected] DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  [Canceled] INT NOT NULL DEFAULT 0,
  [Cancellation_reason] texT DEFAULT NULL,
  CONSTRAINT FK_Appointments_Client FOREIGN KEY (Client_id) REFERENCES Client(Id),
  CONSTRAINT FK_Appointments_Employee FOREIGN KEY (Employee_Id) REFERENCES Barber(Id)
) 
GO
CREATE TABLE Employees_schedule (
  [Id] INT IDENTITY(1,1) PRIMARY KEY  NOT NULL,
  [Employee_Id] INT NOT NULL,
  [Day] INT NOT NULL,
  [From_hour] time NOT NULL,
  [To_hour] time NOT NULL
  CONSTRAINT FK_Employees_schedule FOREIGN KEY (Employee_Id) REFERENCES Barber(Id)
) 
GO
CREATE TABLE Services_booked (
  [Id] INT IDENTITY(1,1) PRIMARY KEY  NOT NULL,
  [Appointment_id] INT NOT NULL,
  [Service_id] INT NOT NULL
  CONSTRAINT FK_Services_booked_Appointment FOREIGN KEY (Appointment_id) REFERENCES Appointments(Id),
  CONSTRAINT FK_Services_booked_Service FOREIGN KEY (Service_id) REFERENCES Services(Id)
) 
GO
CREATE TABLE Achivments(
    [Id] INT IDENTITY(1,1) PRIMARY KEY  NOT NULL,
    [Employee_Id] INT NOT NULL,
    [Client_id] INT NOT NULL,
    [Value] INT NOT NULL,
    CONSTRAINT FK_Achivments_Employee FOREIGN KEY (Employee_Id) REFERENCES Barber(Id),
    CONSTRAINT FK_Achivments_Client FOREIGN KEY (Client_id) REFERENCES  Client(Id)
)
GO
CREATE TABLE Archive (
  [Id] INT IDENTITY(1,1) PRIMARY KEY  NOT NULL,
  [Date_created] DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  [Client_id] INT NOT NULL,
  [Employee_Id] INT NOT NULL,
  [Start_time] DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  [end_time_expected] DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  [Canceled] INT NOT NULL DEFAULT 0,
  [Cancellation_reason] texT DEFAULT NULL,
  CONSTRAINT FK_Archive_Client FOREIGN KEY (Client_id) REFERENCES Client(Id),
  CONSTRAINT FK_Archive_Employee FOREIGN KEY (Employee_Id) REFERENCES Barber(Id)
) 