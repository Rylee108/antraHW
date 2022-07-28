--1
SELECT c.Name AS Country,s.Name AS Province
FROM Person.CountryRegion AS c JOIN Person.StateProvince AS s ON c.CountryRegionCode = s.CountryRegionCode

--2
SELECT c.Name AS Country,s.Name AS Province
FROM Person.CountryRegion AS c JOIN Person.StateProvince AS s ON c.CountryRegionCode = s.CountryRegionCode
WHERE c.Name NOT IN ('Germany','Canada')

--3
use Northwind
GO


SELECT DISTINCT d.ProductID,COUNT(d.Quantity) AS prodNumber
FROM Orders AS o JOIN [Order Details] AS d ON o.OrderID = d.OrderID JOIN Products AS p ON d.ProductID = p.ProductID
WHERE DATEDIFF(year,o.OrderDate,GETDATE()) < 25


--4
declare @today1 datetime
select @today1 = GETDATE()

SELECT TOP 5 o.ShipPostalCode,COUNT(d.Quantity*p.UnitsOnOrder) AS prodNumber 
FROM Orders AS o JOIN [Order Details] AS d ON o.OrderID = d.OrderID JOIN Products AS p ON d.ProductID = p.ProductID
WHERE @today1 - o.OrderDate > 25
GROUP BY o.ShipPostalCode
ORDER BY COUNT(d.Quantity*p.UnitsOnOrder) DESC

--5
SELECT City, COUNT(City) AS NumberofCus
FROM Customers
GROUP BY City

--6
SELECT City, COUNT(CustomerID) AS NumberofCus
FROM Customers
GROUP BY City
HAVING COUNT(CustomerID) > 2

--7
SELECT c.ContactName,c.CustomerID,c.ContactName,SUM(d.Quantity) NumofProd
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID JOIN [Order Details] d ON o.OrderID = d.OrderID 
GROUP BY c.ContactName,c.CustomerID,c.ContactName

--8

SELECT c.CustomerID, SUM(d.Quantity) NumofProd
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID JOIN [Order Details] d ON o.OrderID = d.OrderID
GROUP BY c.CustomerID
HAVING SUM(d.Quantity) > 100

--9

SELECT DISTINCT sh.CompanyName [Supplier Company Name], s.CompanyName [Shipping Company Name]
FROM Shippers sh CROSS JOIN Suppliers s 

--10

SELECT o.OrderDate, p.ProductName
FROM Orders o LEFT JOIN [Order Details] d ON o.OrderID = d.OrderID JOIN Products p ON d.ProductID = p.ProductID
GROUP BY o.OrderDate, p.ProductName
ORDER BY o.OrderDate


--11

SELECT e1.Title,e1.FirstName + ' '+e1.LastName Employee1Name,e2.FirstName + ' '+e2.LastName Employee2Name
FROM Employees e1 JOIN Employees e2 ON e1.Title = e2.Title
WHERE e1.EmployeeID != e2.EmployeeID


--12

SELECT e.FirstName + ' ' + e.LastName ManagerName
FROM Employees e
WHERE e.EmployeeID IN 
(
SELECT e.ReportsTo
FROM Employees e
GROUP BY e.ReportsTo
HAVING COUNT(e.ReportsTo) > 2
)

--13 

SELECT City, CompanyName, ContactName, 'Customer' Type
FROM Customers
UNION ALL
SELECT City, CompanyName, ContactName, 'Supplier' Type
FROM Suppliers
ORDER BY City

--14
SELECT DISTINCT c.City
FROM Customers c
WHERE c.City IN
(SELECT e.City
FROM Employees e)

--15
--a
SELECT c.City
FROM Customers c
WHERE c.City NOT IN
(SELECT e.City
FROM Employees e)

--b
SELECT c.City
FROM Customers c
WHERE c.CustomerID IS NOT NULL
UNION
SELECT e.City
FROM Employees e
WHERE e.EmployeeID IS NULL


--16
SELECT ProductID,SUM(Quantity) AS [Order Quantities]
FROM [Order Details]
GROUP BY ProductID

--17
--a
SELECT c.City
FROM Customers c
GROUP BY c.City
HAVING COUNT(c.CustomerID) >= 2
UNION
SELECT c.City
FROM Customers c
GROUP BY c.City
HAVING COUNT(c.CustomerID) >= 2

--b
SELECT DISTINCT City
FROM Customers
WHERE City IN
(SELECT c.City
FROM Customers c
GROUP BY c.City
HAVING COUNT(c.CustomerID) > =2)


--18

SELECT c.City
FROM Customers c
WHERE c.CustomerID IN
(
SELECT o.CustomerID
FROM Orders o
WHERE o.OrderID IN
(
SELECT d.OrderID
FROM [Order Details] d
GROUP BY d.OrderID
HAVING COUNT(d.ProductID) > 2))

--19

SELECT TOP 5 p.ProductName, AVG(p.UnitPrice) AS AaeragePrice, o.ShipCity, MAX(d.Quantity) AS pdQuantity
FROM [Order Details] d JOIN Products p ON d.ProductID = p.ProductID JOIN Orders o ON o.OrderID = d.OrderID
GROUP BY p.ProductName,o.ShipCity
ORDER BY pdQuantity DESC

--20
SELECT
(SELECT TOP 1 City 
FROM Orders o JOIN [Order Details] od ON o.OrderID=od.OrderID JOIN Employees e ON e.EmployeeID = o.EmployeeID 
GROUP BY e.EmployeeID,e.City 
ORDER BY COUNT(*) DESC) AS MostOrderedCity, 
(SELECT TOP 1 City 
FROM Orders o JOIN [Order Details] od ON o.OrderID=od.OrderID JOIN Employees e ON e.EmployeeID = o.EmployeeID 
GROUP BY e.EmployeeID,e.City 
ORDER BY SUM(Quantity) DESC) AS MostQunatitySoldCity

--21
--1. UNION will remove duplicate records
--2. Use DISTINCT can also remove the duplicate records