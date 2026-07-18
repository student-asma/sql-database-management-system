CREATE DATABASE CompanyDB;

USE CompanyDB;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100) NOT NULL
);

INSERT INTO Departments (DepartmentName)
VALUES
('Human Resources'),
('Information Technology'),
('Finance'),
('Marketing'),
('Sales');

SELECT * FROM Departments;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    HireDate DATE,
    Salary DECIMAL(10,2),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID)
    REFERENCES Departments(DepartmentID)
);

INSERT INTO Employees
(FirstName, LastName, Email, Phone, HireDate, Salary, DepartmentID)
VALUES
('Ali','Khan','ali.khan@gmail.com','03001234567','2024-01-15',60000,2),
('Sara','Ahmed','sara.ahmed@gmail.com','03111234567','2023-08-10',55000,1),
('Usman','Malik','usman.malik@gmail.com','03221234567','2022-11-20',70000,3),
('Ayesha','Noor','ayesha.noor@gmail.com','03331234567','2024-03-05',50000,4),
('Bilal','Raza','bilal.raza@gmail.com','03441234567','2023-06-12',65000,5);
SELECT * FROM Employees;

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectName VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    Budget DECIMAL(12,2)
);
INSERT INTO Projects
(ProjectName, StartDate, EndDate, Budget)
VALUES
('HR Management System','2025-01-01','2025-06-30',500000),
('E-Commerce Website','2025-02-15','2025-09-30',1200000),
('Banking App','2025-03-10','2025-12-20',2000000),
('Marketing Campaign','2025-04-01','2025-07-31',350000),
('Sales Dashboard','2025-05-15','2025-10-15',450000);
SELECT * FROM Projects;

CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    ProjectID INT,
    Role VARCHAR(50),
    PRIMARY KEY (EmployeeID, ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);
INSERT INTO EmployeeProjects
(EmployeeID, ProjectID, Role)
VALUES
(1,2,'Developer'),
(2,1,'HR Manager'),
(3,3,'Finance Analyst'),
(4,4,'Marketing Executive'),
(5,5,'Sales Manager');
SELECT * FROM EmployeeProjects;

CREATE TABLE Salaries (
    SalaryID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    SalaryAmount DECIMAL(10,2),
    PaymentDate DATE,
    FOREIGN KEY (EmployeeID)
    REFERENCES Employees(EmployeeID)
);
INSERT INTO Salaries
(EmployeeID, SalaryAmount, PaymentDate)
VALUES
(1,60000,'2025-01-31'),
(2,55000,'2025-01-31'),
(3,70000,'2025-01-31'),
(4,50000,'2025-01-31'),
(5,65000,'2025-01-31');
SELECT * FROM Salaries;
SHOW TABLES;

SELECT * FROM Employees;

SELECT *
FROM Employees
WHERE Salary > 60000;

SELECT *
FROM Employees
ORDER BY Salary DESC;

SELECT COUNT(*) AS Total_Employees
FROM Employees;

SELECT AVG(Salary) AS Average_Salary
FROM Employees;

SELECT MAX(Salary) AS Highest_Salary
FROM Employees;

SELECT MIN(Salary) AS Lowest_Salary
FROM Employees;

SELECT SUM(Salary) AS Total_Salary
FROM Employees;

SELECT DepartmentID,
COUNT(EmployeeID) AS Total_Employees
FROM Employees
GROUP BY DepartmentID;

SELECT DepartmentID,
COUNT(EmployeeID) AS Total_Employees
FROM Employees
GROUP BY DepartmentID
HAVING COUNT(EmployeeID) > 1;

SELECT
Employees.FirstName,
Employees.LastName,
Departments.DepartmentName
FROM Employees
INNER JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID;

SELECT
Employees.FirstName,
Departments.DepartmentName
FROM Employees
LEFT JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID;

SELECT
Employees.FirstName,
Departments.DepartmentName
FROM Employees
RIGHT JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID;

SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary >
(
    SELECT AVG(Salary)
    FROM Employees
);

CREATE VIEW Employee_Department_View AS
SELECT
    Employees.EmployeeID,
    Employees.FirstName,
    Employees.LastName,
    Departments.DepartmentName,
    Employees.Salary
FROM Employees
INNER JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID;

SELECT * FROM Employee_Department_View;

CREATE INDEX idx_email
ON Employees(Email);

SHOW INDEX FROM Employees;

UPDATE Employees
SET Salary = 75000
WHERE EmployeeID = 1;

SELECT * FROM Employees



