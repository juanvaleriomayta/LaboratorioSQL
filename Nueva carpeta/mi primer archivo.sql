-- drop database BDHospital
create database BDFarmacia
go
use BDFarmacia
go

-- drop table paciente	ok
CREATE TABLE PACIENTE
(
	NUMPAC		bigint identity(1,1) primary key,	-- numero correlativo 
	NOMPAC		varchar(30) not NULL ,			-- nombre
	APEPAC		varchar(70) not null,			-- apellido
	SEXPAC		char(1) not null,			-- sexo	M o F
	DNIPAC		char(8) not null,			-- dni	
	FNPAC		date,					-- fecha de nacimiento
	DIRPAC		varchar(60),
	UBIPAC		char(6)
)
GO
-- drop table usuario   OK
CREATE TABLE USUARIO		-- personal
(
	NUMUSU			int PRIMARY KEY NOT NULL ,
	NOMUSU			varchar(50),
	APEUSU			varchar(80),
	USUUSU			char(5),
	PWDUSU			varchar(50),
	DNIUSU			char(8),
	LEVUSU			CHAR(1)				-- niveles de acceso: 1 ADMIN , 2 OPERARIO
)
go


-- drop table proveedor		ok
CREATE TABLE PROVEEDOR
(
	NUMPROV		int primary key NOT NULL ,
	RAZPROV		varchar(80),
	RUCPROV		char(11),
	DIRPROV		varchar(100),
	TELFPROV	varchar(50),
	NUMUBI		char(6)
)
go

-- drop table medicina		ok
CREATE TABLE MEDICINA
(
	NUMMED		bigint primary key  NOT NULL ,
	NOMGENMED	varchar(100),		-- nombre genérico del medicamento
	NOMCOMMED	varchar(80),		-- nombre comercial del medicamento
	COSMED		decimal(10,2),		-- costo
	PRECMED		decimal(10,2),		-- precio 
	PREMED		varchar(40),		-- presentación: frasco, tableta, tarro, etc
	CANTMED		int,				-- cantidad
	FCHMED		datetime,			-- fecha de vencimiento 
	NUMPROV		bigint				-- proveedor
)
go
CREATE TABLE DOC_VENTA
(
	NCOD_DOC	bigint primary key,					-- codigo correlativo de la venta
	NUM_DOC		varchar(14) NOT NULL ,				-- 0002-123456
	TIP_DOC		char(10),							-- si es boleta , factura o ticket
	FCHING_DOC	datetime ,					-- default getdate(),	-- fecha de la venta
	MONT_DOC	decimal(10,2),						-- monto total de la venta
	OBS_DOC		varchar(50),						-- observación
	NUMPAC		bigint								-- código del paciente
)
go
-- drop table detventa
CREATE TABLE DETVENTA
(
	NUMMED		bigint  NOT NULL ,
	NCOD_DOC	bigint  NOT NULL ,
	CANTV_MED	int,					-- cantidad de medicina vendida
	STOTV_DOC	decimal(10,2),				-- subtotal de medicina vendida
	CONSTRAINT  XPKDETVENTA PRIMARY KEY (NUMMED  ASC,NCOD_DOC  ASC)
)
GO
-- drop table DOC_COMPRA
CREATE TABLE DOC_COMPRA
(
	NCOD_DOC	bigint primary key,	-- codigo correlativo de la compra
	NUM_DOC		varchar(14) NOT NULL ,	-- nro de la boleta, factura o guia
	TIP_DOC		varchar(12),			-- boleta , factura , GuiaRemision, 
	FCHING_DOC  datetime default getdate(),			-- fecha de ingreso
	MONT_DOC	decimal(12,2),		-- monto total de la compra
	OBS_DOC		varchar(50),		-- observación	
	EST_DOC		char(1),			-- eliminado, compra o donacion: E,A,D
	NUMPROV		int					-- código del proveedor
)

go

-- drop table detcompra
CREATE TABLE DETCOMPRA
(
	NUMMED		bigint  NOT NULL ,
	NCOD_DOC	bigint  NOT NULL ,
	PRECMED		decimal(8,2),		-- precio de compra del medicamento
	CANTC_MED	int,				-- cantidad de compra de la medicina
	STOTC_DOC	decimal(12,2),		-- sub total del medicamento		
	CONSTRAINT  XPKDETCOMPRA PRIMARY KEY (NUMMED  ASC,NCOD_DOC  ASC)
)