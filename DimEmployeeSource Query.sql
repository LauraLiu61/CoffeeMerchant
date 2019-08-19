-- Script written by Yao Liu
-- Script query to select Employees for DimEmployee
USE CoffeeMerchant
GO
SELECT dbo.Employee.EmployeeID,
	dbo.Employee.HireDate,
	dbo.Employee.BirthDate,
	dbo.Employee.FirstName,
	dbo.Employee.LastName,
	dbo.Employee.Gender
FROM dbo.Employee
