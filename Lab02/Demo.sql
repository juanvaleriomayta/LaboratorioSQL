select ModifiedDate, City from Person.Address
WHERE YEAR(ModifiedDate)='2014' AND
MONTH(ModifiedDate)='01' AND
City = 'Beaverton'


select AddressLine2 from Person.Address
WHERE AddressLine2 like 'B%'


select * FROM Person.Person
WHERE LastName = 'Miller'


select * from HumanResources.Employee WHERE not Gender = 'M';

SELECT * from Person.Person
WHERE FirstName like 'M%'

select * from HumanResources.Employee WHERE BusinessEntityID >= '10' AND BusinessEntityID <='48'

select BusinessEntityID, JobTitle FROM HumanResources.Employee WHERE BusinessEntityID >= '10' AND BusinessEntityID <='48'
OR JobTitle like 'P%'

