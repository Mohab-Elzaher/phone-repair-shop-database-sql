

CREATE DATABASE PhoneRepairDB;
GO

USE PhoneRepairDB;
GO

CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName  NVARCHAR(50),
    Phone     NVARCHAR(20),
    Email     NVARCHAR(100)
);

CREATE TABLE Technicians (
    TechnicianID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName  NVARCHAR(50)
);

CREATE TABLE Devices (
    DeviceID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    Brand NVARCHAR(50),
    Model NVARCHAR(50),
    IMEI NVARCHAR(50),
    PurchaseDate DATE,
    CONSTRAINT FK_Devices_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Repairs (
    RepairID INT IDENTITY(1,1) PRIMARY KEY,
    DeviceID INT NOT NULL,
    TechnicianID INT NOT NULL,
    DropOffDate DATE,
    PickUpDate DATE,
    IssueDescription NVARCHAR(200),
    Status NVARCHAR(20),
    LaborCost DECIMAL(10,2),
    PartsCost DECIMAL(10,2),
    TotalCost DECIMAL(10,2),
    CONSTRAINT FK_Repairs_Devices FOREIGN KEY (DeviceID) REFERENCES Devices(DeviceID),
    CONSTRAINT FK_Repairs_Technicians FOREIGN KEY (TechnicianID) REFERENCES Technicians(TechnicianID)
);

INSERT INTO Customers (FirstName, LastName, Phone, Email)
VALUES
('Abdol', 'Abozaid', '8135551001', 'abdoleldaldol@example.com'),
('Mahmoud', 'Abd', '8135551002', 'mahmoud@example.com'),
('Hobzawy', 'Elzaher', '8135551003', 'mohab@example.com'),
('Shinoo', 'Tarek', '8135551004', 'shinoo@example.com'),
('Spider', 'Man', '8135551005', 'spider@example.com');

INSERT INTO Technicians (FirstName, LastName)
VALUES
('Ali', 'Hassan'),
('John', 'Smith'),
('Sara', 'Williams');

INSERT INTO Devices (CustomerID, Brand, Model, IMEI, PurchaseDate)
VALUES
(1, 'Apple', 'iPhone 13', '356789012345678', '2023-02-15'),
(2, 'Samsung', 'Galaxy S22', '356789012345679', '2022-11-10'),
(3, 'Apple', 'iPhone 11', '356789012345680', '2021-06-20'),
(4, 'Google', 'Pixel 7', '356789012345681', '2023-01-05'),
(5, 'Apple', 'iPhone XR', '356789012345682', '2020-09-12');

INSERT INTO Repairs (DeviceID, TechnicianID, DropOffDate, PickUpDate, IssueDescription, Status, LaborCost, PartsCost, TotalCost)
VALUES
(1, 1, '2023-03-01', '2023-03-03', 'Screen cracked', 'Completed', 50.00, 120.00, 170.00),
(2, 2, '2023-04-10', '2023-04-12', 'Battery replacement', 'Completed', 30.00, 60.00, 90.00),
(3, 3, '2023-05-05', NULL, 'Water damage', 'In Progress', 100.00, 200.00, 300.00),
(4, 1, '2023-06-15', '2023-06-16', 'Software issue', 'Completed', 25.00, 0.00, 25.00),
(5, 2, '2023-07-01', NULL, 'Camera not working', 'Pending', 40.00, 80.00, 120.00);

SELECT * FROM Repairs;

SELECT d.DeviceID, d.Brand, d.Model, c.FirstName, c.LastName
FROM Devices d
JOIN Customers c ON d.CustomerID = c.CustomerID;

SELECT r.RepairID, c.FirstName AS CustomerFirst, c.LastName AS CustomerLast,
       t.FirstName AS TechFirst, t.LastName AS TechLast, r.IssueDescription, r.Status
FROM Repairs r
JOIN Devices d ON r.DeviceID = d.DeviceID
JOIN Customers c ON d.CustomerID = c.CustomerID
JOIN Technicians t ON r.TechnicianID = t.TechnicianID;

SELECT d.Brand, SUM(r.TotalCost) AS TotalRevenue
FROM Repairs r
JOIN Devices d ON r.DeviceID = d.DeviceID
GROUP BY d.Brand;

SELECT t.FirstName, t.LastName, COUNT(*) AS RepairsCount
FROM Repairs r
JOIN Technicians t ON r.TechnicianID = t.TechnicianID
GROUP BY t.FirstName, t.LastName;
