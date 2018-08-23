-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2018-08-14 05:04:50.988

-- tables
-- Table: Boleto
CREATE TABLE Boleto (
    cod_Boleto int  IDENTITY(1,1),
    cost_Boleto varchar(100)  ,
    Pasajero_cod_Pasajero int  ,
    Viaje_cod_Viaje int  ,
    Bus_cod_Bus int  ,
    Personal_cod_Personal int  ,
    Ruta_cod_Ruta int  ,
    Sucursal_cod_Sucursal int  ,
    CONSTRAINT Boleto_pk PRIMARY KEY  (cod_Boleto)
);

-- Table: Bus
CREATE TABLE Bus (
    cod_Bus int  IDENTITY(1,1),
    placa_Bus varchar(50)  ,
    asistente_Bus varchar(100)  ,
    estado_Bus varchar(50)  ,
    CONSTRAINT Bus_pk PRIMARY KEY  (cod_Bus)
);

-- Table: Pasajero
CREATE TABLE Pasajero (
    cod_Pasajero int  IDENTITY(1,1),
    nom_Pasajero varchar(100)  ,
    tipodoc_Pasajero varchar(100)  ,
    numdoc_Pasajero char(11)  ,
    cel_Pasajero char(9)  ,
    fecnac_Pasajero date  ,
    CONSTRAINT Pasajero_pk PRIMARY KEY  (cod_Pasajero)
);

-- Table: Personal
CREATE TABLE Personal (
    cod_Personal int  IDENTITY(1,1),
    nom_Personal varchar(100)  ,
    tipo_Personal varchar(100)  ,
    dni_Personal char(8)  ,
    cel_Personal char(9)  ,
    email_Personal varchar(100)  ,
    Sucursal_cod_Sucursal int  ,
    CONSTRAINT Personal_pk PRIMARY KEY  (cod_Personal)
);

-- Table: Ruta
CREATE TABLE Ruta (
    cod_Ruta int  IDENTITY(1,1),
    orig_Ruta varchar(100)  ,
    dest_Ruta varchar(100)  ,
    km_Ruta varchar(50)  ,
    CONSTRAINT Ruta_pk PRIMARY KEY  (cod_Ruta)
);

-- Table: Sucursal
CREATE TABLE Sucursal (
    cod_Sucursal int  IDENTITY(1,1),
    dir_Sucursal varchar(100)  ,
    telf_Sucursal char(7)  ,
    estado_Sucursal varchar(50)  ,
    CONSTRAINT Sucursal_pk PRIMARY KEY  (cod_Sucursal)
);

-- Table: Viaje
CREATE TABLE Viaje (
    cod_Viaje int  IDENTITY(1,1),
    hora_Viaje varchar(100)  ,
    Fecha_Viaje date  ,
    CONSTRAINT Viaje_pk PRIMARY KEY  (cod_Viaje)
);

-- foreign keys
-- Reference: Boleto_Bus (table: Boleto)
ALTER TABLE Boleto ADD CONSTRAINT Boleto_Bus
    FOREIGN KEY (Bus_cod_Bus)
    REFERENCES Bus (cod_Bus);

-- Reference: Boleto_Pasajero (table: Boleto)
ALTER TABLE Boleto ADD CONSTRAINT Boleto_Pasajero
    FOREIGN KEY (Pasajero_cod_Pasajero)
    REFERENCES Pasajero (cod_Pasajero);

-- Reference: Boleto_Personal (table: Boleto)
ALTER TABLE Boleto ADD CONSTRAINT Boleto_Personal
    FOREIGN KEY (Personal_cod_Personal)
    REFERENCES Personal (cod_Personal);

-- Reference: Boleto_Ruta (table: Boleto)
ALTER TABLE Boleto ADD CONSTRAINT Boleto_Ruta
    FOREIGN KEY (Ruta_cod_Ruta)
    REFERENCES Ruta (cod_Ruta);

-- Reference: Boleto_Sucursal (table: Boleto)
ALTER TABLE Boleto ADD CONSTRAINT Boleto_Sucursal
    FOREIGN KEY (Sucursal_cod_Sucursal)
    REFERENCES Sucursal (cod_Sucursal);

-- Reference: Boleto_Viaje (table: Boleto)
ALTER TABLE Boleto ADD CONSTRAINT Boleto_Viaje
    FOREIGN KEY (Viaje_cod_Viaje)
    REFERENCES Viaje (cod_Viaje);

-- Reference: Personal_Sucursal (table: Personal)
ALTER TABLE Personal ADD CONSTRAINT Personal_Sucursal
    FOREIGN KEY (Sucursal_cod_Sucursal)
    REFERENCES Sucursal (cod_Sucursal);

-- End of file.


------------------------------------BOLETO-------------------------------------------


/*ESTE ES EL SP_BOLETO PERMITE ALMACENAR LOS DATOS DEL BOLETO QUE HAN SIDO REGISTRADOS*/
CREATE PROCEDURE SP_BOLETO
    @COST_BOLETO VARCHAR(100),
    @HORVIAJ_BOLETO VARCHAR(100),
    @PASAJERO_COD_PASAJERO INT
AS
BEGIN
    INSERT INTO Boleto
        (cost_Boleto,Pasajero_cod_Pasajero)
    VALUES
        (@COST_BOLETO,UPPER(@PASAJERO_COD_PASAJERO))
END
GO

/*ESTE ES EL SP_BOLETO_UPDATE PERMITE ALMACENAR LOS DATOS QUE HAN SIDO MODIFICADOS*/
CREATE PROCEDURE SP_BOLETO_UPDATE
    @COD_BOLETO INT,
    @COST_BOLETO VARCHAR(100),
    @PASAJERO_COD_PASAJERO INT
AS
BEGIN
    UPDATE Boleto
SET
cost_Boleto = @COST_BOLETO,
Pasajero_cod_Pasajero = @PASAJERO_COD_PASAJERO
WHERE cod_Boleto = @COD_BOLETO
END
GO

/*ESTE ES LA VISTA VW_LISTA_BOLETO PERMITE LISTAR LOS DATOS QUE FUERON REGISTRADOS DE LA BOLETA*/
CREATE VIEW VW_LISTA_BOLETO
AS
        SELECT cost_Boleto, UPPER(Pasajero.nom_Pasajero) AS Pasajero
    FROM Boleto
    INNER JOIN Pasajero ON Boleto.Pasajero_cod_Pasajero = Pasajero.cod_Pasajero
GO




---------------------------BUS----------------------------------------

/*ESTE ES EL SP_BUS PERMITE ALMACENAR LOS DATOS REGISTRADOS DEL BUS Y EL CHOFER CORRESPONDIENTE*/
CREATE PROCEDURE SP_BUS
    @PLACA_BUS VARCHAR(50)
AS
BEGIN
    INSERT INTO Bus
        (placa_Bus)
    VALUES
        (UPPER(@PLACA_BUS))
END
GO

/*ESTE ES EL SP_BUS_UPDATE PERMITE ALMACENAR LOS DATOS QUE FUERON MODIFICADOS DEL BUS Y CHOFER CORRESPONDIENTE*/
CREATE PROCEDURE PS_BUS_UPDATE
    @COD_BUS INT,
    @PLACA_BUS VARCHAR(50)
AS
BEGIN
    UPDATE Bus
SET
placa_Bus = UPPER(@PLACA_BUS)
WHERE cod_Bus = @COD_BUS
END
GO

/*ESTE ES LA VISTA VW_LISTA_BUS PERMITE VISUALIZAR EL LISTADO DEL BUS Y CHOFER CORRESPONDIENTE*/
CREATE  VIEW VW_LISTA_BUS
AS
    SELECT cod_Bus, UPPER(placa_Bus) AS placa_Bus
    FROM Bus
GO


----------------------------------CHOFER-------------------------------------

/*ESTE ES EL SP_CHOFER PERMITE ALMACENAR LOS DATOS QUE FUERON REGISTRADOS DEL CHOFER*/

CREATE PROCEDURE SP_CHOFER
    @NOM_CHOFER VARCHAR(100) ,
    @APE_CHOFER VARCHAR(100) ,
    @DNI_CHOFER CHAR(8),
    @CEL_CHOFER CHAR(9)

AS
BEGIN
    INSERT INTO Chofer
        (nom_Chofer,ape_Chofer,dni_Chofer,cel_Chofer)
    VALUES
        (UPPER(@NOM_CHOFER), UPPER(@APE_CHOFER), @DNI_CHOFER, @CEL_CHOFER)
END
GO


/*ESTE SP_CHOFER_UPDATE PERMITE ALMACENAR LOS DATOS QUE FUERON MODIFICADOS O ACTUALIZADOS CORRECTAMENTE DEL CHOFER*/
CREATE PROCEDURE SP_CHOFER_UPDATE
    @COD_CHOFER INT,
    @NOM_CHOFER VARCHAR(100) ,
    @APE_CHOFER VARCHAR(100) ,
    @DNI_CHOFER CHAR(8),
    @CEL_CHOFER CHAR(9)
AS
BEGIN
    UPDATE Chofer
SET
nom_Chofer = UPPER(@NOM_CHOFER),
ape_Chofer = UPPER(@APE_CHOFER),
dni_Chofer = @DNI_CHOFER,
cel_Chofer = @CEL_CHOFER
WHERE cod_Chofer = COD_CHOFER
END
GO


/*ESTE VW_CHOFER_LISTA PERMITE VISUALIZAR LA LISTA DE LOS DATOS DEL CHOFER QUE FUERON REGISTRADOS*/
CREATE VIEW VW_CHOFER_LISTA
AS
    SELECT Chofer.cod_Chofer, UPPER(Chofer.nom_Chofer) AS nom_Chofer,
        UPPER(Chofer.ape_Chofer) AS ape_Chofer, Chofer.dni_Chofer, Chofer.cel_Chofer
    FROM Chofer
GO


---------------------------PASAJERO------------------------------------------------------


/*ESTE SP_PASAJERO PERMITE ALMACENAR LOS DATOS QUE FUERON REGISTRADOS DEL PASAJERO CORRECTAMENTE*/
CREATE PROCEDURE SP_PASAJERO
    @NOM_PASAJERO VARCHAR(100) ,
    @APE_PASAJERO VARCHAR(100) ,
    @DNI_PASAJERO CHAR(8) ,
    @CEL_PASAJERO CHAR(9),
    @FECNAC_PASAJERO CHAR(10)
AS
BEGIN
    INSERT INTO Pasajero
        (nom_Pasajero,ape_Pasajero,dni_Pasajero,cel_Pasajero,fecnac_Pasajero)
    VALUES
        (UPPER(@NOM_PASAJERO), UPPER(@APE_PASAJERO), @DNI_PASAJERO, @CEL_PASAJERO, FORMAT(CONVERT(DATE,@FECNAC_PASAJERO,103),'dd/MM/yyyy','en-gb'))
END
GO

/*ESTE SP_PASAJERO_UPDATE PERMITE ALMACENAR LOS DATOS QUE FUERON ACTUALIZADOS O MODIFICADOS CORRESPONDIDOS A LA TABLA CHOFER*/
CREATE PROCEDURE SP_PASAJERO_UPDATE
    @COD_PASAJERO INT,
    @NOM_PASAJERO VARCHAR(100) ,
    @APE_PASAJERO VARCHAR(100) ,
    @DNI_PASAJERO CHAR(8) ,
    @CEL_PASAJERO CHAR(9),
    @FECNAC_PASAJERO CHAR(10)
AS
BEGIN
    UPDATE Pasajero
SET
nom_Pasajero = UPPER(@NOM_PASAJERO),
ape_Pasajero = UPPER(@APE_PASAJERO),
dni_Pasajero = @DNI_PASAJERO,
cel_Pasajero = @CEL_PASAJERO,
fecnac_Pasajero = CONVERT(DATE,@FECNAC_PASAJERO,103)
WHERE cod_Pasajero = @COD_PASAJERO
END
GO

/*ESTE VW_PASAJERO_LISTA PERMITE VISUALIZAR EL LISTADO DE PASAJEROS QUE FUERON REGISTRADOS*/
CREATE VIEW VW_PASAJERO_LISTA
AS
    SELECT cod_Pasajero, UPPER(Pasajero.nom_Pasajero) AS nom_Pasajero, UPPER(Pasajero.ape_Pasajero) AS ape_Pasajero, Pasajero.dni_Pasajero, Pasajero.cel_Pasajero,
        FORMAT(CONVERT(DATE,Pasajero.fecnac_Pasajero,103),'dd/MM/yyyy','en-gb') AS fecnac_Pasajero
    FROM Pasajero
GO 