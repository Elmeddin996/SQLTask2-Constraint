CREATE DATABASE CompanyTask

USE CompanyTask

CREATE TABLE Employeers
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(20)NOT NULL,
Surename NVARCHAR(20)NOT NULL,
Salary DECIMAL CHECK(Salary>=250),
Email NVARCHAR(50)NOT NULL
)

INSERT INTO Employeers(Name, Surename,Salary,Email)
VALUES
('Elmeddin','Mirzeyev',10000,'elmeddinshm@code.edu.az'),
('Elshad','Rzaquliyev',1500,'elshad@gmail.com'),
('Rza','Mirzeyev',1000,'rza@code.edu.az'),
('Amirali','Sarsilmaz',1200,'sarsilmaz@gmail.com'),
('Samed','Musayev',1400,'Samad@code.edu.az')

SELECT * FROM Employeers
WHERE Salary BETWEEN 1200 AND 10000


SELECT * FROM Employeers
WHERE Salary>(SELECT AVG(Salary) FROM Employeers)


UPDATE Employeers
SET Salary = FLOOR((SELECT AVG(Salary) FROM Employeers))
WHERE Salary<(SELECT AVG(Salary) FROM Employeers)

SELECT Id, (Name+' '+Surename) AS 'FullName',Salary,Email FROM Employeers
WHERE LEN(Name+' '+Surename)>15

SELECT * FROM Employeers
WHERE Email LIKE '%gmail.com'

SELECT * FROM Employeers
WHERE Email LIKE '%code.edu.az'

SELECT (SELECT COUNT (Salary) FROM Employeers WHERE Salary>4000)*100/(SELECT COUNT(Id) FROM Employeers)


SELECT RIGHT(Email, CHARINDEX('@', REVERSE(Email))-1) AS Domain
FROM Employeers