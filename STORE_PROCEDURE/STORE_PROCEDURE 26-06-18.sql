EXEC sp_tables
go

/*Visualizar los registros de la tabla genero*/
select *
FROM Genero
GO

/*crear un stor procedure que permita listar los registros de una tabla genero*/
CREATE PROCEDURE sp_ListGen
AS
BEGIN
    SELECT *
    FROM Genero
END
GO

/*ejecutar SP de listado de genero*/
EXEC sp_ListGen
GO

/*crear un sp que permita visualizar el registro de la tabla clientes*/
create PROCEDURE List_Clientes
AS
BEGIN
    select *
    FROM Cliente
END
GO
/*Ejeutar*/
EXEC List_Clientes

/*Crear un SP que permita listar los clientes ordenados por la columna sexo de forma ascendente*/
CREATE PROCEDURE sp_ListClienSexo
AS
BEGIN
    SELECT *
    FROM Cliente
    ORDER BY Cliente.sexoCliente ASC
END
GO

/*Ejecutar sp_ListClienSexo*/
EXEC sp_ListClienSexo


/*Modificar el SP  anterior de tal forma que permita mostrar el listado 
de clientes de acuerdo al sexo que yo ingrese*/
ALTER PROCEDURE sp_ListClienSexo
    @Sexo VARCHAR(1)
AS
    BEGIN
    SELECT *
    FROM Cliente
    WHERE Cliente.sexoCliente = @Sexo
END
GO

/*Ejecutar SP que muestre los clientes de sexo femenino*/
EXEC sp_ListClienSexo @Sexo = F


/**/
ALTER PROCEDURE sp_ListClienSexo
    @Sexo VARCHAR(1)
AS
    BEGIN
    SELECT CONCAT(Cliente.apeCliente, ',', Cliente.nomCliente AS Cliente,
    Cliente.dniCliente AS DNI,
    Sexo =
    CASE
        WHEN Cliente.sexoCliente = 'F' THEN 'Femenino'
        WHEN Cliente.sexoCliente = 'M' THEN 'Masculino'
    END
    FROM Cliente
    WHERE Cliente.sexoCliente = @Sexo
END
GO

/*Ejecutar*/
EXEC sp


/**/
CREATE PROCEDURE sp_AddGen
    @Codigo VARCHAR(4),
    @Nombre VARCHAR(MAX)
AS
    BEGIN
        INSERT INTO Genero
            (idGenero,nomGenero)
        VALUES
            (@Codigo,@Nombre)
    END
GO

/**/
EXEC sp_AddGen @Codigo = 5, @Nombre = 'Comedia'
GO

/**/
SELECT * FROM Genero
GO

/**/
EXEC sp_AddGen @Codigo = 6, @Nombre = 'Infantil'
EXEC sp_AddGen @Codigo = 7, @Nombre = 'Obra Literaria'
EXEC sp_AddGen @Codigo = 8, @Nombre = 'Drama'
EXEC sp_AddGen @Codigo = 9, @Nombre = 'Ficcion'
GO

/**/
SELECT * FROM Genero
GO

/*Elaborar un SP que permita validar el codigo de genero antes ed ingresar un registro*/
ALTER PROCEDURE sp_ValidRegistro
    @Codigo INT,
    @Nombre VARCHAR(MAX)
AS
    BEGIN
        IF(SELECT Genero.idGenero FROM Genero WHERE Genero.idGenero = @Codigo) IS NOT NULL
            SELECT 'No puedo ingresar el registro porque el codigo ya existe' AS 'Resultado'
        ELSE
            INSERT INTO Genero
                (idGenero,nomGenero)
            VALUES
                (@Codigo,@Nombre);
            SELECT * FROM Genero
            
    END
GO

/*Validar ingreso de genero con el codigo 2*/
EXEC sp_ValidRegistro @Codigo = 10, @Nombre = 'Series'
EXEC sp_ValidRegistro @Codigo = 11, @Nombre = 'Series'
EXEC sp_ValidRegistro @Codigo = 12, @Nombre = 'Cuentos'
GO

/*Eliminar registros a traves de una sp*/
CREATE PROCEDURE sp_DetGene
    @Codigo VARCHAR(4)
AS
    BEGIN
        DELETE FROM Genero
        WHERE Genero.idGenero = @Codigo

    SELECT * from Genero
    END
GO

/*Ejecutar SP*/

EXEC sp_DetGene @Codigo = 10
GO

select* from Genero

/**/
ALTER PROCEDURE sp_DetGene
    @Codigo VARCHAR(4)
AS
    BEGIN
    IF(SELECT Genero.idGenero FROM Genero WHERE Genero.idGenero = @Codigo) IS NOT NULL
    SELECT 'El codigo ya fue eliminado' AS 'Resultado'
        DELETE FROM Genero
        WHERE Genero.idGenero = @Codigo
    END
GO
/**/
EXEC sp_DetGene @Codigo = 12
GO