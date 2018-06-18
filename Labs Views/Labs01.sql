/* Muestrame el nombre, apellido, departamento, estado civil del empleado */

SELECT Person.FirstName as Nombre, Person.LastName as Apellido, HumanResources.Department.Name as Departamento, HumanResources.Employee.MaritalStatus as 'Estado civil'
FROM HumanResources.EmployeeDepartmentHistory
    INNER JOIN Person.Person
    ON EmployeeDepartmentHistory.BusinessEntityID = Person.BusinessEntityID
    INNER JOIN HumanResources.Department
    ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
    INNER JOIN HumanResources.Employee
    ON HumanResources.EmployeeDepartmentHistory.BusinessEntityID = HumanResources.Employee.BusinessEntityID

/* Muestrame el listado de clientes que hicieron su orden de compra en los meses de noviembre y diciembre del año 2012 */


/* Muestrame la cantidad de ordenes de pedido atendidos por cada medio de envio */