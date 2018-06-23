/* Mi primer procedimiento almacenado*/

CREATE PROCEDURE sp_SumNum
    @VarUno INT = 0,
    @VarDos INT = 0,
    @Suma INT = 0
AS
BEGIN
    SET @Suma = @VarUno + @VarDos
    SELECT @Suma
END
GO
/*Ejecutar mi Primer Almacenamiento*/
EXEC sp_SumNum
/*Modificar mi Primer Almacenamiento*/
ALTER PROCEDURE sp_SumNum
    @VarUno INT = 0,
    @VarDos INT = 0,
    @Suma INT = 0
AS
BEGIN
    SET @Suma = @VarUno + @VarDos
    SELECT @Suma AS 'Total'
END
GO
/*Eliminar mi Primer Almacenamiento*/
DROP PROCEDURE sp_SumNum
GO

-------------------

/*Elaborar un sp que permita ingresar dos numeros la sumatoria*/
CREATE PROCEDURE sp_SumNum2
    @VarUno INT,
    @VarDos INT,
    @Suma INT = 0
AS
BEGIN
    SET @Suma = @VarUno + @VarDos
    SELECT @Suma AS 'Total'
END
GO
/*Ejecutar mi Primer Almacenamiento*/
EXEC sp_SumNum2 @VarUno = 30, @VarDos = 50
GO


---------------


/*Elaborar un sp que permita ingresar dos numeros la multiplicacion*/
CREATE PROCEDURE sp_SumNum3
    @VarUno INT,
    @VarDos INT,
    @Suma INT = 0
AS
BEGIN
    SET @Suma = @VarUno * @VarDos
    SELECT @Suma AS 'Total'
END
GO
/*Ejecutar mi Primer Almacenamiento*/
EXEC sp_SumNum3 @VarUno = 30, @VarDos = 50
GO


-----------


/*Elaborar un SP que permita ingresar dos numeros y devolver el mayor de ellos*/
CREATE PROCEDURE sp_Evaluar
    @NumUno INT,
    @NumDos INT
AS
BEGIN
    IF @NumUno > @NumDos
        SELECT @NumUno AS 'numero Mayor'
    ELSE 
        SELECT @NumDos AS 'numero Mayor'
END
GO
/*Ejecutar mi Primer Almacenamiento*/
EXEC sp_Evaluar @NumUno = 30, @NumDos = 50
GO




-------------



/*eLABORAR UN SP QUE PERMITA COMPARAR DOS NUMEROS SI SON IGUALES O SI SON DIFERENTES DEVOLVER EL MAYOR*/
CREATE PROCEDURE sp_Evaluar2
    @NumUno INT,
    @NumDos INT
AS
BEGIN
    IF @NumUno = @NumDos
        PRINT 'numero igual' 
    ELSE
        IF @NumUno > @NumDos
            SELECT @NumUno AS 'NUMEROS MAYORES'
        ELSE
            SELECT @NumDos AS 'NUMEROS MAYORES'
END
GO

EXEC sp_Evaluar2 @NumUno = 50, @NumDos = 50
EXEC sp_Evaluar2 @NumUno = 50, @NumDos = 500
GO


----------------
/**/
CREATE PROCEDURE sp_Evaluar4
    @NumUno INT,
    @NumDos INT
AS
BEGIN
    IF @NumUno = @NumDos
        PRINT 'numero igual' 
    ELSE
        IF @NumUno > @NumDos
            SELECT @NumUno AS 'NUMEROS MAYORES'
            SELECT @NumDos AS 'NUMEROS MAYORES'
        ELSE
            SELECT @NumDos AS 'NUMEROS MAYORES'
            
END
GO

EXEC sp_Evaluar4 @NumUno = 100, @NumDos = 20
EXEC sp_Evaluar4 @NumUno = 30, @NumDos = 50

GO



/**/
CREATE PROCEDURE sp_Listar
    @Num INT,
    @Inicio INT = 0
    AS
    BEGIN
    WHILE (@Inicio < @Num)
    BEGIN
        SET @Inicio = @Inicio + 1
        PRINT @Inicio
    END
    END
    GO

    /*listar 5 numeros*/
    
EXEC sp_Listar @Num = 1000000

/*Elaborar un SP que permita repetir el mensaje "retroceder nunca jamas" 
de acuerdo a un numero que ha sido ingresado*/

CREATE PROCEDURE sp_Listar
    @Num INT,
    @Inicio INT = 0
    AS
    BEGIN
    WHILE (@Inicio < @Num)
    BEGIN
        SET @Inicio = @Inicio + 1
        PRINT @Inicio
    END
    END
    GO 

    /*Elaborar un sp que permita ingresar un nombre y devuelva un mensaje 
    de saludo con el mismo nombre*/
    CREATE PROCEDURE sp_Listar1
    @Nombre VARCHAR(40)
    
    AS
    BEGIN
        PRINT 'hola' + @nombre
    END
    GO 



    /**/
      CREATE PROCEDURE sp_NomFecNac
    @Nombre VARCHAR(40),
        @FecNac DATE

    AS
    BEGIN
        SELECT @Nombre as Nombre, @FecNac AS 'Fecha de Nacimiento'
    END
    GO 
    /**/
    --- ver la configuaracion de idioma de servidor
    SELECT @@LANGUAGE
    GO
    --- ver el formato de fecha de acuerdo al idioma
    EXEC sp_helplanguage
    --- probando SP
    EXEC sp_NomFecNac @Nombre = 'Manuel Alberto', @FecNac = '06-23-2018'

    /*Elaborar un SP que permita ingresar un nombre y fecha de  nacimiento en formato dd/MM/yyyy*/
          CREATE PROCEDURE sp_NomFecNa2
    @Nombre VARCHAR(40),
        @FecNac VARCHAR(10)

    AS
    BEGIN
        SELECT @Nombre as Nombre,
        Format (CONVERT(datetime, @FecNac,103), 'd', 'en-gb') AS 'Fecha de Nacimiento'
        
    END
    GO 
        --- probando SP
    EXEC sp_NomFecNa2 @Nombre = Oscar, @FecNac = '06-03-2018'


    /*Elaborar un SP que permita ingresar u nombre, una fecha de nacimeinto y 
    devuelva los mismos datos mas la edad basada en años*/

CREATE PROCEDURE sp_NomFecNa4
    @Nombre VARCHAR(40),
    @FecNac VARCHAR(10)

AS
BEGIN
    SELECT @Nombre as Nombre,
        Format (CONVERT(datetime, @FecNac,103), 'd', 'en-gb') AS 'Fecha de Nacimiento',
        DATEDIFF(YEAR, CONVERT(datetime, @FecNac,103), GETDATE()) AS 'Edad'

END
    GO 
   EXEC sp_NomFecNa3 @Nombre = Oscar, @FecNac = '10-10-1999'


/*Poner en uso la base de datos Adventure*/
use AdventureWorks2016
