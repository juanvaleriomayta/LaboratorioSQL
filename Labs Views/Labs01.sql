/* Muestrame el nombre, apellido, departamento, estado civil del empleado 

SELECT Person.FirstName as Nombre, Person.LastName as Apellido, HumanResources.Department.Name as Departamento, HumanResources.Employee.MaritalStatus as 'Estado civil'
FROM HumanResources.EmployeeDepartmentHistory
    INNER JOIN Person.Person
    ON EmployeeDepartmentHistory.BusinessEntityID = Person.BusinessEntityID
    INNER JOIN HumanResources.Department
    ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
    INNER JOIN HumanResources.Employee
    ON HumanResources.EmployeeDepartmentHistory.BusinessEntityID = HumanResources.Employee.BusinessEntityID */

SELECT Person.FirstName as Nombres, Person.LastName as Apellidos, Employee.MaritalStatus 
as 'Estado Civil',
    HumanResources.Department.Name as 'Departamento'
FROM HumanResources.Employee
    INNER JOIN Person.Person ON
    HumanResources.Employee.BusinessEntityID = Person.Person.BusinessEntityID
    INNER JOIN HumanResources.EmployeeDepartmentHistory
    ON Person.BusinessEntityID=Employee.BusinessEntityID
    INNER JOIN HumanResources.Department
    on EmployeeDepartmentHistory.DepartmentID=Department.DepartmentID
    GO


SELECT Person.FirstName as Nombre, Person.LastName as Apellido, HumanResources.Department.Name as Departamento, HumanResources.Employee.MaritalStatus as 'Estado civil'
FROM HumanResources.EmployeeDepartmentHistory
    INNER JOIN Person.Person
    ON EmployeeDepartmentHistory.BusinessEntityID = Person.BusinessEntityID
    INNER JOIN HumanResources.Department
    ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
    INNER JOIN HumanResources.Employee
    ON HumanResources.EmployeeDepartmentHistory.BusinessEntityID = HumanResources.Employee.BusinessEntityID
    GO
/* Muestrame el listado de clientes que hicieron su orden de compra en los meses de noviembre y diciembre del año 2012 */
SELECT* FROM Person.Person

select CONCAT(Person.LastName,',',Person.FirstName) as clientes,CONCAT(MONTH(OrderDate),'-',
YEAR(OrderDate)) AS 'Mes y Año'
FROM Sales.SalesOrderHeader
INNER JOIN Sales.Customer
ON SalesOrderHeader.CustomerID=Sales.Customer.CustomerID
INNER JOIN Person.Person
ON Customer.PersonID= Person.BusinessEntityID
WHERE YEAR(OrderDate)=2012 AND (MONTH(OrderDate) BETWEEN 11 AND 12)

SELECT * FROM Sales.SalesOrderHeader
SELECT * FROM Sales.Customer WHERE CustomerID = 29825
SELECT * FROM Person.Person WHERE Person.BusinessEntityID = 3412
 

/* Muestrame la cantidad de ordenes de pedido atendidos por cada medio de envio */

SELECT Purchasing.ShipMethod.Name AS 'Medio de Envio',
COUNT(Purchasing.ShipMethod.Name) AS 'Cantidad' 
from Sales.SalesOrderHeader
INNER JOIN Purchasing.ShipMethod
ON Sales.SalesOrderHeader.ShipMethodID = Purchasing.ShipMethod.ShipMethodID
GROUP BY Purchasing.ShipMethod.Name

SELECT * FROM Purchasing.ShipMethod

/*Mostrar la  cantidad de ventas realizadas de acuerdo al pais*/

select Pais =
case
when Sales.SalesTerritory.CountryRegionCode = 'AU' then 'Australia'
when Sales.SalesTerritory.CountryRegionCode = 'US' then 'Estados Unidos'
when Sales.SalesTerritory.CountryRegionCode = 'DE' then 'Alemania'
when Sales.SalesTerritory.CountryRegionCode = 'FR' then 'Francia'
when Sales.SalesTerritory.CountryRegionCode = 'GB' then 'Gran Bretaña'
when Sales.SalesTerritory.CountryRegionCode = 'CA' then 'Canada'
count (Sales.SalesOrderHeader.TerritoryID) as 'Total' 
from Sales.SalesOrderHeader
INNER JOIN Sales.SalesTerritory
ON Sales.SalesTerritory.TerritoryID= Sales.SalesTerritory.TerritoryID
GROUP