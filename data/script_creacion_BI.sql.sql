USE [GD2C2023]
GO

-- Creaci�n de tablas


CREATE TABLE CUATRO_HISPANOS.BI_TIPO_INMUEBLE(
  NRO_TIPO  NUMERIC(18,0) PRIMARY KEY IDENTITY(1,1) NOT NULL,
  TIPO_INMUEBLE NVARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE CUATRO_HISPANOS.BI_SUCURSAL(
  NRO_SUCURSAL NUMERIC(18,0) PRIMARY KEY IDENTITY(1,1) NOT NULL,
  SUCURSAL_NOMBRE NVARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE CUATRO_HISPANOS.BI_RANGO_M2(
  NRO_RANGO_M2 NUMERIC(18,0) PRIMARY KEY IDENTITY (1,1),
  RANGO_M2 NVARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE CUATRO_HISPANOS.BI_MONEDA(
    TIPO_MONEDA NUMERIC(18,0) PRIMARY KEY IDENTITY(1,1) NOT NULL,
    MONEDA NVARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE CUATRO_HISPANOS.BI_RANGO_ETARIO(
  NRO_RANGO_ETARIO NUMERIC(18,0) PRIMARY KEY IDENTITY (1,1),
  RANGO_ETARIO NVARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE CUATRO_HISPANOS.BI_TIPO_OPERACION(
    NRO_OPERACION NUMERIC(18,0)  PRIMARY KEY  IDENTITY(1,1) NOT NULL,
    TIPO_OPERACION NVARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE CUATRO_HISPANOS.BI_UBICACION(
    NRO_UBICACION NUMERIC(18, 0) PRIMARY KEY  IDENTITY(1,1) NOT NULL,
    BARRIO NVARCHAR(100) NOT NULL,
    LOCALIDAD NVARCHAR(100) NOT NULL,
    PROVINCIA NVARCHAR(100) NOT NULL
);
CREATE TABLE CUATRO_HISPANOS.BI_AMBIENTE(
    NRO_AMBIENTE NUMERIC(18, 0) PRIMARY KEY  IDENTITY(1,1) NOT NULL,
    EXTRA NVARCHAR(100) NULL,
    CANTIDAD NUMERIC(18, 0) NOT NULL
);
CREATE TABLE CUATRO_HISPANOS.BI_TIEMPO(
  CODIGO_TIEMPO NUMERIC(18,0) PRIMARY KEY IDENTITY (1,1),
  MES NUMERIC(18,0) NOT NULL,
  ANIO NUMERIC(18,0) NOT NULL,
  CUATRIMESTRE NUMERIC(18,0) NOT NULL
);

CREATE TABLE CUATRO_HISPANOS.BI_ESTADO_ANUNCIO(
    NRO_ESTADO_ANUNCIO NUMERIC(18,0) PRIMARY KEY  IDENTITY(1,1) NOT NULL,
    ESTADO_ANUNCIO NVARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE CUATRO_HISPANOS.BI_HECHO_ANUNCIO(
  ANUNCIO_NRO_UBICACION NUMERIC(18,0) NOT NULL,
  ANUNCIO_NRO_TIPO_INMUEBLE  NUMERIC(18,0) NOT NULL,
  ANUNCIO_RANGO_M2 NUMERIC(18,0) NOT NULL,
  ANUNCIO_TIPO_MONEDA NUMERIC(18,0) NOT NULL,
  ANUNCIO_TIEMPO NUMERIC(18,0) NOT NULL,
  ANUNCIO_RANGO_ETARIO NUMERIC(18,0) NOT NULL,
  ANUNCIO_NRO_ESTADO NUMERIC(18,0) NOT NULL,
  ANUNCIO_SUCURSAL NUMERIC(18,0) NOT NULL,
  ANUNCIO_TIPO_OPERACION NUMERIC(18,0) NOT NULL,
  ANUNCIO_CANTIDAD INTEGER,
  ANUNCIO_TOTAL NUMERIC(18,2),
  ANUNCIO_DIAS NUMERIC(18,2),
  ANUNCIO_AMBIENTE NUMERIC(18,0)

  PRIMARY KEY(ANUNCIO_NRO_UBICACION, 
			  ANUNCIO_NRO_TIPO_INMUEBLE, 
			  ANUNCIO_RANGO_M2,
			  ANUNCIO_TIPO_MONEDA,
			  ANUNCIO_TIEMPO,
			  ANUNCIO_RANGO_ETARIO,
			  ANUNCIO_NRO_ESTADO,
			  ANUNCIO_SUCURSAL,
			  ANUNCIO_TIPO_OPERACION,
			  ANUNCIO_AMBIENTE
			  )
);


CREATE TABLE CUATRO_HISPANOS.BI_HECHO_PAGO_ALQUILER(
  PAGO_ALQUILER_TIEMPO numeric(18,0) PRIMARY KEY NOT NULL,
  PAGO_ALQUILER_PORCENTAJE NUMERIC(18,2)
);


CREATE TABLE CUATRO_HISPANOS.BI_HECHO_ALQUILER(
  ALQUILER_NRO_UBICACION NUMERIC(18,0) NOT NULL,
  ALQUILER_TIEMPO NUMERIC(18,0) NOT NULL,
  ALQUILER_RANGO_ETARIO_INQ NUMERIC(18,0) NOT NULL,
  ALQUILER_RANGO_ETARIO_AGE NUMERIC(18,0) NOT NULL,
  ALQUILER_RANGO_M2 NUMERIC(18,0) NOT NULL,
  ALQUILER_SUCURSAL NUMERIC(18,0) NOT NULL,
  ALQUILER_TIPO_INMUEBLE NUMERIC(18,0)NOT NULL,
  ALQUILER_ALTAS INTEGER, 
  ALQUILER_PAGOS INTEGER, 
  ALQUILER_PAGOS_VENCIDOS INTEGER,
  ALQUILER_COMISION NUMERIC(18,2),
  ALQUILER_TOTAL_PAGOS NUMERIC(18,2)

  PRIMARY KEY(ALQUILER_NRO_UBICACION, 
			  ALQUILER_TIEMPO,
			  ALQUILER_RANGO_ETARIO_INQ,
			  ALQUILER_RANGO_ETARIO_AGE,
			  ALQUILER_RANGO_M2,
			  ALQUILER_SUCURSAL,
			  ALQUILER_TIPO_INMUEBLE
			  )
);



CREATE TABLE CUATRO_HISPANOS.BI_HECHO_VENTA(
  VENTA_NRO_TIPO_INMUEBLE  NUMERIC(18,0) NOT NULL,
  VENTA_UBICACION NUMERIC(18,0) NOT NULL,
  VENTA_NRO_AMBIENTE NUMERIC(18,0) NOT NULL,
  VENTA_TIEMPO NUMERIC(18,0) NOT NULL,
  VENTA_SUCURSAL NUMERIC(18,0) NOT NULL,
  VENTA_MONEDA NUMERIC(18,0) NOT NULL,
  VENTA_RANGO_ETARIO_AGE NUMERIC(18,0) NOT NULL,
  VENTA_RANGO_M2 NUMERIC(18,0) NOT NULL,
  VENTA_SUPERFICIES_TOTALES NUMERIC(18,2),
  VENTA_ALTAS INTEGER, 
  VENTA_IMPORTES_DE_PAGOS NUMERIC(18,2),
  VENTA_PAGADO_TOTAL NUMERIC(18,2),
  VENTA_CANT_PAGOS INTEGER,
  VENTA_COMISION NUMERIC(18,2)

  PRIMARY KEY(VENTA_NRO_TIPO_INMUEBLE,
			  VENTA_UBICACION,
			  VENTA_NRO_AMBIENTE,
			  VENTA_TIEMPO,
			  VENTA_SUCURSAL,
			  VENTA_MONEDA,
			  VENTA_RANGO_ETARIO_AGE,
			  VENTA_RANGO_M2
			  )
);

-- Creaci�n de FKs

ALTER TABLE CUATRO_HISPANOS.BI_HECHO_ANUNCIO
  ADD FOREIGN KEY (ANUNCIO_NRO_UBICACION) REFERENCES CUATRO_HISPANOS.BI_UBICACION(NRO_UBICACION),
    FOREIGN KEY (ANUNCIO_NRO_TIPO_INMUEBLE) REFERENCES CUATRO_HISPANOS.BI_TIPO_INMUEBLE(NRO_TIPO),
    FOREIGN KEY (ANUNCIO_RANGO_M2) REFERENCES CUATRO_HISPANOS.BI_RANGO_M2(NRO_RANGO_M2),
    FOREIGN KEY (ANUNCIO_RANGO_ETARIO) REFERENCES CUATRO_HISPANOS.BI_RANGO_ETARIO(NRO_RANGO_ETARIO),
    FOREIGN KEY (ANUNCIO_TIEMPO) REFERENCES CUATRO_HISPANOS.BI_TIEMPO(CODIGO_TIEMPO),
    FOREIGN KEY (ANUNCIO_TIPO_MONEDA) REFERENCES CUATRO_HISPANOS.BI_MONEDA(TIPO_MONEDA),
	FOREIGN KEY (ANUNCIO_NRO_ESTADO) REFERENCES CUATRO_HISPANOS.BI_ESTADO_ANUNCIO(NRO_ESTADO_ANUNCIO),
	FOREIGN KEY (ANUNCIO_SUCURSAL) REFERENCES CUATRO_HISPANOS.BI_SUCURSAL(NRO_SUCURSAL),
	FOREIGN KEY (ANUNCIO_TIPO_OPERACION) REFERENCES CUATRO_HISPANOS.BI_TIPO_OPERACION(NRO_OPERACION),
	FOREIGN KEY (ANUNCIO_AMBIENTE) REFERENCES CUATRO_HISPANOS.BI_AMBIENTE(NRO_AMBIENTE)
GO


ALTER TABLE CUATRO_HISPANOS.BI_HECHO_ALQUILER
  ADD FOREIGN KEY (ALQUILER_NRO_UBICACION) REFERENCES CUATRO_HISPANOS.BI_UBICACION(NRO_UBICACION),
    FOREIGN KEY (ALQUILER_TIPO_INMUEBLE) REFERENCES CUATRO_HISPANOS.BI_TIPO_INMUEBLE(NRO_TIPO),
    FOREIGN KEY (ALQUILER_RANGO_ETARIO_INQ) REFERENCES CUATRO_HISPANOS.BI_RANGO_ETARIO(NRO_RANGO_ETARIO),
	FOREIGN KEY (ALQUILER_RANGO_ETARIO_AGE) REFERENCES CUATRO_HISPANOS.BI_RANGO_ETARIO(NRO_RANGO_ETARIO),
	FOREIGN KEY (ALQUILER_RANGO_M2) REFERENCES CUATRO_HISPANOS.BI_RANGO_M2(NRO_RANGO_M2),
    FOREIGN KEY (ALQUILER_TIEMPO) REFERENCES CUATRO_HISPANOS.BI_TIEMPO(CODIGO_TIEMPO),
	FOREIGN KEY (ALQUILER_SUCURSAL) REFERENCES CUATRO_HISPANOS.BI_SUCURSAL(NRO_SUCURSAL);
GO

ALTER TABLE CUATRO_HISPANOS.BI_HECHO_VENTA
  ADD FOREIGN KEY (VENTA_NRO_TIPO_INMUEBLE) REFERENCES CUATRO_HISPANOS.BI_TIPO_INMUEBLE(NRO_TIPO),
    FOREIGN KEY (VENTA_UBICACION) REFERENCES CUATRO_HISPANOS.BI_UBICACION(NRO_UBICACION),
	FOREIGN KEY (VENTA_NRO_AMBIENTE) REFERENCES CUATRO_HISPANOS.BI_AMBIENTE(NRO_AMBIENTE),
	FOREIGN KEY (VENTA_MONEDA) REFERENCES CUATRO_HISPANOS.BI_MONEDA(TIPO_MONEDA),
	FOREIGN KEY (VENTA_RANGO_ETARIO_AGE) REFERENCES CUATRO_HISPANOS.BI_RANGO_ETARIO(NRO_RANGO_ETARIO),
	FOREIGN KEY (VENTA_RANGO_M2) REFERENCES CUATRO_HISPANOS.BI_RANGO_M2(NRO_RANGO_M2),
    FOREIGN KEY (VENTA_TIEMPO) REFERENCES CUATRO_HISPANOS.BI_TIEMPO(CODIGO_TIEMPO),
	FOREIGN KEY (VENTA_SUCURSAL) REFERENCES CUATRO_HISPANOS.BI_SUCURSAL(NRO_SUCURSAL);
GO

ALTER TABLE CUATRO_HISPANOS.BI_HECHO_PAGO_ALQUILER
  ADD FOREIGN KEY (PAGO_ALQUILER_TIEMPO) REFERENCES CUATRO_HISPANOS.BI_TIEMPO(CODIGO_TIEMPO);
GO


--- FUNCIONES


CREATE OR ALTER FUNCTION CUATRO_HISPANOS.obtener_rango_M2_ANUNCIO_EFI(@inmueble numeric(18,0))
RETURNS numeric(18,0)
AS
BEGIN

DECLARE @superficie numeric(18,0)
DECLARE @id_rango numeric(18,0)

SET @superficie = (SELECT TOP 1 INMUEBLE.SUPERFICIE_INMUEBLE
				   FROM CUATRO_HISPANOS.INMUEBLE
				   WHERE INMUEBLE.NRO_INMUEBLE = @inmueble
				   )
SET @id_rango = (SELECT CASE WHEN @superficie <35
						THEN (SELECT BI_RANGO_M2.NRO_RANGO_M2
							  FROM CUATRO_HISPANOS.BI_RANGO_M2
							  WHERE BI_RANGO_M2.RANGO_M2 = '<35') 
						WHEN @superficie BETWEEN 35 and 55
						THEN (SELECT BI_RANGO_M2.NRO_RANGO_M2
							  FROM CUATRO_HISPANOS.BI_RANGO_M2
							  WHERE BI_RANGO_M2.RANGO_M2 = '35-55')  
						WHEN @superficie BETWEEN 55 and 75
						THEN (SELECT BI_RANGO_M2.NRO_RANGO_M2
							  FROM CUATRO_HISPANOS.BI_RANGO_M2
							  WHERE BI_RANGO_M2.RANGO_M2 = '55-75')
						WHEN @superficie BETWEEN 75 and 100
						THEN (SELECT BI_RANGO_M2.NRO_RANGO_M2
							  FROM CUATRO_HISPANOS.BI_RANGO_M2
							  WHERE BI_RANGO_M2.RANGO_M2 = '75-100')	  
						WHEN @superficie > 100
						THEN (SELECT BI_RANGO_M2.NRO_RANGO_M2
							  FROM CUATRO_HISPANOS.BI_RANGO_M2
							  WHERE BI_RANGO_M2.RANGO_M2 = '>100')	
						END )
RETURN @id_rango
END
GO


CREATE OR ALTER FUNCTION CUATRO_HISPANOS.obtener_tiempo(@fecha datetime)
RETURNS numeric(18,0)
AS
BEGIN

DECLARE @id_tiempo numeric(18,0)

SET @id_tiempo = (SELECT TOP 1 BI_TIEMPO.CODIGO_TIEMPO
				  FROM CUATRO_HISPANOS.BI_TIEMPO
				  WHERE BI_TIEMPO.ANIO = YEAR(@fecha)
				  AND BI_TIEMPO.MES = MONTH(@fecha)
				  AND BI_TIEMPO.CUATRIMESTRE = CAST((MONTH(@fecha)-1) / 4 AS INT) + 1
				 )

RETURN @id_tiempo				

END
GO



CREATE FUNCTION CUATRO_HISPANOS.identificarMoneda(@tipoMoneda NUMERIC(18,0))
RETURNS NVARCHAR(100)
AS
BEGIN

DECLARE @tipo NVARCHAR(100)

SET @tipo = (SELECT TOP 1 BI_MONEDA.MONEDA
			FROM CUATRO_HISPANOS.BI_MONEDA
			WHERE BI_MONEDA.TIPO_MONEDA = @tipoMoneda )
RETURN @tipo
END
GO




CREATE OR ALTER FUNCTION CUATRO_HISPANOS.obtener_BI_UBICACION(@prov NVARCHAR(100), @loc NVARCHAR(100), @barr NVARCHAR(100))
RETURNS numeric(18,0)
AS
BEGIN

DECLARE @id numeric(18,0)
SET @id = (SELECT TOP 1 BI_UBICACION.NRO_UBICACION
		   FROM CUATRO_HISPANOS.BI_UBICACION
		   WHERE BI_UBICACION.BARRIO = @barr
		   AND BI_UBICACION.LOCALIDAD = @loc
		   AND BI_UBICACION.PROVINCIA = @prov 
		   ) 
RETURN @id

END
GO



CREATE OR ALTER FUNCTION CUATRO_HISPANOS.obtener_rango_etario_AGENTE(@FECHANAC DATETIME)
RETURNS numeric(18,0)
AS
BEGIN

    DECLARE @rango NVARCHAR(100)
	DECLARE @id numeric(18,0)
    DECLARE @edad NUMERIC(18,0)
    SET @edad = YEAR(GETDATE()) - YEAR(@FECHANAC)

    SET @rango = 
        CASE 
            WHEN @edad < 25 THEN '<25'
            WHEN @edad BETWEEN 25 and 35 THEN '25-35'
            WHEN @edad BETWEEN 36 and 50 THEN '36-50'
            WHEN @edad > 50 THEN '>50'
        END
	
	SET @id = (SELECT TOP 1 BI_RANGO_ETARIO.NRO_RANGO_ETARIO
				 FROM CUATRO_HISPANOS.BI_RANGO_ETARIO
				 WHERE BI_RANGO_ETARIO.RANGO_ETARIO = @rango)


    RETURN @id
END
GO



CREATE OR ALTER FUNCTION CUATRO_HISPANOS.obtener_rango_etario_ALQUILER(@nro_inquilino numeric(18,0))
RETURNS numeric(18,0)
AS
BEGIN

DECLARE @inquilinoNAC DATETIME
DECLARE @id_rango numeric(18,0)

SET @inquilinoNAC = (SELECT TOP 1 INQUILINO.INQUILINO_FECHA_NAC
				   FROM INQUILINO
				   WHERE INQUILINO.NRO_INQUILINO = @nro_inquilino
				)
SET @id_rango = (SELECT CASE WHEN YEAR(GETDATE()) - YEAR(@inquilinoNAC) < 25
						THEN (SELECT BI_RANGO_ETARIO.NRO_RANGO_ETARIO
							  FROM CUATRO_HISPANOS.BI_RANGO_ETARIO
							  WHERE BI_RANGO_ETARIO.RANGO_ETARIO = '<25') 
						WHEN YEAR(GETDATE()) - YEAR(@inquilinoNAC) BETWEEN 25 and 35
						THEN (SELECT BI_RANGO_ETARIO.NRO_RANGO_ETARIO
							  FROM CUATRO_HISPANOS.BI_RANGO_ETARIO
							  WHERE BI_RANGO_ETARIO.RANGO_ETARIO = '25-35')  
						WHEN  YEAR(GETDATE()) - YEAR(@inquilinoNAC) BETWEEN 36 and 50
						THEN (SELECT BI_RANGO_ETARIO.NRO_RANGO_ETARIO
							  FROM CUATRO_HISPANOS.BI_RANGO_ETARIO
							  WHERE BI_RANGO_ETARIO.RANGO_ETARIO = '35-50')
						WHEN  YEAR(GETDATE()) - YEAR(@inquilinoNAC) >50
						THEN (SELECT BI_RANGO_ETARIO.NRO_RANGO_ETARIO
							  FROM CUATRO_HISPANOS.BI_RANGO_ETARIO
							  WHERE BI_RANGO_ETARIO.RANGO_ETARIO = '>50')	
						END  )
RETURN @id_rango
END
GO

CREATE OR ALTER FUNCTION CUATRO_HISPANOS.obtener_BI_SUCURSAL(@nombreSuc NVARCHAR(100))
RETURNS numeric(18,0)
AS
BEGIN

DECLARE @id numeric(18,0)

SET @id = (SELECT TOP 1 BI_SUCURSAL.NRO_SUCURSAL
		   FROM CUATRO_HISPANOS.BI_SUCURSAL
		   WHERE BI_SUCURSAL.SUCURSAL_NOMBRE = @nombreSuc)

RETURN @id
END
GO

CREATE OR ALTER FUNCTION CUATRO_HISPANOS.obtener_BI_TIPO_OPERACION(@nombre NVARCHAR(100))
RETURNS numeric(18,0)
AS
BEGIN

DECLARE @id numeric(18,0)

SET @id = (SELECT TOP 1 BI_TIPO_OPERACION.NRO_OPERACION
		   FROM CUATRO_HISPANOS.BI_TIPO_OPERACION
		   WHERE BI_TIPO_OPERACION.TIPO_OPERACION = @nombre)

RETURN @id
END
GO

CREATE FUNCTION CUATRO_HISPANOS.obtener_BI_AMBIENTE(@extra NVARCHAR(100), @cant numeric(18,0))
RETURNS numeric(18,0)
AS
BEGIN

DECLARE @id numeric(18,0)

SET @id = (SELECT TOP 1 BI_AMBIENTE.NRO_AMBIENTE
		   FROM CUATRO_HISPANOS.BI_AMBIENTE
		   WHERE BI_AMBIENTE.CANTIDAD = @cant
		   AND BI_AMBIENTE.EXTRA = @extra)

RETURN @id
END
GO


CREATE FUNCTION CUATRO_HISPANOS.obtener_BI_TIPO_INMUEBLE(@nombre NVARCHAR(100))
RETURNS numeric(18,0)
AS
BEGIN

DECLARE @id numeric(18,0)

SET @id = (SELECT TOP 1 BI_TIPO_INMUEBLE.NRO_TIPO
		   FROM CUATRO_HISPANOS.BI_TIPO_INMUEBLE
		   WHERE BI_TIPO_INMUEBLE.TIPO_INMUEBLE = @nombre)

RETURN @id
END
GO

CREATE FUNCTION CUATRO_HISPANOS.obtener_BI_ESTADO_ANUNCIO(@nombre NVARCHAR(100))
RETURNS numeric(18,0)
AS
BEGIN

DECLARE @id numeric(18,0)

SET @id = (SELECT TOP 1 BI_ESTADO_ANUNCIO.NRO_ESTADO_ANUNCIO
		   FROM CUATRO_HISPANOS.BI_ESTADO_ANUNCIO
		   WHERE BI_ESTADO_ANUNCIO.ESTADO_ANUNCIO = @nombre)

RETURN @id
END
GO


CREATE FUNCTION CUATRO_HISPANOS.obtener_BI_MONEDA(@nombre NVARCHAR(100))
RETURNS numeric(18,0)
AS
BEGIN

DECLARE @id numeric(18,0)

SET @id = (SELECT TOP 1 BI_MONEDA.TIPO_MONEDA
			FROM CUATRO_HISPANOS.BI_MONEDA
			WHERE BI_MONEDA.MONEDA = @nombre)

RETURN @id
END
GO


--- PROCEDURES

CREATE PROCEDURE CUATRO_HISPANOS.migrar_BI_SUCURSAL as
BEGIN

INSERT INTO CUATRO_HISPANOS.BI_SUCURSAL(SUCURSAL_NOMBRE)
SELECT P.SUCURSAL_NOMBRE
FROM CUATRO_HISPANOS.SUCURSAL as P;

END
GO


CREATE PROCEDURE CUATRO_HISPANOS.migrar_BI_TIPO_OPERACION as
BEGIN

INSERT INTO CUATRO_HISPANOS.BI_TIPO_OPERACION(TIPO_OPERACION)
SELECT T.TIPO_OPERACION
FROM CUATRO_HISPANOS.TIPO_OPERACION as T;

END
GO

CREATE PROCEDURE CUATRO_HISPANOS.migrar_BI_TIPO_INMUEBLE as
BEGIN

INSERT INTO CUATRO_HISPANOS.BI_TIPO_INMUEBLE(TIPO_INMUEBLE)
SELECT  T.TIPO_INMUEBLE
FROM CUATRO_HISPANOS.TIPO_INMUEBLE as T;

END
GO

CREATE PROCEDURE CUATRO_HISPANOS.migrar_BI_MONEDA as
BEGIN

INSERT INTO CUATRO_HISPANOS.BI_MONEDA(MONEDA)
SELECT M.MONEDA
FROM CUATRO_HISPANOS.MONEDA as M;

END
GO


CREATE PROCEDURE CUATRO_HISPANOS.migrar_BI_AMBIENTE as
BEGIN

INSERT INTO CUATRO_HISPANOS.BI_AMBIENTE(CANTIDAD, EXTRA)
SELECT  M.CANTIDAD, M.EXTRA
FROM CUATRO_HISPANOS.AMBIENTE as M;

END
GO


CREATE PROCEDURE CUATRO_HISPANOS.migrar_BI_UBICACION as
BEGIN

INSERT INTO CUATRO_HISPANOS.BI_UBICACION(LOCALIDAD, PROVINCIA, BARRIO)
SELECT LOCALIDAD.LOCALIDAD, PROVINCIA.PROVINCIA, BARRIO.BARRIO
FROM CUATRO_HISPANOS.UBICACION
JOIN CUATRO_HISPANOS.BARRIO
ON BARRIO.NRO_BARRIO = UBICACION.NRO_BARRIO
JOIN CUATRO_HISPANOS.LOCALIDAD
ON LOCALIDAD.NRO_LOCALIDAD = UBICACION.NRO_LOCALIDAD
JOIN CUATRO_HISPANOS.PROVINCIA
ON PROVINCIA.NRO_PROVINCIA = UBICACION.NRO_PROVINCIA
END
GO



CREATE PROCEDURE CUATRO_HISPANOS.migrar_BI_ESTADO_ANUNCIO as
BEGIN

INSERT INTO CUATRO_HISPANOS.BI_ESTADO_ANUNCIO(ESTADO_ANUNCIO)
SELECT M.ESTADO_ANUNCIO
FROM CUATRO_HISPANOS.ESTADO_ANUNCIO as M;

END
GO

CREATE PROCEDURE CUATRO_HISPANOS.llenar_rango_m2
AS
BEGIN
	INSERT INTO CUATRO_HISPANOS.BI_RANGO_M2 (RANGO_M2) 
	VALUES('<35'), ('35-55'), ('55-75'), ('75-100'), ('>100')

END
GO

CREATE PROCEDURE CUATRO_HISPANOS.llenar_rango_etario
AS
BEGIN
	INSERT INTO CUATRO_HISPANOS.BI_RANGO_ETARIO(RANGO_ETARIO) 
	VALUES('<25'), ('25-35'), ('35-50'), ('>50')

END
GO

CREATE OR ALTER PROCEDURE CUATRO_HISPANOS.llenar_tiempo
AS
BEGIN

	CREATE TABLE #TEMP1 (
    fecha DATETIME
	);


	INSERT INTO #TEMP1
	SELECT DISTINCT ANUNCIO.FECHA_PUBLICACION_ANUNCIO
	FROM CUATRO_HISPANOS.ANUNCIO 
	WHERE ANUNCIO.FECHA_PUBLICACION_ANUNCIO NOT IN (SELECT fecha
													FROM #TEMP1)

	INSERT INTO #TEMP1
	SELECT DISTINCT ANUNCIO.FECHA_FINALIZACION_ANUNCIO
	FROM CUATRO_HISPANOS.ANUNCIO 
	WHERE ANUNCIO.FECHA_FINALIZACION_ANUNCIO NOT IN (SELECT fecha
													FROM #TEMP1)

	INSERT INTO #TEMP1
	SELECT DISTINCT PAGO_ALQUILER.FECHA_INICIO_PAGO_ALQUILER
	FROM CUATRO_HISPANOS.PAGO_ALQUILER 
	WHERE PAGO_ALQUILER.FECHA_INICIO_PAGO_ALQUILER NOT IN (SELECT fecha
														  FROM #TEMP1)

	INSERT INTO #TEMP1
	SELECT DISTINCT PAGO_ALQUILER.FECHA_VENC_ALQUILER
	FROM CUATRO_HISPANOS.PAGO_ALQUILER 
	WHERE PAGO_ALQUILER.FECHA_VENC_ALQUILER NOT IN (SELECT fecha
														  FROM #TEMP1)

	INSERT INTO #TEMP1
	SELECT DISTINCT PAGO_ALQUILER.FECHA_FIN_PAGO_ALQUILER
	FROM CUATRO_HISPANOS.PAGO_ALQUILER 
	WHERE PAGO_ALQUILER.FECHA_FIN_PAGO_ALQUILER NOT IN (SELECT fecha
														  FROM #TEMP1)

	INSERT INTO #TEMP1
	SELECT DISTINCT ALQUILER.FECHA_FIN
	FROM CUATRO_HISPANOS.ALQUILER 
	WHERE ALQUILER.FECHA_FIN NOT IN (SELECT fecha
									FROM #TEMP1)
 

	INSERT INTO #TEMP1
	SELECT DISTINCT ALQUILER.FECHA_INICIO
	FROM CUATRO_HISPANOS.ALQUILER 
	WHERE ALQUILER.FECHA_INICIO NOT IN (SELECT fecha
									FROM #TEMP1)

	INSERT INTO #TEMP1
	SELECT DISTINCT VENTA.FECHA_VENTA
	FROM CUATRO_HISPANOS.VENTA 
	WHERE VENTA.FECHA_VENTA NOT IN (SELECT fecha
									FROM #TEMP1)
	 

INSERT INTO CUATRO_HISPANOS.BI_TIEMPO(ANIO,MES,CUATRIMESTRE)
SELECT DISTINCT 
    DATEPART(YEAR, T.fecha),
    DATEPART(MONTH, T.fecha),
	CAST((DATEPART(MONTH, T.fecha) - 1) / 4 AS INT) + 1
	FROM #TEMP1 AS T
	GROUP BY DATEPART(YEAR, T.fecha),
    DATEPART(MONTH, T.fecha),
	CAST((DATEPART(MONTH, T.fecha) - 1) / 4 AS INT) + 1
	ORDER BY 1
DROP TABLE #TEMP1

END
GO

 
CREATE PROCEDURE CUATRO_HISPANOS.migrar_hecho_anuncio  ---- x
AS
BEGIN
	
	INSERT INTO CUATRO_HISPANOS.BI_HECHO_ANUNCIO (
												ANUNCIO_NRO_UBICACION, 
												ANUNCIO_NRO_TIPO_INMUEBLE, 
												ANUNCIO_RANGO_M2, 
												ANUNCIO_TIPO_MONEDA, 
												ANUNCIO_TIEMPO, 
												ANUNCIO_RANGO_ETARIO, 
												ANUNCIO_NRO_ESTADO, 
												ANUNCIO_SUCURSAL, 
												ANUNCIO_CANTIDAD, 
												ANUNCIO_TOTAL, 
												ANUNCIO_DIAS,
												ANUNCIO_TIPO_OPERACION,
												ANUNCIO_AMBIENTE
												)

	SELECT  CUATRO_HISPANOS.obtener_BI_UBICACION(PROVINCIA.PROVINCIA, LOCALIDAD.LOCALIDAD, BARRIO.BARRIO),
			CUATRO_HISPANOS.obtener_BI_TIPO_INMUEBLE(TIPO_INMUEBLE.TIPO_INMUEBLE),
			CUATRO_HISPANOS.obtener_rango_M2_ANUNCIO_EFI(INMUEBLE.NRO_INMUEBLE),
			CUATRO_HISPANOS.OBTENER_BI_MONEDA(MONEDA.MONEDA),
			CUATRO_HISPANOS.obtener_tiempo(ANUNCIO.FECHA_PUBLICACION_ANUNCIO),
			CUATRO_HISPANOS.obtener_rango_etario_AGENTE(AGENTE.FECHA_NAC_AGENTE), 
			CUATRO_HISPANOS.obtener_BI_ESTADO_ANUNCIO(ESTADO_ANUNCIO.ESTADO_ANUNCIO), 
			CUATRO_HISPANOS.obtener_BI_SUCURSAL(SUCURSAL.SUCURSAL_NOMBRE),
			COUNT(DISTINCT ANUNCIO.NRO_ANUNCIO),
			SUM(ANUNCIO.PRECIO_ANUNCIO),
			SUM(DATEDIFF(DAY,ANUNCIO.FECHA_PUBLICACION_ANUNCIO,ANUNCIO.FECHA_FINALIZACION_ANUNCIO)),
			CUATRO_HISPANOS.obtener_BI_TIPO_OPERACION(TIPO_OPERACION.TIPO_OPERACION),
			CUATRO_HISPANOS.obtener_BI_AMBIENTE(AMBIENTE.EXTRA, AMBIENTE.CANTIDAD)
	FROM CUATRO_HISPANOS.ANUNCIO 
	JOIN CUATRO_HISPANOS.INMUEBLE
	ON ANUNCIO.NRO_INMUEBLE = INMUEBLE.NRO_INMUEBLE
	JOIN CUATRO_HISPANOS.UBICACION
	ON INMUEBLE.NRO_UBICACION = UBICACION.NRO_UBICACION
	JOIN CUATRO_HISPANOS.PROVINCIA
	ON UBICACION.NRO_PROVINCIA = PROVINCIA.NRO_PROVINCIA
	JOIN CUATRO_HISPANOS.BARRIO
	ON UBICACION.NRO_BARRIO = BARRIO.NRO_BARRIO
	JOIN CUATRO_HISPANOS.LOCALIDAD
	ON UBICACION.NRO_LOCALIDAD = LOCALIDAD.NRO_LOCALIDAD
	JOIN CUATRO_HISPANOS.TIPO_INMUEBLE
	ON TIPO_INMUEBLE.NRO_TIPO = INMUEBLE.NRO_TIPO
	JOIN CUATRO_HISPANOS.MONEDA
	ON ANUNCIO.TIPO_MONEDA = MONEDA.TIPO_MONEDA
	JOIN CUATRO_HISPANOS.ESTADO_ANUNCIO 
	ON ANUNCIO.NRO_ESTADO_ANUNCIO = ESTADO_ANUNCIO.NRO_ESTADO_ANUNCIO
	JOIN CUATRO_HISPANOS.AGENTE
	ON AGENTE.NRO_AGENTE = ANUNCIO.NRO_AGENTE
	JOIN CUATRO_HISPANOS.SUCURSAL
	ON SUCURSAL.NRO_SUCURSAL = AGENTE.NRO_SUCURSAL
	JOIN CUATRO_HISPANOS.TIPO_OPERACION
	ON ANUNCIO.NRO_OPERACION = TIPO_OPERACION.NRO_OPERACION
	JOIN CUATRO_HISPANOS.AMBIENTE
	ON INMUEBLE.NRO_AMBIENTE = AMBIENTE.NRO_AMBIENTE
	GROUP BY 
			CUATRO_HISPANOS.obtener_tiempo(ANUNCIO.FECHA_PUBLICACION_ANUNCIO),
			PROVINCIA.PROVINCIA,
			LOCALIDAD.LOCALIDAD,
			BARRIO.BARRIO,
			SUCURSAL.SUCURSAL_NOMBRE,
			TIPO_INMUEBLE.TIPO_INMUEBLE,
			CUATRO_HISPANOS.obtener_rango_M2_ANUNCIO_EFI(INMUEBLE.NRO_INMUEBLE),
			MONEDA.MONEDA,
			CUATRO_HISPANOS.obtener_rango_etario_AGENTE(AGENTE.FECHA_NAC_AGENTE),  
			CUATRO_HISPANOS.obtener_BI_ESTADO_ANUNCIO(ESTADO_ANUNCIO.ESTADO_ANUNCIO),
			TIPO_OPERACION.TIPO_OPERACION,
			AMBIENTE.EXTRA,
			AMBIENTE.CANTIDAD
END
GO


CREATE PROCEDURE CUATRO_HISPANOS.migrar_hecho_alquiler
AS
BEGIN

	INSERT INTO CUATRO_HISPANOS.BI_HECHO_ALQUILER(ALQUILER_TIPO_INMUEBLE,												   
												   ALQUILER_TIEMPO,
												   ALQUILER_RANGO_ETARIO_INQ,
												   ALQUILER_RANGO_ETARIO_AGE,
												   ALQUILER_NRO_UBICACION,
												   ALQUILER_RANGO_M2, 
												   ALQUILER_SUCURSAL, 									
												   ALQUILER_ALTAS, 
												   ALQUILER_PAGOS, 
												   ALQUILER_PAGOS_VENCIDOS, 
												   ALQUILER_COMISION, 
												   ALQUILER_TOTAL_PAGOS) 
	

	SELECT CUATRO_HISPANOS.obtener_BI_TIPO_INMUEBLE(TIPO_INMUEBLE.TIPO_INMUEBLE),
		   CUATRO_HISPANOS.obtener_tiempo(ALQUILER.FECHA_INICIO),
		   CUATRO_HISPANOS.obtener_rango_etario_ALQUILER(ALQUILER.NRO_INQUILINO),
		   CUATRO_HISPANOS.obtener_rango_etario_AGENTE(AGENTE.FECHA_NAC_AGENTE),
		   CUATRO_HISPANOS.obtener_BI_UBICACION(PROVINCIA.PROVINCIA, LOCALIDAD.LOCALIDAD, BARRIO.BARRIO),
		   CUATRO_HISPANOS.obtener_rango_M2_ANUNCIO_EFI(INMUEBLE.NRO_INMUEBLE),
		   CUATRO_HISPANOS.obtener_BI_SUCURSAL(SUCURSAL.SUCURSAL_NOMBRE), 
		   COUNT(DISTINCT ALQUILER.NRO_ANUNCIO),
		   COUNT(DISTINCT PAGO.NRO_PAGO_ALQUILER),
		   SUM(CASE WHEN PAGO.FECHA > PAGO.FECHA_FIN_PAGO_ALQUILER
			  THEN 1
			  ELSE 0
			  END),
		  SUM(ALQUILER.COMISION_ALQUILER),
		  SUM(PAGO.IMPORTE_PAGO_ALQUILER)
	FROM CUATRO_HISPANOS.ANUNCIO
	JOIN CUATRO_HISPANOS.ALQUILER 
	ON ANUNCIO.NRO_ANUNCIO = ALQUILER.NRO_ANUNCIO
	JOIN CUATRO_HISPANOS.PAGO_ALQUILER AS PAGO
	ON PAGO.NRO_ALQUILER = ALQUILER.NRO_ALQUILER
	JOIN CUATRO_HISPANOS.INMUEBLE
	ON ANUNCIO.NRO_INMUEBLE = INMUEBLE.NRO_INMUEBLE
	JOIN CUATRO_HISPANOS.AGENTE 
	ON ANUNCIO.NRO_AGENTE = AGENTE.NRO_AGENTE
	JOIN CUATRO_HISPANOS.SUCURSAL
	ON AGENTE.NRO_SUCURSAL = SUCURSAL.NRO_SUCURSAL
	JOIN CUATRO_HISPANOS.INQUILINO
	ON INQUILINO.NRO_INQUILINO = ALQUILER.NRO_INQUILINO
	JOIN CUATRO_HISPANOS.TIPO_INMUEBLE 
	ON TIPO_INMUEBLE.NRO_TIPO = INMUEBLE.NRO_TIPO
	JOIN CUATRO_HISPANOS.UBICACION 
	ON INMUEBLE.NRO_UBICACION = UBICACION.NRO_UBICACION
	JOIN CUATRO_HISPANOS.PROVINCIA
	ON UBICACION.NRO_PROVINCIA = PROVINCIA.NRO_PROVINCIA
	JOIN CUATRO_HISPANOS.BARRIO
	ON UBICACION.NRO_BARRIO = BARRIO.NRO_BARRIO
	JOIN CUATRO_HISPANOS.LOCALIDAD
	ON UBICACION.NRO_LOCALIDAD = LOCALIDAD.NRO_LOCALIDAD
	GROUP BY
		   CUATRO_HISPANOS.obtener_tiempo(ALQUILER.FECHA_INICIO),
		   PROVINCIA.PROVINCIA,
		   LOCALIDAD.LOCALIDAD,
		   BARRIO.BARRIO,
		   TIPO_INMUEBLE.TIPO_INMUEBLE,
		   SUCURSAL.SUCURSAL_NOMBRE,
		   CUATRO_HISPANOS.obtener_rango_etario_ALQUILER(ALQUILER.NRO_INQUILINO),
		   CUATRO_HISPANOS.obtener_rango_etario_AGENTE(AGENTE.FECHA_NAC_AGENTE),
		   CUATRO_HISPANOS.obtener_rango_M2_ANUNCIO_EFI(INMUEBLE.NRO_INMUEBLE)

END
GO


CREATE PROCEDURE CUATRO_HISPANOS.migrar_hecho_pago_alquiler  
AS
BEGIN
	

INSERT INTO CUATRO_HISPANOS.BI_HECHO_PAGO_ALQUILER(PAGO_ALQUILER_TIEMPO, 
													PAGO_ALQUILER_PORCENTAJE )

SELECT CUATRO_HISPANOS.obtener_tiempo(PAGOACTUAL.FECHA),
       CAST( (SUM((PAGOACTUAL.IMPORTE_PAGO_ALQUILER - PAGOANTERIOR.IMPORTE_PAGO_ALQUILER)
        / PAGOANTERIOR.IMPORTE_PAGO_ALQUILER ) )*100 / COUNT(*) AS NUMERIC(18,0))
FROM CUATRO_HISPANOS.ALQUILER
JOIN CUATRO_HISPANOS.PAGO_ALQUILER AS PAGOACTUAL
ON ALQUILER.NRO_ALQUILER = PAGOACTUAL.NRO_ALQUILER
JOIN CUATRO_HISPANOS.PAGO_ALQUILER AS PAGOANTERIOR
ON ALQUILER.NRO_ALQUILER = PAGOANTERIOR.NRO_ALQUILER
WHERE PAGOACTUAL.IMPORTE_PAGO_ALQUILER >  PAGOANTERIOR.IMPORTE_PAGO_ALQUILER
AND (
    (YEAR(PAGOANTERIOR.FECHA) = YEAR(PAGOACTUAL.FECHA) AND (MONTH(PAGOACTUAL.FECHA) -1) = MONTH(PAGOANTERIOR.FECHA))
    --Resta el año y mes en caso de que sea enero/diciembre
	OR (
        MONTH(PAGOACTUAL.FECHA) = 1  
        AND MONTH(PAGOANTERIOR.FECHA) = 12  
        AND YEAR(PAGOANTERIOR.FECHA) = YEAR(PAGOACTUAL.FECHA) - 1  
    )
)
GROUP BY CUATRO_HISPANOS.obtener_tiempo(PAGOACTUAL.FECHA)

END
GO


CREATE PROCEDURE CUATRO_HISPANOS.migrar_hecho_venta
AS
BEGIN
	
	INSERT INTO CUATRO_HISPANOS.BI_HECHO_VENTA(
												VENTA_NRO_TIPO_INMUEBLE,
												VENTA_UBICACION, 
												VENTA_NRO_AMBIENTE, 
												VENTA_TIEMPO, 
												VENTA_SUCURSAL, 
												VENTA_MONEDA, 
												VENTA_RANGO_M2,
												VENTA_RANGO_ETARIO_AGE,
												VENTA_COMISION,
												VENTA_SUPERFICIES_TOTALES, -- SUMA DE SUPERFICIES
												VENTA_IMPORTES_DE_PAGOS,
												VENTA_PAGADO_TOTAL,
												VENTA_ALTAS,
												VENTA_CANT_PAGOS
												)

	SELECT CUATRO_HISPANOS.obtener_BI_TIPO_INMUEBLE(TIPO_INMUEBLE.TIPO_INMUEBLE),
		   CUATRO_HISPANOS.obtener_BI_UBICACION(PROVINCIA.PROVINCIA, LOCALIDAD.LOCALIDAD, BARRIO.BARRIO),
		   CUATRO_HISPANOS.obtener_BI_AMBIENTE(AMBIENTE.EXTRA, AMBIENTE.CANTIDAD),
		   CUATRO_HISPANOS.obtener_tiempo(VENTA.FECHA_VENTA),
		   CUATRO_HISPANOS.obtener_BI_SUCURSAL(SUCURSAL.SUCURSAL_NOMBRE),
		   CUATRO_HISPANOS.obtener_BI_MONEDA(MONEDA.MONEDA),
		   CUATRO_HISPANOS.obtener_rango_M2_ANUNCIO_EFI(INMUEBLE.NRO_INMUEBLE),
		   CUATRO_HISPANOS.obtener_rango_etario_AGENTE(AGENTE.FECHA_NAC_AGENTE),
		   SUM(VENTA.COMISION_VENTA),
		   SUM(INMUEBLE.SUPERFICIE_INMUEBLE),
		   SUM(PAGO_VENTA.IMPORTE_PAGO_VENTA),
		   SUM(VENTA.PRECIO_VENTA),
		   COUNT(DISTINCT VENTA.NRO_VENTA),
		   COUNT(DISTINCT PAGO_VENTA.NRO_PAGO_VENTA)
    FROM CUATRO_HISPANOS.VENTA
	JOIN CUATRO_HISPANOS.ANUNCIO
	ON VENTA.NRO_ANUNCIO = ANUNCIO.NRO_ANUNCIO
	JOIN CUATRO_HISPANOS.COMPRADOR
	ON COMPRADOR.NRO_COMPRADOR = VENTA.NRO_COMPRADOR
	JOIN CUATRO_HISPANOS.AGENTE
	ON ANUNCIO.NRO_AGENTE = AGENTE.NRO_AGENTE
	JOIN CUATRO_HISPANOS.PAGO_VENTA
	ON PAGO_VENTA.NRO_VENTA = VENTA.NRO_VENTA
	JOIN CUATRO_HISPANOS.INMUEBLE
	ON INMUEBLE.NRO_INMUEBLE = ANUNCIO.NRO_INMUEBLE
	JOIN CUATRO_HISPANOS.UBICACION
	ON INMUEBLE.NRO_UBICACION = UBICACION.NRO_UBICACION
	JOIN CUATRO_HISPANOS.PROVINCIA
	ON UBICACION.NRO_PROVINCIA = PROVINCIA.NRO_PROVINCIA
	JOIN CUATRO_HISPANOS.BARRIO
	ON UBICACION.NRO_BARRIO = BARRIO.NRO_BARRIO
	JOIN CUATRO_HISPANOS.LOCALIDAD
	ON UBICACION.NRO_LOCALIDAD = LOCALIDAD.NRO_LOCALIDAD
	JOIN CUATRO_HISPANOS.TIPO_INMUEBLE
	ON TIPO_INMUEBLE.NRO_TIPO = INMUEBLE.NRO_TIPO
	JOIN CUATRO_HISPANOS.AMBIENTE
	ON INMUEBLE.NRO_AMBIENTE = AMBIENTE.NRO_AMBIENTE
	JOIN CUATRO_HISPANOS.SUCURSAL
	ON AGENTE.NRO_SUCURSAL = SUCURSAL.NRO_SUCURSAL
	JOIN CUATRO_HISPANOS.MONEDA
	ON MONEDA.TIPO_MONEDA = VENTA.MONEDA
	GROUP BY TIPO_INMUEBLE.TIPO_INMUEBLE,
			 PROVINCIA.PROVINCIA,
			 LOCALIDAD.LOCALIDAD, 
			 BARRIO.BARRIO,
			 SUCURSAL.SUCURSAL_NOMBRE,
			 AMBIENTE.EXTRA,
			 AMBIENTE.CANTIDAD,
		   CUATRO_HISPANOS.obtener_tiempo(VENTA.FECHA_VENTA),
		   CUATRO_HISPANOS.obtener_BI_MONEDA(MONEDA.MONEDA),
		   CUATRO_HISPANOS.obtener_rango_M2_ANUNCIO_EFI(INMUEBLE.NRO_INMUEBLE),
		   CUATRO_HISPANOS.obtener_rango_etario_AGENTE(AGENTE.FECHA_NAC_AGENTE)

END
GO


--- EXEC


EXEC CUATRO_HISPANOS.migrar_BI_SUCURSAL
EXEC CUATRO_HISPANOS.migrar_BI_TIPO_OPERACION
EXEC CUATRO_HISPANOS.migrar_BI_TIPO_INMUEBLE
EXEC CUATRO_HISPANOS.migrar_BI_MONEDA
EXEC CUATRO_HISPANOS.migrar_BI_AMBIENTE
EXEC CUATRO_HISPANOS.migrar_BI_UBICACION
EXEC CUATRO_HISPANOS.migrar_BI_ESTADO_ANUNCIO

EXEC CUATRO_HISPANOS.llenar_rango_m2
EXEC CUATRO_HISPANOS.llenar_rango_etario
EXEC CUATRO_HISPANOS.llenar_tiempo

EXEC CUATRO_HISPANOS.migrar_hecho_anuncio
EXEC CUATRO_HISPANOS.migrar_hecho_alquiler
EXEC CUATRO_HISPANOS.migrar_hecho_pago_alquiler
GO
EXEC CUATRO_HISPANOS.migrar_hecho_venta
GO

/*
SELECT * FROM CUATRO_HISPANOS.bi_tipo_operacion
DELETE FROM CUATRO_HISPANOS.BI_SUCURSAL
DELETE FROM CUATRO_HISPANOS.BI_TIPO_OPERACION
DELETE FROM CUATRO_HISPANOS.BI_TIPO_INMUEBLE
DELETE FROM CUATRO_HISPANOS.BI_MONEDA
DELETE FROM CUATRO_HISPANOS.BI_AMBIENTE
DELETE FROM CUATRO_HISPANOS.BI_UBICACION

DELETE FROM CUATRO_HISPANOS.BI_ESTADO_ANUNCIO
DELETE FROM CUATRO_HISPANOS.BI_RANGO_M2
DELETE FROM CUATRO_HISPANOS.BI_RANGO_ETARIO
DELETE FROM CUATRO_HISPANOS.BI_TIEMPO
DELETE FROM CUATRO_HISPANOS.BI_HECHO_ANUNCIO
DELETE FROM CUATRO_HISPANOS.BI_HECHO_ALQUILER
DELETE FROM CUATRO_HISPANOS.BI_HECHO_PAGO_ALQUILER
DELETE FROM CUATRO_HISPANOS.BI_HECHO_VENTA
*/




-- VISTA 1 

/*
1. Duraci�n promedio (en d�as) que se encuentran publicados los anuncios
seg�n el tipo de operaci�n (alquiler, venta, etc), barrio y ambientes para cada
cuatrimestre de cada a�o. Se consideran todos los anuncios que se dieron de alta
en ese cuatrimestre. La duraci�n se calcula teniendo en cuenta la fecha de alta y
la fecha de finalizaci�n.
*/

CREATE VIEW CUATRO_HISPANOS.vista1
AS

SELECT CAST((SUM(BI_HECHO_ANUNCIO.ANUNCIO_DIAS) / SUM(BI_HECHO_ANUNCIO.ANUNCIO_CANTIDAD)) AS NUMERIC(18,2)) as promedio,
	   BI_HECHO_ANUNCIO.ANUNCIO_TIPO_OPERACION as tipoOperacion,
	   BI_UBICACION.BARRIO as barrio,
	   BI_AMBIENTE.NRO_AMBIENTE as nroAmbiente,
	   BI_TIEMPO.ANIO as anio,
	   BI_TIEMPO.CUATRIMESTRE as cuatrimestre
FROM CUATRO_HISPANOS.BI_HECHO_ANUNCIO
JOIN CUATRO_HISPANOS.BI_TIEMPO
ON BI_TIEMPO.CODIGO_TIEMPO = BI_HECHO_ANUNCIO.ANUNCIO_TIEMPO
JOIN CUATRO_HISPANOS.BI_UBICACION
ON BI_UBICACION.NRO_UBICACION = BI_HECHO_ANUNCIO.ANUNCIO_NRO_UBICACION
JOIN CUATRO_HISPANOS.BI_AMBIENTE 
ON BI_HECHO_ANUNCIO.ANUNCIO_AMBIENTE = BI_AMBIENTE.NRO_AMBIENTE
GROUP BY 
	   BI_HECHO_ANUNCIO.ANUNCIO_TIPO_OPERACION,
	   BI_UBICACION.BARRIO,
	   BI_AMBIENTE.NRO_AMBIENTE,
	   BI_TIEMPO.ANIO,
	   BI_TIEMPO.CUATRIMESTRE
GO
---

-- VISTA 2
/*

2. Precio promedio de los anuncios de inmuebles seg�n el tipo de operaci�n
(alquiler, venta, etc), tipo de inmueble y rango m2 para cada cuatrimestre/a�o.
Se consideran todos los anuncios que se dieron de alta en ese cuatrimestre. El
precio se debe expresar en el tipo de moneda que corresponda, identificando de
cu�l se trata.

*/

CREATE VIEW CUATRO_HISPANOS.vista2
AS

SELECT CAST((SUM(BI_HECHO_ANUNCIO.ANUNCIO_TOTAL) / SUM(BI_HECHO_ANUNCIO.ANUNCIO_CANTIDAD)) AS NUMERIC(18,2)) as promedio,	
	   BI_HECHO_ANUNCIO.ANUNCIO_TIPO_OPERACION as tipoOperacion, 
	   BI_HECHO_ANUNCIO.ANUNCIO_RANGO_M2 as rangoM2, 
	   BI_HECHO_ANUNCIO.ANUNCIO_NRO_TIPO_INMUEBLE as tipoInmueble,
	   BI_HECHO_ANUNCIO.ANUNCIO_AMBIENTE as ambiente,
	   BI_TIEMPO.ANIO as anio,
	   BI_TIEMPO.CUATRIMESTRE as cuatrimestre,
	   CUATRO_HISPANOS.identificarMoneda(BI_HECHO_ANUNCIO.ANUNCIO_TIPO_MONEDA) as moneda
FROM CUATRO_HISPANOS.BI_HECHO_ANUNCIO
JOIN CUATRO_HISPANOS.BI_TIEMPO
ON BI_TIEMPO.CODIGO_TIEMPO = BI_HECHO_ANUNCIO.ANUNCIO_TIEMPO
GROUP BY 
	   BI_HECHO_ANUNCIO.ANUNCIO_TIPO_OPERACION, 
	   BI_HECHO_ANUNCIO.ANUNCIO_RANGO_M2, 
	   BI_HECHO_ANUNCIO.ANUNCIO_NRO_TIPO_INMUEBLE,
	   BI_HECHO_ANUNCIO.ANUNCIO_AMBIENTE,
	   BI_TIEMPO.ANIO,
	   BI_TIEMPO.CUATRIMESTRE,
	   CUATRO_HISPANOS.identificarMoneda(BI_HECHO_ANUNCIO.ANUNCIO_TIPO_MONEDA)
GO
---

-- VISTA 3
/*

3. Los 5 barrios m�s elegidos para alquilar en funci�n del rango etario de los
inquilinos para cada cuatrimestre/a�o. Se calcula en funci�n de los alquileres
dados de alta en dicho periodo.

*/
CREATE VIEW CUATRO_HISPANOS.vista3 AS
WITH BarriosRanking AS (
    SELECT
        T.ANIO,
        T.CUATRIMESTRE,
        R.RANGO_ETARIO AS rangoEtario,
        U.BARRIO,
        COUNT(*) AS alquileresDadosAlta,
        ROW_NUMBER() OVER (PARTITION BY T.ANIO, T.CUATRIMESTRE, R.NRO_RANGO_ETARIO ORDER BY COUNT(*) DESC) AS Ranking
    FROM
        CUATRO_HISPANOS.BI_HECHO_ALQUILER AS HECHO
        INNER JOIN CUATRO_HISPANOS.BI_UBICACION AS U ON HECHO.ALQUILER_NRO_UBICACION = U.NRO_UBICACION
        INNER JOIN CUATRO_HISPANOS.BI_TIEMPO AS T  ON HECHO.ALQUILER_TIEMPO = T.CODIGO_TIEMPO
        INNER JOIN CUATRO_HISPANOS.BI_RANGO_ETARIO AS R ON HECHO.ALQUILER_RANGO_ETARIO_INQ = R.NRO_RANGO_ETARIO
    GROUP BY
        T.ANIO, T.CUATRIMESTRE, R.NRO_RANGO_ETARIO, R.RANGO_ETARIO, U.BARRIO
)
SELECT
    ANIO,
    CUATRIMESTRE,
    rangoEtario,
    BARRIO,
    alquileresDadosAlta
FROM
    BarriosRanking
WHERE
    Ranking <= 5;
GO



-- VISTA 4
/*

4. Porcentaje de incumplimiento de pagos de alquileres en t�rmino por cada
mes/a�o. Se calcula en funci�n de las fechas de pago y fecha de vencimiento del
mismo. El porcentaje es en funci�n del total de pagos en dicho periodo.

*/

CREATE VIEW CUATRO_HISPANOS.vista4
AS

SELECT DISTINCT
    TIEMPO0.ANIO as anio,
    TIEMPO0.MES as mes,
    
        CAST((BI_HECHO_ALQUILER.ALQUILER_PAGOS_VENCIDOS / BI_HECHO_ALQUILER.ALQUILER_PAGOS) * 100 AS NUMERIC(18,2)) AS porcentajeIncumplimiento
   
FROM CUATRO_HISPANOS.BI_HECHO_ALQUILER
JOIN CUATRO_HISPANOS.BI_TIEMPO AS TIEMPO0
ON BI_HECHO_ALQUILER.ALQUILER_TIEMPO = TIEMPO0.CODIGO_TIEMPO
GROUP BY TIEMPO0.ANIO, TIEMPO0.MES, (BI_HECHO_ALQUILER.ALQUILER_PAGOS_VENCIDOS / BI_HECHO_ALQUILER.ALQUILER_PAGOS) * 100

GO
---

-- VISTA 5
/*
5. Porcentaje promedio de incremento del valor de los alquileres para los
contratos en curso por mes/a�o. Se calcula tomando en cuenta el �ltimo pago
con respecto al del mes en curso, �nicamente de aquellos alquileres que hayan
tenido aumento y est�n activos.
*/

CREATE VIEW CUATRO_HISPANOS.vista5
AS
SELECT
	TIEMPO0.ANIO,
	TIEMPO0.MES,
	BI_HECHO_PAGO_ALQUILER.PAGO_ALQUILER_PORCENTAJE AS porcentajeIncremento

    FROM CUATRO_HISPANOS.BI_HECHO_PAGO_ALQUILER
	JOIN CUATRO_HISPANOS.BI_TIEMPO AS TIEMPO0
	ON BI_HECHO_PAGO_ALQUILER.PAGO_ALQUILER_TIEMPO = TIEMPO0.CODIGO_TIEMPO

	GROUP BY
	TIEMPO0.ANIO,
	TIEMPO0.MES,
	BI_HECHO_PAGO_ALQUILER.PAGO_ALQUILER_PORCENTAJE
GO

-- VISTA 6
/*
6. Precio promedio de m2 de la venta de inmuebles seg�n el tipo de inmueble y
la localidad para cada cuatrimestre/a�o. Se calcula en funci�n de las ventas
concretadas.
*/

CREATE VIEW CUATRO_HISPANOS.vista6
AS
SELECT CAST((SUM(BI_HECHO_VENTA.VENTA_PAGADO_TOTAL) / SUM(BI_HECHO_VENTA.VENTA_SUPERFICIES_TOTALES)) AS NUMERIC(18,2)) AS precioPromedio,
      BI_HECHO_VENTA.VENTA_NRO_TIPO_INMUEBLE AS tipoInmueble,
	  BI_UBICACION.LOCALIDAD as localidad,
	  BI_TIEMPO.CUATRIMESTRE as cuatrimestre,
	  BI_TIEMPO.ANIO as anio
FROM CUATRO_HISPANOS.BI_HECHO_VENTA
JOIN CUATRO_HISPANOS.BI_TIEMPO
ON BI_HECHO_VENTA.VENTA_TIEMPO = BI_TIEMPO.CODIGO_TIEMPO
JOIN CUATRO_HISPANOS.BI_UBICACION
ON BI_UBICACION.NRO_UBICACION = BI_HECHO_VENTA.VENTA_UBICACION
GROUP BY 
	  BI_HECHO_VENTA.VENTA_NRO_TIPO_INMUEBLE,
	  BI_TIEMPO.CUATRIMESTRE,
	  BI_TIEMPO.ANIO,
	  BI_UBICACION.LOCALIDAD
GO

-- VISTA 7
/*
7. Valor promedio de la comisi�n seg�n el tipo de operaci�n (alquiler, venta, etc)
y sucursal para cada cuatrimestre/a�o. Se calcula en funci�n de los alquileres y
ventas concretadas dentro del periodo.
*/

CREATE VIEW CUATRO_HISPANOS.vista7
AS
SELECT CAST((SUM(BI_HECHO_VENTA.VENTA_COMISION) / SUM(BI_HECHO_VENTA.VENTA_ALTAS)) AS NUMERIC(18,2)) as valorPromedio,
	  BI_HECHO_VENTA.VENTA_SUCURSAL as sucursal,
	  BI_TIEMPO.CUATRIMESTRE as cuatrimestre,
	  BI_TIEMPO.ANIO as anio,
	  'VENTA' as tipoDeOperacion
FROM CUATRO_HISPANOS.BI_HECHO_VENTA
JOIN CUATRO_HISPANOS.BI_TIEMPO
ON BI_HECHO_VENTA.VENTA_TIEMPO = BI_TIEMPO.CODIGO_TIEMPO
GROUP BY BI_HECHO_VENTA.VENTA_SUCURSAL,
	     BI_TIEMPO.CUATRIMESTRE,
	     BI_TIEMPO.ANIO
UNION 
SELECT CAST((SUM(BI_HECHO_ALQUILER.ALQUILER_COMISION) / SUM(BI_HECHO_ALQUILER.ALQUILER_ALTAS)) AS NUMERIC(18,2)) as valorPromedio,
	  BI_HECHO_ALQUILER.ALQUILER_SUCURSAL as sucursal,
	  BI_TIEMPO.CUATRIMESTRE as cuatrimestre,
	  BI_TIEMPO.ANIO as anio,
	  'ALQUILER' as tipoDeOperacion
FROM CUATRO_HISPANOS.BI_HECHO_ALQUILER
JOIN CUATRO_HISPANOS.BI_TIEMPO
ON BI_HECHO_ALQUILER.ALQUILER_TIEMPO = BI_TIEMPO.CODIGO_TIEMPO
GROUP BY BI_HECHO_ALQUILER.ALQUILER_SUCURSAL,
	     BI_TIEMPO.CUATRIMESTRE,
	     BI_TIEMPO.ANIO
GO
---

-- VISTA 8
/*
8. Porcentaje de operaciones concretadas (tanto de alquileres como ventas) por
cada sucursal, seg�n el rango etario de los empleados por a�o en funci�n de la
cantidad de anuncios publicados en ese mismo a�o.
*/

CREATE VIEW CUATRO_HISPANOS.vista8
AS
SELECT 100* 
        (SELECT SUM(ANUNCIO1.ANUNCIO_CANTIDAD) 
        FROM CUATRO_HISPANOS3.BI_HECHO_ANUNCIO AS ANUNCIO1
        JOIN CUATRO_HISPANOS3.BI_ESTADO_ANUNCIO AS ESTADO1
        ON ESTADO1.NRO_ESTADO_ANUNCIO = ANUNCIO1.ANUNCIO_NRO_ESTADO
        JOIN CUATRO_HISPANOS3.BI_TIEMPO TIEMPO1
        ON TIEMPO1.CODIGO_TIEMPO = ANUNCIO1.ANUNCIO_TIEMPO
        WHERE (ESTADO1.ESTADO_ANUNCIO = 'Alquilado' 
             OR ESTADO1.ESTADO_ANUNCIO = 'Vendido' )
             AND rangoEtario0.NRO_RANGO_ETARIO = ANUNCIO1.ANUNCIO_RANGO_ETARIO 
             AND TIEMPO0.ANIO = TIEMPO1.ANIO
			 AND ANUNCIO1.ANUNCIO_SUCURSAL = SUCURSAL0.NRO_SUCURSAL)
        / SUM(BI_HECHO_ANUNCIO.ANUNCIO_CANTIDAD) AS porcentajeOperacionesConcretadas,
    BI_HECHO_ANUNCIO.ANUNCIO_RANGO_ETARIO AS rangoEtario,
    TIEMPO0.ANIO AS anio,
    SUCURSAL0.SUCURSAL_NOMBRE AS sucursal

FROM CUATRO_HISPANOS3.BI_HECHO_ANUNCIO

JOIN CUATRO_HISPANOS3.BI_SUCURSAL AS SUCURSAL0
ON BI_HECHO_ANUNCIO.ANUNCIO_SUCURSAL = SUCURSAL0.NRO_SUCURSAL
JOIN CUATRO_HISPANOS3.BI_TIEMPO AS TIEMPO0
ON TIEMPO0.CODIGO_TIEMPO = BI_HECHO_ANUNCIO.ANUNCIO_TIEMPO
JOIN CUATRO_HISPANOS3.BI_RANGO_ETARIO AS rangoEtario0
ON rangoEtario0.NRO_RANGO_ETARIO = BI_HECHO_ANUNCIO.ANUNCIO_RANGO_ETARIO

GROUP BY 
    TIEMPO0.ANIO,
    rangoEtario0.NRO_RANGO_ETARIO,
    rangoEtario0.RANGO_ETARIO,
    SUCURSAL0.SUCURSAL_NOMBRE,
    SUCURSAL0.NRO_SUCURSAL,
    BI_HECHO_ANUNCIO.ANUNCIO_RANGO_ETARIO
GO





-- VISTA 9
/*

9. Monto total de cierre de contratos por tipo de operaci�n (tanto de alquileres
como ventas) por cada cuatrimestre y sucursal, diferenciando el tipo de moneda.

*/

CREATE VIEW CUATRO_HISPANOS.vista9
AS

SELECT SUM(BI_HECHO_ANUNCIO.ANUNCIO_TOTAL) as montoTotal,
	   BI_TIPO_OPERACION.TIPO_OPERACION as tipoDeOperacion,
	   BI_TIEMPO.CUATRIMESTRE as cuatrimestre,
	   BI_HECHO_ANUNCIO.ANUNCIO_SUCURSAL as sucursal,
	   CUATRO_HISPANOS.identificarMoneda(BI_HECHO_ANUNCIO.ANUNCIO_TIPO_MONEDA) as moneda
FROM CUATRO_HISPANOS.BI_HECHO_ANUNCIO
JOIN CUATRO_HISPANOS.BI_TIEMPO
ON BI_HECHO_ANUNCIO.ANUNCIO_TIEMPO = BI_TIEMPO.CODIGO_TIEMPO
JOIN CUATRO_HISPANOS.BI_TIPO_OPERACION
ON BI_TIPO_OPERACION.NRO_OPERACION = BI_HECHO_ANUNCIO.ANUNCIO_TIPO_OPERACION
JOIN CUATRO_HISPANOS.BI_ESTADO_ANUNCIO
ON BI_ESTADO_ANUNCIO.NRO_ESTADO_ANUNCIO = BI_HECHO_ANUNCIO.ANUNCIO_NRO_ESTADO

WHERE BI_ESTADO_ANUNCIO.ESTADO_ANUNCIO = 'Vendido' OR BI_ESTADO_ANUNCIO.ESTADO_ANUNCIO = 'Alquilado'

GROUP BY BI_TIEMPO.CUATRIMESTRE,
	   BI_HECHO_ANUNCIO.ANUNCIO_SUCURSAL,
	   CUATRO_HISPANOS.identificarMoneda(BI_HECHO_ANUNCIO.ANUNCIO_TIPO_MONEDA),
	   BI_TIPO_OPERACION.TIPO_OPERACION,
	   BI_TIEMPO.CUATRIMESTRE
GO
---

------

/*
DELETE FROM CUATRO_HISPANOS.BI_TIEMPO

DELETE FROM CUATRO_HISPANOS.BI_HECHO_ANUNCIO

DELETE FROM CUATRO_HISPANOS.BI_UBICACION;
DELETE FROM CUATRO_HISPANOS.BI_LOCALIDAD;
DELETE FROM CUATRO_HISPANOS.BI_PROVINCIA;
DELETE FROM CUATRO_HISPANOS.BI_BARRIO;
DELETE FROM CUATRO_HISPANOS.BI_TIPO_OPERACION;
DELETE FROM CUATRO_HISPANOS.BI_TIPO_INMUEBLE;
DELETE FROM CUATRO_HISPANOS.BI_MONEDA;
DELETE FROM CUATRO_HISPANOS.BI_AMBIENTE;

DELETE FROM CUATRO_HISPANOS.BI_RANGO_M2
*/