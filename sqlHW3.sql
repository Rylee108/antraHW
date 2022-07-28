--1
CREATE VIEW view_product_order_Gao
AS
SELECT p.ProductName,SUM(d.Quantity) TotalOrderQuantity
FROM Products p JOIN [Order Details] d ON p.ProductID = d.ProductID
GROUP BY p.ProductName

--2
ALTER PROC sp_product_order_quantity_Gao
@id int,
@quantities int out
AS
BEGIN
SELECT @quantities = SUM(Quantity) FROM [Order Details] od JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductID = @id
END

DECLARE @Tot INT EXEC sp_product_order_quantity_Gao
        @Tot OUT PRINT
		@Tot
--3
ALTER PROC sp_product_order_city_Gao
@productname varchar(20),
@topcity varchar(20) out,
@totalquantity int out
AS
BEGIN
SELECT TOP 5 @topcity = o.ShipCity, @totalquantity = SUM(d.Quantity)
FROM Orders o JOIN [Order Details] d ON o.OrderID = d.OrderID JOIN Products p ON d.ProductID = p.ProductID
WHERE @productname = p.ProductName
GROUP BY o.ShipCity
ORDER BY SUM(d.ProductID)
END

EXEC sp_product_order_city_Gao
--4
CREATE TABLE people_Gao(Id int, Name char(20),CityId int)

CREATE TABLE city_Gao(CityId int, City char(20))

INSERT INTO people_Gao(Id,Name,CityId) VALUES (1,'Aaron Rodgers',2)
INSERT INTO people_Gao(Id,Name,CityId) VALUES (2,'Russell Wilson',1)
INSERT INTO people_Gao(Id,Name,CityId) VALUES (3,'Jody Nelson',2)
INSERT INTO city_Gao(cityid,city) VALUES (1,'Settle')
INSERT INTO city_Gao(cityid,city) VALUES (2,'Green Bay')

CREATE VIEW Packers_Gao
AS
SELECT p.Id,p.Name
FROM people_Gao p JOIN city_Gao c ON p.CityId = c.CityId
WHERE c.City = 'Green Bay'
BEGIN TRAN
ROLLBACK

DROP TABLE people_Gao
DROP TABLE city_Gao
DROP VIEW Packers_Gao

--5
CREATE PROC sp_birthday_employees_Gao
@birthday datetime
AS
BEGIN
CREATE TABLE birthday_employees_Gao (Birthday datetime)
SELECT @birthday = e.BirthDate
FROM Employees e
WHERE e.BirthDate = 'Feb'
INSERT INTO birthday_employees_Gao (Birthday) VALUES (@birthday)
END

DROP TABLE birthday_employees_Gao

--6
--To make sure if two tables have the same data or not, I would like to use UNION for these two table to check, if the number of rows of the result after using the UNION is same as the two tables, then they have the same data.
--Or we could use EXCEPT keyword