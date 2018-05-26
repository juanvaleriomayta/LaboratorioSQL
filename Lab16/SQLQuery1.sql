--Crear una BD en Blanco--
create database HospitalHHH;
go

--Necesito visualizar la Base de Datos de tu Servidor--
select database_id, name 
from sys.databases;
go

use HospitalHHH;

--usar una base de datos--
use AdventureWorks2016;

select name from sys.tables

use AdventureWorks2016
select name from sys.views;

--visualizar la informacion detallada de una base de datos--
EXEC sp_helpdb AdventureWorks2016;

-- Create a new database called 'DatabaseName'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'DatabaseName'
)
CREATE DATABASE MercadoVG
GO

--eliminar una BD---
drop database HospitalHHH;

--Eliminar una base de datos adventure works--
drop database AdventureWorks2016;
