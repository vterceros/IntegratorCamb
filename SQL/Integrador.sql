USE [Integrador]
GO
/****** Object:  StoredProcedure [dbo].[SP_VerificarConectividad]    Script Date: 16/12/2021 15:54:15 ******/
DROP PROCEDURE [dbo].[SP_VerificarConectividad]
GO
/****** Object:  StoredProcedure [dbo].[SP_RevertirPago]    Script Date: 16/12/2021 15:54:15 ******/
DROP PROCEDURE [dbo].[SP_RevertirPago]
GO
/****** Object:  StoredProcedure [dbo].[SP_RegistrarPago]    Script Date: 16/12/2021 15:54:15 ******/ 
DROP PROCEDURE [dbo].[SP_RegistrarPago]
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerServiciosRelacionados]    Script Date: 16/12/2021 15:54:15 ******/
DROP PROCEDURE [dbo].[SP_ObtenerServiciosRelacionados]
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerPlanPagos]    Script Date: 16/12/2021 15:54:15 ******/
DROP PROCEDURE [dbo].[SP_ObtenerPlanPagos]
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerListaSubNiveles]    Script Date: 16/12/2021 15:54:15 ******/
DROP PROCEDURE [dbo].[SP_ObtenerListaSubNiveles]
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerListaNiveles]    Script Date: 16/12/2021 15:54:15 ******/
DROP PROCEDURE [dbo].[SP_ObtenerListaNiveles]
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerListaClientes]    Script Date: 16/12/2021 15:54:15 ******/
DROP PROCEDURE [dbo].[SP_ObtenerListaClientes]
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerDeuda]    Script Date: 16/12/2021 15:54:15 ******/
DROP PROCEDURE [dbo].[SP_ObtenerDeuda]
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerDetallePagos]    Script Date: 16/12/2021 15:54:15 ******/
DROP PROCEDURE [dbo].[SP_ObtenerDetallePagos]
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerDatosFactura]    Script Date: 16/12/2021 15:54:15 ******/
DROP PROCEDURE [dbo].[SP_ObtenerDatosFactura]
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerConceptosPago]    Script Date: 16/12/2021 15:54:15 ******/
DROP PROCEDURE [dbo].[SP_ObtenerConceptosPago]
GO
/****** Object:  StoredProcedure [dbo].[SP_ExtornarFactura]    Script Date: 16/12/2021 15:54:15 ******/
DROP PROCEDURE [dbo].[SP_ExtornarFactura]
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarTransaccion]    Script Date: 16/12/2021 15:54:15 ******/
DROP PROCEDURE [dbo].[SP_ConsultarTransaccion]
GO
/****** Object:  StoredProcedure [dbo].[SP_ConciliarPagos]    Script Date: 16/12/2021 15:54:15 ******/
DROP PROCEDURE [dbo].[SP_ConciliarPagos]
GO
ALTER TABLE [dbo].[Token] DROP CONSTRAINT [FK_Token_Usuario]
GO
/****** Object:  Table [dbo].[vh]    Script Date: 16/12/2021 15:54:15 ******/
DROP TABLE [dbo].[vh]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 16/12/2021 15:54:15 ******/
DROP TABLE [dbo].[Usuario]
GO
/****** Object:  Table [dbo].[Token]    Script Date: 16/12/2021 15:54:15 ******/
DROP TABLE [dbo].[Token]
GO
/****** Object:  Table [dbo].[LogPagos]    Script Date: 16/12/2021 15:54:15 ******/
DROP TABLE [dbo].[LogPagos]
GO
/****** Object:  Table [dbo].[LogEvento]    Script Date: 16/12/2021 15:54:15 ******/
DROP TABLE [dbo].[LogEvento]
GO
/****** Object:  View [dbo].[vwRandom]    Script Date: 16/12/2021 15:54:15 ******/
DROP VIEW [dbo].[vwRandom]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCustomPass]    Script Date: 16/12/2021 15:54:15 ******/
DROP FUNCTION [dbo].[fnCustomPass]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCustomPass]    Script Date: 16/12/2021 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
----
--SELECT dbo.fnCustomPass(128,'C')[KeyGenerado] -- solo letras
--SELECT dbo.fnCustomPass(128,'N')[KeyGenerado] -- solo numero
--SELECT dbo.fnCustomPass(128,'CN')[KeyGenerado]  --Alfanumerico
---

create FUNCTION [dbo].[fnCustomPass] 
(    
    @size AS INT, --Tamaño de la cadena aleatoria
    @op AS VARCHAR(2) --Opción para letras(ABC..), numeros(123...) o ambos.
)
RETURNS VARCHAR(62)
AS
BEGIN    

    DECLARE @chars AS VARCHAR(52),
            @numbers AS VARCHAR(10),
            @strChars AS VARCHAR(62),        
            @strPass AS VARCHAR(62),
            @index AS INT,
            @cont AS INT

    SET @strPass = ''
    SET @strChars = ''    
    SET @chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    SET @numbers = '0123456789'

    SET @strChars = CASE @op WHEN 'C' THEN @chars --Letras
                        WHEN 'N' THEN @numbers --Números
                        WHEN 'CN' THEN @chars + @numbers --Ambos (Letras y Números)
                        ELSE '------'
                    END

    SET @cont = 0
    WHILE @cont < @size
    BEGIN
        SET @index = ceiling( ( SELECT rnd FROM vwRandom ) * (len(@strChars)))--Uso de la vista para el Rand() y no generar error.
        SET @strPass = @strPass + substring(@strChars, @index, 1)
        SET @cont = @cont + 1
    END    
        
    RETURN @strPass

END
GO
/****** Object:  View [dbo].[vwRandom]    Script Date: 16/12/2021 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwRandom]
AS
SELECT RAND() AS Rnd
GO
/****** Object:  Table [dbo].[LogEvento]    Script Date: 16/12/2021 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogEvento](
	[LogEventoId] [bigint] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](30) NULL,
	[Parametros] [varchar](max) NULL,
	[Funcion] [varchar](100) NULL,
	[FechaReg] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogPagos]    Script Date: 16/12/2021 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogPagos](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[CodigoConvenio] [varchar](100) NULL,
	[FechaTransaccion] [date] NULL,
	[CodigoTipoBusqueda] [char](3) NULL,
	[CodigoCliente] [varchar](30) NULL,
	[FacturaNITCI] [int] NULL,
	[FacturaNombre] [varchar](60) NULL,
	[NroTransaccion] [int] NULL,
	[Usuario] [varchar](30) NULL,
	[Sesion] [varchar](300) NULL,
	[DetallePago] [xml] NULL,
	[DatosFactura] [xml] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Token]    Script Date: 16/12/2021 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Token](
	[TokenId] [bigint] IDENTITY(1,1) NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[Token] [varchar](128) NOT NULL,
	[FechaInicio] [datetime] NOT NULL,
	[FechaFin] [datetime] NOT NULL,
 CONSTRAINT [PK_Token] PRIMARY KEY CLUSTERED 
(
	[TokenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 16/12/2021 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[UsuarioId] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](30) NULL,
	[Contrasenia] [varchar](128) NULL,
	[Client] [varchar](30) NULL,
	[Activo] [bit] NULL,
	[FechaReg] [datetime] NULL,
	[CodigoConvenio] [varchar](100) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vh]    Script Date: 16/12/2021 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vh](
	[CODIGORESPUESTA] [char](1) NULL,
	[MENSAJERESPUESTA] [char](2) NULL,
	[NOMBRECLIENTE] [varchar](50) NULL,
	[ABREVIATURANIVEL] [char](3) NULL,
	[ABREVIATURASUBNIVEL] [char](3) NULL,
	[FACTURANITCI] [numeric](15, 0) NULL,
	[FACTURANOMBRE] [varchar](50) NULL,
	[FACTURAPUEDEMODDATOS] [char](1) NULL,
	[DATOSADICIONALES] [varchar](133) NULL,
	[GESTION] [float] NULL,
	[ABREVIATURACONCEPTOPAGO] [varchar](25) NULL,
	[PRIORIDAD] [float] NULL,
	[NROCUOTA] [float] NULL,
	[MESPERIODO] [float] NULL,
	[ANIOPERIODO] [float] NULL,
	[FECHAVENCIMIENTO] [datetime2](7) NULL,
	[CODIGOMONEDA] [char](3) NULL,
	[MONTOCONCEPTO] [float] NULL,
	[MONTOMULTA] [float] NULL,
	[MONTODESCUENTO] [float] NULL,
	[MONTONETO] [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Token]  WITH CHECK ADD  CONSTRAINT [FK_Token_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[Token] CHECK CONSTRAINT [FK_Token_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[SP_ConciliarPagos]    Script Date: 16/12/2021 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--EXEC SP_ConciliarPagos 1, '01/01/2019','31/12/2019','tes','demo','50QPHHENKNDXYK1UQRXY192ZE9YMPYKHB994G78P9RIYVVK75JBQK5HHNZMOOX'
--Metodo : ConciliarPagos
--Descripcion : 

CREATE PROCEDURE [dbo].[SP_ConciliarPagos]
	 @CodigoConvenio INTEGER
	,@FechaInicio DATE
	,@FechaFin DATE
	,@UsuarioPago VARCHAR(30) = NULL
	,@Usuario VARCHAR(30)
	,@Sesion VARCHAR(300)

AS
BEGIN

    -----------------------------------------------VALIDA EL TOKEN-----------------------------------------------------	
	IF NOT EXISTS(SELECT tokenid FROM dbo.Token T WHERE T.Token = @Sesion AND GETDATE() BETWEEN T.FechaInicio AND T.FechaFin)
	BEGIN
		SELECT
			'1' AS CodigoRespuesta
			,'El token es invalido, favor verificarlo.' AS MensajeRespuesta
		FOR XML	PATH('Result')

		RETURN;
	END
	------------------------------------------------LOG-----------------------------------------------------
	INSERT INTO LogEvento(Usuario,Parametros,Funcion,FechaReg)
	VALUES
	(
		@Usuario
		,CONCAT(
			'@CodigoConvenio = ', CAST( @CodigoConvenio AS VARCHAR), ', ',
			'@FechaInicio = ', CAST( @FechaInicio AS VARCHAR), ', ',
			'@FechaFin = ', CAST( @FechaFin AS VARCHAR), ', ',
			'@UsuarioPago = ', @UsuarioPago, ', ',
			'@UsuarioConsulta = ', @Usuario, ', ',
			'@Sesion = ', @Sesion, ' '
		)
		,OBJECT_NAME(@@PROCID)
		,GETDATE()
	)

	-----------------------------------------------LLAMADA ORACLE-----------------------------------------------------	

			DECLARE	@tableDetallePago AS TABLE
			(	
				 FechaTransaccion  VARCHAR(20)
				,NroTransaccionEmpresa INT
				,NroTransaccionBanco INT
				,CodigoTipoBusqueda VARCHAR(3)
				,CodigoCliente VARCHAR(30)
				,NombreCliente VARCHAR(60)
				,CodigoMoneda VARCHAR(3)
				,MontoPagado DECIMAL(15,2)
				,Usuario VARCHAR(30)
			)

		BEGIN TRY

			DECLARE @OPENQUERY VARCHAR(MAX) = CONCAT
			(
				'SELECT
					CODIGORESPUESTA,
					MENSAJERESPUESTA,
					FECHATRANSACCION,
					NROTRANSACCIONEMPRESA,
					NROTRANSACCION,
					CODIGOTIPOBUSQUEDA,
					CODIGOCLIENTE,
					NOMBRECLIENTE,
					CODIGOMONEDA,
					MONTOTOTALPAGADO,
					USUARIO
				FROM nexsol.V_MDW_CONCILIARPAGOS
				WHERE FECHATRANSACCION >= ''''', CONVERT(VARCHAR, @FechaInicio, 103), ''''' AND FECHATRANSACCION <= ''''', CONVERT(VARCHAR, @FechaFin, 103) , ''''''
			)

			--DECLARE @QUERY VARCHAR(MAX) = CONCAT
			--(
			--	'SELECT
			--		CODIGORESPUESTA,
			--		MENSAJERESPUESTA,
			--		FECHATRANSACCION,
			--		NROTRANSACCIONEMPRESA,
			--		NROTRANSACCION,
			--		CODIGOTIPOBUSQUEDA,
			--		CODIGOCLIENTE,
			--		NOMBRECLIENTE,
			--		CODIGOMONEDA,
			--		MONTOTOTALPAGADO,
			--		USUARIO
			--	FROM OPENQUERY(NEXSOL,''', @OPENQUERY,''')'
			--)
			

			--INSERT INTO @tableDetallePago
			--EXEC(@QUERY)
			INSERT INTO @tableDetallePago
			SELECT
			FORMAT (getdate(), 'ddMMyyyy ') AS FECHATRANSACCION,
			'12345' AS NROTRANSACCIONEMPRESA,
			'12345' AS NROTRANSACCION,
			'1' AS CODIGOTIPOBUSQUEDA,
			'5001' AS CODIGOCLIENTE,
			'Victor Terceros' AS NOMBRECLIENTE,
			'BOB' AS CODIGOMONEDA,
			'15000' AS MONTOTOTALPAGADO,
			 @Usuario AS USUARIO

			------------------------------------------------//ORACLE-----------------------------------------------------
			
			IF NOT EXISTS(SELECT * FROM @tableDetallePago)
			BEGIN
				SELECT
					 '1' AS CodigoRespuesta
					,'No existen datos de Pago.' AS MensajeRespuesta
				FOR XML	PATH('Result')

				RETURN;
			END
-----------------------------------------------RESULTADO FINAL-----------------------------------------------------
			SELECT 
				'0' AS [CodigoRespuesta],
				'' AS [MensajeRespuesta],
				(
					SELECT 								
						 ISNULL(FechaTransaccion, '') AS FechaTransaccion
						,ISNULL(NroTransaccionEmpresa, '') AS NroTransaccionEmpresa
						,ISNULL(NroTransaccionBanco, '') AS NroTransaccionBanco
						--,ISNULL(CodigoTipoBusqueda, '') AS CodigoTipoBusqueda
						,ISNULL(CodigoCliente, '') AS CodigoCliente
						,ISNULL(NombreCliente, '') AS NombreCliente
						,ISNULL(CodigoMoneda, '') AS CodigoMoneda
						,ISNULL(MontoPagado, '0') AS MontoPagado
						,ISNULL(@Usuario, '') AS Usuario 
					FROM @tableDetallePago
					FOR XML PATH('Pago'), ROOT('DetallePago'), TYPE
				)
			FOR XML PATH('Result')

		END TRY
		BEGIN CATCH

			SELECT
				'1' AS CodigoRespuesta,
				ISNULL(ERROR_MESSAGE(), 'ERROR') AS MensajeRespuesta   			
			FOR XML	PATH('Result')

		END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarTransaccion]    Script Date: 16/12/2021 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--EXEC [SP_ConsultarTransaccion] 1,'2019-01-01',1,'demo','50QPHHENKNDXYK1UQRXY192ZE9YMPYKHB994G78P9RIYVVK75JBQK5HHNZMOOX'
--Metodo : ConsultarTransaccion
--Descripcion : Permite consultar el estado de una transacción

CREATE PROCEDURE [dbo].[SP_ConsultarTransaccion]
	@CodigoConvenio INTEGER
	,@FechaTransaccion DATE
	,@NroTransaccion INT
	,@Usuario VARCHAR(30)
	,@Sesion VARCHAR(300)

AS
BEGIN

	-----------------------------------------------VALIDA EL TOKEN-----------------------------------------------------	
	IF NOT EXISTS(SELECT tokenid FROM dbo.Token T WHERE T.Token = @Sesion AND GETDATE() BETWEEN T.FechaInicio AND T.FechaFin)
	BEGIN
		SELECT
			'1' AS CodigoRespuesta
			,'El token es invalido, favor verificarlo.' AS MensajeRespuesta
		FOR XML	PATH('Result')

		RETURN;
	END
	-----------------------------------------------LOG-----------------------------------------------------	
	INSERT INTO LogEvento
	(
		Usuario
		,Parametros
		,Funcion
		,FechaReg
	)
	VALUES
	(
		SYSTEM_USER
		,CONCAT(
			 '@CodigoConvenio = ', CAST( @CodigoConvenio AS VARCHAR), ', ',
			 '@FechaTransaccion = ', CAST( @FechaTransaccion AS VARCHAR), ', ',
			 '@NroTransaccion = ', CAST( @NroTransaccion AS VARCHAR), ', ',
			 '@Usuario = ', @Usuario, ', ',		 		 
			 '@Sesion = ', @Sesion, ' '
		)
		,OBJECT_NAME(@@PROCID)
		,GETDATE()
	)
	-----------------------------------------------LLAMADA ORACLE-----------------------------------------------------	
		DECLARE	@tableResult AS TABLE(CodigoRespuesta VARCHAR(10),MensajeRespuesta VARCHAR(200),EstadoTransaccion CHAR(1))											
 
		BEGIN TRY

			DECLARE @Banco VARCHAR(100)= (SELECT TOP 1 client FROM dbo.Usuario WHERE UsuarioId = (SELECT TOP 1 usuarioId FROM  dbo.Token T WHERE T.Token = @Sesion))

			DECLARE @OPENQUERY VARCHAR(MAX) = CONCAT
			(
				'SELECT
					CODIGORESPUESTA,
					MENSAJERESPUESTA,
					ESTADOTRANSACCION
				FROM nexsol.V_MDW_CONSULTARTRANSACCION
				WHERE NROTRANSACCION = ''''', @NroTransaccion,''''' and BANCO = ''''', @Banco ,''''''
			)

			--DECLARE @QUERY VARCHAR(MAX) = CONCAT
			--(
			--	'SELECT
			--		CODIGORESPUESTA,
			--		MENSAJERESPUESTA,
			--		ESTADOTRANSACCION
			--	FROM OPENQUERY(NEXSOL,''', @OPENQUERY,''')'
			--)
			
			--INSERT INTO @tableResult
			--EXEC(@QUERY)
			INSERT INTO @tableResult
			SELECT '','','R'

			IF NOT EXISTS(SELECT * FROM @tableResult)
			BEGIN
				SELECT
					 '1' AS CodigoRespuesta
					,'No existen datos de Transanaccion.' AS MensajeRespuesta
				FOR XML	PATH('Result')

				RETURN;
			END
-----------------------------------------------RESULTADO FINAL-----------------------------------------------------	
			SELECT
				 '0' AS CodigoRespuesta
				,'' AS MensajeRespuesta
				,ISNULL(EstadoTransaccion, '') AS EstadoTransaccion
			FROM @tableResult
			FOR XML	PATH('Result')

		END TRY
		BEGIN CATCH
	
			SELECT
				'1' AS CodigoRespuesta,
				ISNULL(ERROR_MESSAGE(), 'ERROR')  AS MensajeRespuesta   			
			FOR XML	PATH('Result')

		END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[SP_ExtornarFactura]    Script Date: 16/12/2021 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--SP_ExtornarFactura 1 , '2019-01-01', 152022208,515151,'demo','50QPHHENKNDXYK1UQRXY192ZE9YMPYKHB994G78P9RIYVVK75JBQK5HHNZMOOX'

CREATE PROCEDURE [dbo].[SP_ExtornarFactura]
	 @CodigoConvenio INTEGER
	,@FechaTransaccion DATE
	,@NroTransaccion VARCHAR(100)
	,@NumeroFactura INT
	,@Usuario VARCHAR(30)
	,@Sesion VARCHAR(300)

AS
BEGIN

	-----------------------------------------------VALIDA EL TOKEN-----------------------------------------------------	
	IF NOT EXISTS(SELECT tokenid FROM dbo.Token T WHERE T.Token = @Sesion AND GETDATE() BETWEEN T.FechaInicio AND T.FechaFin)
	BEGIN
		SELECT
			'1' AS CodigoRespuesta
			,'El token es invalido, favor verificarlo.' AS MensajeRespuesta
		FOR XML	PATH('Result')

		RETURN;
	END
	-----------------------------------------------LOG-----------------------------------------------------	
	INSERT INTO LogEvento
	(
		Usuario
		,Parametros
		,Funcion
		,FechaReg
	)
	VALUES
	(
		@Usuario,
		CONCAT
		(
			 '@CodigoConvenio = ', CAST( @CodigoConvenio as varchar ), ', ',
			 '@FechaTransaccion = ', CAST( @FechaTransaccion as varchar), ', ',
			 '@NroTransaccion = ', CAST( @NroTransaccion  as varchar), ', ',
			 '@NumeroFactura = ', CAST( @NroTransaccion  as varchar), ', ',
			 '@Usuario = ', @Usuario, ', ',		 		 
			 '@Sesion= ', @Sesion , ' '
		),
		OBJECT_NAME(@@PROCID),
		GETDATE()
	)

	-----------------------------------------------LLAMADA ORACLE-----------------------------------------------------	
		DECLARE	@tableResult AS TABLE(	CodigoRespuesta VARCHAR(10),MensajeRespuesta VARCHAR(200)	)
		
		BEGIN TRY

			DECLARE @Banco VARCHAR(50)= (SELECT TOP 1 client FROM dbo.Usuario WHERE UsuarioId = (SELECT top 1 usuarioId FROM  dbo.Token T WHERE T.Token = @Sesion))

			DECLARE @FechaT AS VARCHAR(12) = CONVERT(VARCHAR, @FechaTransaccion, 103)
    							
			--EXEC('begin nexsol.pkg_ing_mdw.p_ExtornarFactura(?,?,?,?,?); end;', @FechaT, @NroTransaccion, @NumeroFactura, @Usuario, @Banco) AT NEXSOL
				
			--INSERT INTO @tableResult
			--SELECT 
			--	 '1'CODERROR
			--	,'MSG' MENSAJE
			--FROM OPENQUERY(NEXSOL, 'SELECT * FROM nexsol.excmlog WHERE EXCTIPO = ''E'' AND ROWNUM <= 1 ORDER BY EXCNUMOPE DESC')
				
			IF EXISTS(SELECT * FROM @tableResult WHERE RTRIM(ISNULL(MensajeRespuesta,'')) != '')
			BEGIN
				SELECT
					 '1' AS CodigoRespuesta
					,ISNULL(MensajeRespuesta,'') AS MensajeRespuesta
				FROM @tableResult
				FOR XML	PATH('Result')

				RETURN;
			END
			-----------------------------------------------RESULTADO FINAL-----------------------------------------------------	

			SELECT
				 '0' AS CodigoRespuesta
				,''  AS MensajeRespuesta
			FOR XML	PATH('Result')

		END TRY
		BEGIN CATCH
	
			SELECT
				'1' AS CodigoRespuesta,
				ISNULL(ERROR_MESSAGE(), 'ERROR') AS MensajeRespuesta   			
			FOR XML	PATH('Result')

		END CATCH
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerConceptosPago]    Script Date: 16/12/2021 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 --SP_ObtenerConceptosPago 1 ,'user', 'demo','NCXY8FY5VGXW4A01X5GPKDLEXEQ4DY179PES1GUHGPBS1V61YK8IMFXV893ZRT'

-- Metodo :  ObtenerConceptosPago
-- Descripcionn : Devuelve los conceptos de pago definidos por la empresa


CREATE PROCEDURE [dbo].[SP_ObtenerConceptosPago]
	 @CodigoConvenio INTEGER = 1
	,@Gestion VARCHAR(10)
	,@Usuario VARCHAR(30) = 'A'
	,@Sesion VARCHAR(300)

AS
BEGIN

	-----------------------------------------------VALIDA EL TOKEN-----------------------------------------------------	
	IF NOT EXISTS(SELECT tokenid FROM dbo.Token T WHERE T.Token = @Sesion AND GETDATE() BETWEEN T.FechaInicio AND T.FechaFin)
	BEGIN
		SELECT
			'1' AS CodigoRespuesta
			,'El token es invalido, favor verificarlo.' AS MensajeRespuesta
		FOR XML	PATH('Result')

		RETURN;
	END
	-----------------------------------------------LOG-----------------------------------------------------	
	INSERT INTO LogEvento(Usuario,Parametros,Funcion,FechaReg)
	VALUES
	(
		@Usuario,
		CONCAT(
			'@CodigoConvenio = ', CAST( @CodigoConvenio AS VARCHAR ), ', ',		
			'@Usuario = ', @Usuario, ', ',		 
			'@Gestion = ', @Gestion, ', ',
			'@Sesion = ' , @Sesion, ' '
		),
		OBJECT_NAME(@@PROCID),
		GETDATE()
	)
	-----------------------------------------------LLAMADA ORACLE-----------------------------------------------------	
	DECLARE	@tableTemporal AS TABLE(AbreviaturaConcepto VARCHAR(10),DescripcionConcepto VARCHAR(30),Estado CHAR(1))
		BEGIN TRY
			INSERT INTO @tableTemporal
			SELECT 
				 ABREVIATURACONCEPTO
				,DESCRIPCIONCONCEPTO
				,ESTADO
			FROM OPENQUERY(NEXSOL, 'SELECT ABREVIATURACONCEPTO, DESCRIPCIONCONCEPTO, ESTADO FROM nexsol.V_MDW_OBTENERCONCEPTOSPAGO')

			IF NOT EXISTS(SELECT * FROM @tableTemporal)
			BEGIN
				SELECT
					 '1' AS CodigoRespuesta
					,'No existen datos de Conceptos.' AS MensajeRespuesta
				FOR XML	PATH('Result')

				RETURN;
			END
-----------------------------------------------RESULTADO FINAL-----------------------------------------------------	
			SELECT 
				 0 AS [CodigoRespuesta],
				'' AS [MensajeRespuesta],	
				(
					SELECT
						 ISNULL(AbreviaturaConcepto, '') AS AbreviaturaConcepto
						,ISNULL(DescripcionConcepto, '') AS DescripcionConcepto
						,ISNULL(Estado, 'A') AS Estado 
					FROM @tableTemporal 
					FOR XML PATH('DetalleConceptos'), TYPE
				)
			FOR XML PATH('Result')

		END TRY

		BEGIN CATCH

			SELECT 
				'1' AS CodigoRespuesta
				,ISNULL(ERROR_MESSAGE(), '') AS MensajeRespuesta
			FOR XML	PATH('Result')

		END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerDatosFactura]    Script Date: 16/12/2021 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--SP_ObtenerDatosFactura 1 ,'2019-01-01',12,'demo','50QPHHENKNDXYK1UQRXY192ZE9YMPYKHB994G78P9RIYVVK75JBQK5HHNZMOOX'

--Metodo : ObtenerDatosDeFactura
--Descripcion : 
				--Devuelve los datos de la factura de una 
				--transacción específica.
				--Esto aplica cuando el Banco emite o 
				--imprime la factura

CREATE PROCEDURE [dbo].[SP_ObtenerDatosFactura]
	@CodigoConvenio INTEGER
	,@FechaTransaccion DATE
	,@NroTransaccion INT
	,@Usuario VARCHAR(30)
	,@Sesion VARCHAR(300)

AS
BEGIN

	-----------------------------------------------VALIDA EL TOKEN-----------------------------------------------------	
	IF NOT EXISTS(SELECT tokenid FROM dbo.Token T WHERE T.Token = @Sesion AND GETDATE() BETWEEN T.FechaInicio AND T.FechaFin)
	BEGIN
		SELECT
			'1' AS CodigoRespuesta
			,'El token es invalido, favor verificarlo.' AS MensajeRespuesta
		FOR XML	PATH('Result')

		RETURN;
	END
	-----------------------------------------------LOG-----------------------------------------------------	
	INSERT INTO LogEvento(Usuario,Parametros,Funcion,FechaReg)
	VALUES
	(
		@Usuario,
		CONCAT(
			'@CodigoConvenio = ', CAST( @CodigoConvenio AS VARCHAR ), ', ',
			'@FechaTransaccion = ', CAST( @FechaTransaccion AS VARCHAR), ', ',
			'@NroTransaccion = ', CAST( @NroTransaccion AS VARCHAR), ', ',
			'@Usuario = ', @Usuario, ', ',		 		 
			'@Sesion = ', @Sesion, ' '
		),
		OBJECT_NAME(@@PROCID),
		GETDATE()
	)
	-----------------------------------------------LLAMADA ORACLE-----------------------------------------------------	
	DECLARE	@tableResult AS TABLE
			(
				 Fecha varchar(20)
				,NumeroAutorizacion VARCHAR(20)
				,Numero VARCHAR(20)
				,CodigoControl VARCHAR(20)
				,NITCI VARCHAR(12)
				,Nombre VARCHAR(60)
				,CodigoMoneda VARCHAR(3)
				,Monto DECIMAL(15,2)
				,Estado CHAR(1)
			)

		BEGIN TRY

			
			DECLARE @OPENQUERY VARCHAR(MAX) = CONCAT
			(
				'SELECT 
					CodigoRespuesta,
					MensajeRespuesta,
					Fecha,
					NumeroAutorizacion,
					Numero,
					CodigoControl,
					NITCI,
					Nombre,
					CodigoMoneda,
					Monto,
					Estado
				FROM nexsol.V_MDW_OBTENERDATOSFACTURA
				WHERE NROTRANSACCION = ''''', @NroTransaccion, ''''''
			)

			--DECLARE @QUERY VARCHAR(MAX) = CONCAT
			--(
			--	'SELECT 
			--		Fecha,
			--		NumeroAutorizacion,
			--		Numero,
			--		CodigoControl,
			--		NITCI,
			--		Nombre,
			--		CodigoMoneda,
			--		Monto,
			--		Estado
			--	FROM OPENQUERY(NEXSOL,''', @OPENQUERY,''')'
			--)

			--INSERT INTO @tableResult
			--EXEC(@QUERY)
			INSERT INTO @tableResult
			SELECT 
					FORMAT (getdate(), 'ddMMyyyy ') AS Fecha,
					'12345' AS NumeroAutorizacion,
					'150' AS Numero,
					'AD-FH-522132' AS CodigoControl,
					'545213' AS NITCI,
					'Victor Terceros' AS Nombre,
					'BOB' AS CodigoMoneda,
					1500 AS Monto,
					'V' AS Estado

			IF NOT EXISTS(SELECT * FROM @tableResult)
			BEGIN
				SELECT
					 '1' AS CodigoRespuesta
					,'No existen datos de Factura.' AS MensajeRespuesta
				FOR XML	PATH('Result')

				RETURN;
			END
-----------------------------------------------RESULTADO FINAL-----------------------------------------------------	
			SELECT 
				 '0' AS CodigoRespuesta
				,'' AS MensajeRespuesta
				,ISNULL(Fecha, '') AS Fecha
				,ISNULL(NumeroAutorizacion, '') AS NumeroAutorizacion
				,ISNULL(Numero, '') AS Numero
				,ISNULL(CodigoControl, '') AS CodigoControl
				,ISNULL(NITCI, '') AS NITCI
				,ISNULL(Nombre, '') AS Nombre
				,ISNULL(CodigoMoneda, '') AS CodigoMoneda
				,ISNULL(Monto, 0) AS Monto
				,ISNULL(Estado, '') AS Estado
				,'' AS DatosAdicionalesFormato
				,'' AS DatosAdicionales
			FROM @tableResult
			FOR XML	PATH('Result')
			-- Fin Resultado

		END TRY

		BEGIN CATCH

			SELECT
				'1' AS CodigoRespuesta
				,ISNULL(ERROR_MESSAGE(), 'ERROR') AS MensajeRespuesta	
			FOR XML	PATH('Result')

		END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerDetallePagos]    Script Date: 16/12/2021 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


---SP_ObtenerDetallePagos 1 , 'AAA','5892','2019-01-01','2019-01-01','demo', '50QPHHENKNDXYK1UQRXY192ZE9YMPYKHB994G78P9RIYVVK75JBQK5HHNZMOOX'

--Metodo : ObtenerDetallePagos
--Descripcion : Devuelve el detalle de los pagos que realizó un determinado cliente de la empresa

CREATE PROCEDURE [dbo].[SP_ObtenerDetallePagos]
	@CodigoConvenio INTEGER
	,@CodigoTipoBusqueda VARCHAR(3)
	,@CodigoCliente VARCHAR(30)
	,@FechaInicio DATE
	,@FechaFin DATE
	,@Usuario VARCHAR(30)
	,@Sesion VARCHAR(300)

AS
BEGIN

	-----------------------------------------------VALIDA EL TOKEN-----------------------------------------------------	
	IF NOT EXISTS(SELECT tokenid FROM dbo.Token T WHERE T.Token = @Sesion AND GETDATE() BETWEEN T.FechaInicio AND T.FechaFin)
	BEGIN
		SELECT
			'1' AS CodigoRespuesta
			,'El token es invalido, favor verificarlo.' AS MensajeRespuesta
		FOR XML	PATH('Result')

		RETURN;
	END
	-----------------------------------------------LOG-----------------------------------------------------	
	INSERT INTO LogEvento(Usuario,Parametros,Funcion,FechaReg)
	VALUES
	(
		@Usuario,
		CONCAT(
			'@CodigoConvenio = ', CAST(@CodigoConvenio AS VARCHAR), ', ',
			'@CodigoTipoBusqueda = ', @CodigoTipoBusqueda, ', ',
			'@CodigoCliente = ', @CodigoCliente, ', ',
			'@FechaInicio = ', CAST(@FechaInicio AS VARCHAR), ', ',
			'@FechaFin = ', CAST(@FechaFin AS VARCHAR), ', ',		 
			'@Usuario = ', @Usuario, ', ',		 		 
			'@Sesion = ', @Sesion, ' '
		),
		OBJECT_NAME(@@PROCID),
		GETDATE()
	)
	-----------------------------------------------LLAMADA ORACLE-----------------------------------------------------	
	DECLARE	@tableDetallePagos AS TABLE(FechaTransaccion VARCHAR(20),NroTransaccion INT,CodigoMoneda VARCHAR(3),MontoTotalPagado DECIMAL(15,2)
				,Usuario VARCHAR(30),Gestion INT,AbreviaturaConceptoPago VARCHAR(20),NroCuota INT,MesPeriodo INT
				,AnioPeriodo INT,FechaVencimiento VARCHAR(20),MontoConcepto DECIMAL(15,2),MontoMulta DECIMAL(15,2)
				,MontoDescuento DECIMAL(15,2),MontoNeto DECIMAL(15,2),Fecha VARCHAR(20),NumeroAutorizacion INT
				,Numero INT,CodigoControl VARCHAR(20),NITCI VARCHAR(12),Nombre VARCHAR(60),Monto DECIMAL(15,2),Estado CHAR(1))

		BEGIN TRY

		DECLARE @OPENQUERY VARCHAR(MAX)= CONCAT('SELECT 
					CodigoRespuesta,
					MensajeRespuesta,
					FechaTransaccion,
					NroTransaccion,
					CodigoMoneda,
					MontoTotalPagado,
					Usuario,
					Gestion,
					AbreviaturaConceptoPago,
					NroCuota,
					MesPeriodo,
					AnioPeriodo,
					FechaVencimiento,
					MontoConcepto,
					MontoMulta,
					MontoDescuento,
					MontoNeto,
					Fecha,
					NumeroAutorizacion,
					Numero,
					CodigoControl,
					NITCI,
					Nombre,
					Monto,
					Estado,
					CodigoCliente
				FROM nexsol.V_MDW_OBTENERDETALLEPAGOS WHERE CODIGOCLIENTE = ', @CodigoCliente
				)
		DECLARE @QUERY VARCHAR(MAX)= CONCAT('SELECT  
                 FechaTransaccion
				,NroTransaccion
				,CodigoMoneda
				,MontoTotalPagado
				,Usuario
				,Gestion
				,AbreviaturaConceptoPago
				,NroCuota
				,MesPeriodo
				,AnioPeriodo
				,FechaVencimiento
				,MontoConcepto
				,MontoMulta
				,MontoDescuento
				,MontoNeto
				,Fecha
				,NumeroAutorizacion
				,Numero
				,CodigoControl
				,NITCI
				,Nombre
				,Monto
				,Estado
				FROM OPENQUERY(NEXSOL,''', @OPENQUERY ,''')')

			INSERT INTO @tableDetallePagos
			(
				 FechaTransaccion
				,NroTransaccion
				,CodigoMoneda
				,MontoTotalPagado
				,Usuario
				,Gestion
				,AbreviaturaConceptoPago
				,NroCuota
				,MesPeriodo
				,AnioPeriodo
				,FechaVencimiento
				,MontoConcepto
				,MontoMulta
				,MontoDescuento
				,MontoNeto
				,Fecha
				,NumeroAutorizacion
				,Numero
				,CodigoControl
				,NITCI
				,Nombre
				,Monto
				,Estado 
			)
			EXEC (@QUERY)


			IF NOT EXISTS(SELECT * FROM @tableDetallePagos)
			BEGIN
				SELECT
					 '1' AS CodigoRespuesta
					,'No existen datos de de Pagos.' AS MensajeRespuesta
				FOR XML	PATH('Result')

				RETURN;
			END

-----------------------------------------------RESULTADO FINAL-----------------------------------------------------				
			SELECT 
				 '0' AS CodigoRespuesta
				,'' AS MensajeRespuesta
				,'NA' AS NombreCliente
				,(
					SELECT
						 ISNULL(FechaTransaccion, '') AS FechaTransaccion
						,ISNULL(NroTransaccion, '') AS NroTransaccion
						,ISNULL(CodigoMoneda, '') AS CodigoMoneda
						,ISNULL(MontoTotalPagado, '') AS MontoTotalPagado
						,ISNULL(Usuario, '') AS Usuario
						,(
							SELECT						
								 ISNULL(Gestion, '') AS Gestion
								,ISNULL(AbreviaturaConceptoPago, '') AS AbreviaturaConceptoPago
								,ISNULL(NroCuota, '') AS NroCuota
								,ISNULL(MesPeriodo, '') AS MesPeriodo
								,ISNULL(AnioPeriodo, '') AS AnioPeriodo
								,ISNULL(FechaVencimiento, '') AS FechaVencimiento
								,ISNULL(CodigoMoneda, '') AS CodigoMoneda
								,ISNULL(MontoConcepto, '0') AS MontoConcepto
								,ISNULL(MontoMulta, '0') AS MontoMulta
								,ISNULL(MontoDescuento, '0') AS MontoDescuento
								,ISNULL(MontoNeto, '0') AS MontoNeto
								,'' AS DatosAdicionalesFormato
								,'' AS DatosAdicionales
							FOR XML PATH('Detalle'), ROOT('DetallePago'), TYPE
						)
						,(
							SELECT TOP 1
								 ISNULL(Fecha, '') AS Fecha
								,ISNULL(NumeroAutorizacion, '') AS NumeroAutorizacion
								,ISNULL(Numero, '') AS Numero
								,ISNULL(CodigoControl, '') AS CodigoControl
								,ISNULL(NITCI, '0') AS NITCI
								,ISNULL(Nombre, '') AS Nombre
								,ISNULL(CodigoMoneda, '') AS CodigoMoneda
								,ISNULL(Monto, '0') AS Monto
								,ISNULL(Estado, 'V') AS Estado
								,'' AS DatosAdicionalesFormato
								,'' AS DatosAdicionales
							FOR XML PATH('DatosFactura'), TYPE
						)
					FOR XML PATH('Pago'), ROOT('MaestroPagos'), TYPE
				)				
			FROM @tableDetallePagos
			FOR XML	PATH('Result')

		END TRY
		BEGIN CATCH

			SELECT
				'1' AS CodigoRespuesta
				,ISNULL(ERROR_MESSAGE(), 'ERROR') AS MensajeRespuesta   			
			FOR XML	PATH('Result')

		END CATCH

	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerDeuda]    Script Date: 16/12/2021 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--EXEC [SP_ObtenerDeuda] 1, '2020','AAA','5892','usuario01','NCXY8FY5VGXW4A01X5GPKDLEXEQ4DY179PES1GUHGPBS1V61YK8IMFXV893ZRT'

--Metodo : ObtenerDeuda
--Descripcion : Devuelve la lista de deudas pendientes de  un determinado cliente de la empresa
--17171
--4887
--7747
--19068
--19069
--17145
CREATE PROCEDURE [dbo].[SP_ObtenerDeuda]
	 @CodigoConvenio VARCHAR(100) = '1020435022'
	,@Gestion VARCHAR(10) = '2021'
	,@CodigoTipoBusqueda CHAR(3) = 'COD'
	,@CodigoCliente VARCHAR(30) = '17171'
	,@Usuario VARCHAR(30) = 'BCP'
	,@Sesion VARCHAR(300) = 'I9FATQEDSBC9HNU66TS5HYKXWHE7GD6SOSM850687T3KXFKGNS3C9AGT6X0J0Q'

AS
BEGIN

-----------------------------------------------LOG-----------------------------------------------------	
	INSERT INTO LogEvento(Usuario,Parametros,Funcion,FechaReg)
	VALUES
	(
		SYSTEM_USER,
		CONCAT(
			'@CodigoConvenio = ', @CodigoConvenio, ', ',
			'@Gestion = ', @Gestion, ', ',
			'@CodigoCliente = ', @CodigoCliente, ', ',
			'@Usuario = ', @Usuario, ', ',		 		 
			'@Sesion = ', @Sesion, ' '
		),
		OBJECT_NAME(@@PROCID),
		GETDATE()
	)
	-----------------------------------------------VALIDA EL CODIGO DE TIPO BUSQUEDA-----------------------------------------------------	
	IF @CodigoTipoBusqueda != 'COD' 
	BEGIN
		SELECT
			'1' AS CodigoRespuesta
			,'Solo se admite busqueda por Codigo de Alumno. Codigo Tipo Busqueda de ser COD.' AS MensajeRespuesta
		FOR XML	PATH('Result')

		RETURN;
	END
	-----------------------------------------------VALIDA EL CODIGO DE CONVENIO-----------------------------------------------------		
    IF NOT EXISTS (SELECT * FROM [Usuario] WHERE Contrasenia = @Sesion )
	BEGIN
		SELECT
			'1' AS CodigoRespuesta
			,'La Sesion o el Usuario son invalidos.' AS MensajeRespuesta
		FOR XML	PATH('Result')

		RETURN;
	END
	----
	DECLARE @dbUsuario VARCHAR(30)
	DECLARE @dbCodigoConvenio VARCHAR(100)
	
	SELECT TOP 1 @dbUsuario = Usuario
	            ,@dbCodigoConvenio = CodigoConvenio
	FROM [Usuario] WHERE Contrasenia = @Sesion  
	----
	IF @dbUsuario != @Usuario 
	BEGIN
		SELECT
			'1' AS CodigoRespuesta
			,'La Sesion o el Usuario son invalidos' AS MensajeRespuesta
		FOR XML	PATH('Result')

		RETURN;
	END
	----
	IF @CodigoConvenio != @dbCodigoConvenio
	BEGIN
		SELECT
			'1' AS CodigoRespuesta
			,'El Codigo de convenio es invalido' AS MensajeRespuesta
		FOR XML	PATH('Result')

		RETURN;
	END
	-----------------------------------------------LOG-----------------------------------------------------	
	INSERT INTO LogEvento(Usuario,Parametros,Funcion,FechaReg)
	VALUES
	(
		SYSTEM_USER,
		CONCAT(
			'@CodigoConvenio = ', @CodigoConvenio, ', ',
			'@Gestion = ', @Gestion, ', ',
			'@CodigoCliente = ', @CodigoCliente, ', ',
			'@Usuario = ', @Usuario, ', ',		 		 
			'@Sesion = ', @Sesion, ' '
		),
		OBJECT_NAME(@@PROCID),
		GETDATE()
	)
-----------------------------------------------LLAMADA ORACLE-----------------------------------------------------	
			DECLARE	@tableResult AS TABLE
			(
				NOMBRECLIENTE VARCHAR(50) NULL
				,ABREVIATURANIVEL CHAR(3) NULL
				,ABREVIATURASUBNIVEL CHAR(3) NULL
				,FACTURANITCI VARCHAR(50) NULL
				,FACTURANOMBRE VARCHAR(50) NULL
				,FACTURAPUEDEMODDATOS CHAR(1) NULL
				,DATOSADICIONALES VARCHAR(133) NULL
				,GESTION VARCHAR(50) NULL
				,ABREVIATURACONCEPTOPAGO VARCHAR(25) NULL
				,PRIORIDAD INT NULL
				,NROCUOTA INT NULL
				,MESPERIODO INT NULL
				,ANIOPERIODO INT NULL
				,FECHAVENCIMIENTO VARCHAR(50) NULL
				,CODIGOMONEDA CHAR(3) NULL
				,MONTOCONCEPTO DECIMAL(18,2) NULL
				,MONTOMULTA DECIMAL(18,2) NULL
				,MONTODESCUENTO DECIMAL(18,2) NULL
				,MONTONETO DECIMAL(18,2) NULL
				,FACTURAR CHAR(1) NULL 
			)
		BEGIN TRY

			
			DECLARE @OPENQUERY VARCHAR(MAX) = CONCAT
			(
				'SELECT
					NOMBRECLIENTE,
					ABREVIATURANIVEL,
					ABREVIATURASUBNIVEL,
					FACTURANITCI,
					FACTURANOMBRE,
					FACTURAPUEDEMODDATOS,
					DATOSADICIONALES,
					GESTION,
					ABREVIATURACONCEPTOPAGO,
					PRIORIDAD,
					NROCUOTA,
					MESPERIODO,
					ANIOPERIODO,
					FECHAVENCIMIENTO,
					CODIGOMONEDA,
					MONTOCONCEPTO,
					MONTOMULTA,
					MONTODESCUENTO,
					MONTONETO,
					FACTURAR
				FROM nexsol.V_MDW_OBTENERDEUDA 
				WHERE CODIGOCLIENTE =''''', @CodigoCliente, ''''''--, ' AND GESTION=',@Gestion
			)

			DECLARE @QUERY VARCHAR(MAX) = CONCAT
			(
				'SELECT
					NOMBRECLIENTE,
					ABREVIATURANIVEL,
					ABREVIATURASUBNIVEL,
					FACTURANITCI,
					FACTURANOMBRE,
					FACTURAPUEDEMODDATOS,
					DATOSADICIONALES,
					GESTION,
					ABREVIATURACONCEPTOPAGO,
					PRIORIDAD,
					NROCUOTA,
					MESPERIODO,
					ANIOPERIODO,
					FECHAVENCIMIENTO,
					CODIGOMONEDA,
					MONTOCONCEPTO,
					MONTOMULTA,
					MONTODESCUENTO,
					MONTONETO,
					FACTURAR
				FROM OPENQUERY(NEXSOL,''', @OPENQUERY, ''')'
			)		

			INSERT INTO @tableResult
			EXEC(@QUERY)
			
			
			IF NOT EXISTS(SELECT * FROM @tableResult)
			BEGIN
				SELECT
					 '1' AS CodigoRespuesta
					,'No existen datos de Deudas.' AS MensajeRespuesta
				FOR XML	PATH('Result')

				RETURN;
			END
-----------------------------------------------RESULTADO FINAL-----------------------------------------------------	
			SELECT TOP 1
				 '0' AS CodigoRespuesta
				,'' AS MensajeRespuesta
				,@CodigoCliente AS Codigo
				,ISNULL(NombreCliente, '') AS NombreCliente
				,ISNULL(AbreviaturaNivel, '') AS AbreviaturaNivel
				,ISNULL(AbreviaturaSubnivel, '') AS AbreviaturaSubnivel
				,ISNULL(FacturaNITCI, '') AS FacturaNITCI
				,ISNULL(FacturaNombre, '') AS FacturaNombre
				,'N' AS FacturaDetallada
				,'N' AS ComprobanteDetallado
				,'N' AS ConceptosAgrupados
				,ISNULL(FacturaPuedeModDatos, 'S') AS FacturaPuedeModDatos
				,'' AS DatosAdicionalesFormato
				,'' AS DatosAdicionales 
				,(
					SELECT
						ISNULL(Gestion, '') AS Gestion
						,ISNULL(AbreviaturaConceptoPago, '') AS AbreviaturaConceptoPago
						,ISNULL(Prioridad, '') AS Prioridad
						,ISNULL(NroCuota, '') AS NroCuota
						,ISNULL(MesPeriodo, '') AS MesPeriodo
						,ISNULL(AnioPeriodo, '') AS AnioPeriodo
						,ISNULL(FechaVencimiento, '') AS FechaVencimiento
						,ISNULL(CodigoMoneda, 'USD') AS CodigoMoneda
						,ISNULL(MontoConcepto, 0) AS MontoConcepto
						,ISNULL(MontoMulta, 0) AS MontoMulta
						,ISNULL(MontoDescuento, 0) AS MontoDescuento
						,ISNULL(MontoNeto, 0) AS MontoNeto
						,ISNULL(FACTURAR, '1') AS Facturar
						,'' AS FactorAgrupacion
						,'' AS GlosaAgrupacion
						,'' AS PrioridadAgrupacion
						,'' AS DatosAdicionalesFormato
						,'' AS DatosAdicionales
					FROM @tableResult
					FOR XML PATH('DetalleDeuda'), TYPE
					--FOR XML PATH('Deuda'), ROOT('DetalleDeuda'), TYPE
				)				
			FROM @tableResult
			FOR XML	PATH('Result')

		END TRY
		BEGIN CATCH 

			SELECT
				'1' AS CodigoRespuesta
				,ISNULL(ERROR_MESSAGE(), 'ERROR') AS MensajeRespuesta   			
			FOR XML	PATH('Result')

		END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerListaClientes]    Script Date: 16/12/2021 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--EXEC SP_ObtenerListaClientes  1, 'T','T','demo', 'NCXY8FY5VGXW4A01X5GPKDLEXEQ4DY179PES1GUHGPBS1V61YK8IMFXV893ZRT'

--Metodo : ObtenerListaClientes 
--Descripcion : Devuelve la lista de clientes de la empresa


CREATE PROCEDURE [dbo].[SP_ObtenerListaClientes]
	 @CodigoConvenio INTEGER
	,@Gestion VARCHAR(10)
	,@TipoConsulta CHAR(1)
	,@Usuario VARCHAR(30)
	,@Sesion VARCHAR(300)

AS
BEGIN

DECLARE @TipoBusqueda VARCHAR(3) = 'COD'
-----------------------------------------------VALIDA EL TOKEN-----------------------------------------------------	
	IF NOT EXISTS(SELECT tokenid FROM dbo.Token T WHERE T.Token = @Sesion AND GETDATE() BETWEEN T.FechaInicio AND T.FechaFin)
	BEGIN
		SELECT
			'1' AS CodigoRespuesta
			,'El token es invalido, favor verificarlo.' AS MensajeRespuesta
		FOR XML	PATH('Result')

		RETURN;
	END
-----------------------------------------------LOG-----------------------------------------------------	
INSERT INTO LogEvento(Usuario,Parametros,Funcion,FechaReg)
VALUES
(
	@Usuario,
	CONCAT(
		'@CodigoConvenio = ', CAST(@CodigoConvenio AS VARCHAR), ', ',		
		'@Gestion = ', @Gestion, ', ',	 
		'@TipoConsulta = ', @TipoConsulta, ', ',		 
		'@Usuario = ', @Usuario, ', ',
		'@Sesion = ', @Sesion, ' '
	),
	OBJECT_NAME(@@PROCID),
	GETDATE()
)
-----------------------------------------------LLAMADA ORACLE-----------------------------------------------------	
DECLARE	@tableTemporal AS TABLE(CodigoTipoBusqueda VARCHAR(3),CodigoCliente VARCHAR(30),NombreCliente VARCHAR(60),AbreviaturaNivel VARCHAR(10),AbreviaturaSubNivel VARCHAR(10))

	BEGIN TRY

		DECLARE @OPENQUERY VARCHAR(MAX) = 
			'SELECT
				CODIGOTIPOBUSQUEDA
				,CODIGOCLIENTE
				,NOMBRECLIENTE
				,ABREVIATURANIVEL
				,ABREVIATURASUBNIVEL 
			FROM nexsol.V_MDW_OBTENERLISTACLIENTES'

		DECLARE @QUERY VARCHAR(MAX) = CONCAT
		(
			'SELECT
				CODIGOTIPOBUSQUEDA
				,CODIGOCLIENTE
				,NOMBRECLIENTE
				,ABREVIATURANIVEL
				,ABREVIATURASUBNIVEL
			FROM OPENQUERY(NEXSOL,''', @OPENQUERY,''')'
		)			

		INSERT INTO @tableTemporal
		EXEC(@QUERY)

		
		IF NOT EXISTS(SELECT * FROM @tableTemporal)
			BEGIN
				SELECT
					 '1' AS CodigoRespuesta
					,'No existen datos de Clientes.' AS MensajeRespuesta
				FOR XML	PATH('Result')

				RETURN;
			END
-----------------------------------------------RESULTADO FINAL-----------------------------------------------------	

		SELECT 
			0 AS [CodigoRespuesta]
			,'' AS [MensajeRespuesta]
			,(
				SELECT
					 ISNULL(CodigoTipoBusqueda, '') AS CodigoTipoBusqueda
					,ISNULL(CodigoCliente, '') AS CodigoCliente
					,ISNULL(NombreCliente, '') AS NombreCliente
					,ISNULL(AbreviaturaNivel, '') AS AbreviaturaNivel
					,ISNULL(AbreviaturaSubNivel, '') AS AbreviaturaSubNivel
					,(
						SELECT
							 '' AS CodigoTipoBusquedaRel
							,'' AS CodigoClienteRel
							,'' AS NombreClienteRel
							,'' AS AbreviaturaNivelRel
							,'' AS AbreviaturaSubNivelRel
							,'' AS Referencia
						FOR XML PATH('DetalleServiciosRelacionados'), TYPE
					)
				FROM @tableTemporal
				FOR XML PATH('DetalleClientes'), TYPE
			)
		FOR XML PATH('Result')

	END TRY
	BEGIN CATCH

		SELECT 
			'1' AS CodigoRespuesta
			,ISNULL(ERROR_MESSAGE(), 'ERROR') AS MensajeRespuesta   			
		FOR XML	PATH('Result')

	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerListaNiveles]    Script Date: 16/12/2021 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--SP_ObtenerListaNiveles  1 , '2020', 'demo', 'NCXY8FY5VGXW4A01X5GPKDLEXEQ4DY179PES1GUHGPBS1V61YK8IMFXV893ZRT'
--Metodo : ObtenerListaNiveles
--Descripcion : Devuelve la lista de niveles (curso, grupo, etc.) definidos por la empresa


CREATE PROCEDURE [dbo].[SP_ObtenerListaNiveles]
	@CodigoConvenio INTEGER
	,@Gestion VARCHAR(10)
	,@Usuario VARCHAR(30)
	,@Sesion VARCHAR(300)
AS
BEGIN

	-----------------------------------------------VALIDA EL TOKEN-----------------------------------------------------	
	IF NOT EXISTS(SELECT tokenid FROM dbo.Token T WHERE T.Token = @Sesion AND GETDATE() BETWEEN T.FechaInicio AND T.FechaFin)
	BEGIN
		SELECT
			'1' AS CodigoRespuesta
			,'El token es invalido, favor verificarlo.' AS MensajeRespuesta
		FOR XML	PATH('Result')

		RETURN;
	END
	-----------------------------------------------LOG-----------------------------------------------------	
	INSERT INTO LogEvento(Usuario,Parametros,Funcion,FechaReg)
	VALUES
	(
		@Usuario,
		CONCAT(
			 '@CodigoConvenio = ', CAST( @CodigoConvenio AS VARCHAR), ', ',		
			 '@Usuario = ', @Usuario, ', ',		 
			 '@Gestion = ', @Gestion, ', ',
			 '@Sesion = ', @Sesion, ' '
		),
		OBJECT_NAME(@@PROCID),
		GETDATE()
	)
	-----------------------------------------------LLAMADA ORACLE-----------------------------------------------------	
	    DECLARE	@tableTemporal AS TABLE(AbreviaturaNivel VARCHAR(10),DescripcionNivel VARCHAR(50),Estado CHAR(1))
		
		BEGIN TRY

			INSERT INTO @tableTemporal
			SELECT
				 ABREVIATURANIVEL
				,DESCRIPCIONNIVEL
				,ESTADO 
			FROM OPENQUERY(NEXSOL, 'SELECT ABREVIATURANIVEL, DESCRIPCIONNIVEL, ESTADO FROM nexsol.V_MDW_OBTENERLISTANIVELES')

			IF NOT EXISTS(SELECT * FROM @tableTemporal)
			BEGIN
				SELECT
					 '1' AS CodigoRespuesta
					,'No existen datos de Nivel.' AS MensajeRespuesta
				FOR XML	PATH('Result')

				RETURN;
			END
-----------------------------------------------RESULTADO FINAL-----------------------------------------------------	


			SELECT 
				 0 AS [CodigoRespuesta]
				,'' AS [MensajeRespuesta]
				,(
					SELECT
						 ISNULL(AbreviaturaNivel, '') AS AbreviaturaNivel
						,ISNULL(DescripcionNivel, '') AS DescripcionNivel
						,REPLACE(REPLACE(ISNULL(Estado, ''),'H','A'),'D','I') AS EstadoSubnivel
						,'S' AS Afiliacion
					FROM @tableTemporal
					FOR XML PATH('DetalleNiveles'), TYPE
				)
			FOR XML PATH('Result')

		END TRY
		BEGIN CATCH

			SELECT 
				 '1' AS CodigoRespuesta
				,ISNULL(ERROR_MESSAGE(), 'ERROR') AS MensajeRespuesta   			
			FOR XML	PATH('Result')

		END CATCH

	

END
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerListaSubNiveles]    Script Date: 16/12/2021 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--SP_ObtenerListaSubNiveles 1, '2020', 'demo', 'NCXY8FY5VGXW4A01X5GPKDLEXEQ4DY179PES1GUHGPBS1V61YK8IMFXV893ZRT'

--Metodo : ObtenerListaSubNiveles
--Descripcion : Devuelve la lista de subniveles definidos por la empresa


CREATE  PROCEDURE [dbo].[SP_ObtenerListaSubNiveles]
	 @CodigoConvenio INTEGER
	,@Gestion VARCHAR(10)
	,@Usuario VARCHAR(30)
	,@Sesion VARCHAR(300)

AS
BEGIN

	-----------------------------------------------VALIDA EL TOKEN-----------------------------------------------------	
	IF NOT EXISTS(SELECT tokenid FROM dbo.Token T WHERE T.Token = @Sesion AND GETDATE() BETWEEN T.FechaInicio AND T.FechaFin)
	BEGIN
		SELECT
			'1' AS CodigoRespuesta
			,'El token es invalido, favor verificarlo.' AS MensajeRespuesta
		FOR XML	PATH('Result')

		RETURN;
	END
	-----------------------------------------------LOG-----------------------------------------------------	
	INSERT INTO LogEvento(Usuario,Parametros,Funcion,FechaReg)
	VALUES
	(
		@Usuario,
		CONCAT('@CodigoConvenio = ', CAST(@CodigoConvenio AS VARCHAR), ', ','@Usuario = ', @Usuario, ', ','@Gestion = ', @Gestion, ', ','@Sesion = ', @Sesion, ' '),
		OBJECT_NAME(@@PROCID),
		GETDATE()
	)
	-----------------------------------------------LLAMADA ORACLE-----------------------------------------------------	
	   DECLARE	@tableTemporal AS TABLE(AbreviaturaNivel VARCHAR(50),AbreviaturaSubnivel VARCHAR(50),DescripcionSubnivel VARCHAR(50),Estado CHAR(1))

		BEGIN TRY
			INSERT INTO @tableTemporal
			SELECT ABREVIATURASUBNIVEL, ABREVIATURASUBNIVEL, DESCRIPCIONSUBNIVEL, ESTADO
			FROM OPENQUERY(NEXSOL, 'SELECT ABREVIATURASUBNIVEL, DESCRIPCIONSUBNIVEL, ESTADO FROM nexsol.V_MDW_OBTENERLISTASUBNIVELES')
			
			IF NOT EXISTS(SELECT * FROM @tableTemporal)
			BEGIN
				SELECT
					 '1' AS CodigoRespuesta
					,'No existen datos de SubNivel.' AS MensajeRespuesta
				FOR XML	PATH('Result')

				RETURN;
			END
-----------------------------------------------RESULTADO FINAL-----------------------------------------------------	
			SELECT 
				0 AS [CodigoRespuesta],
				'' AS [MensajeRespuesta],	
				(
					SELECT
						 ISNULL(AbreviaturaNivel, '') AS AbreviaturaNivel
						,ISNULL(AbreviaturaSubnivel, '') AS AbreviaturaSubnivel
						,ISNULL(DescripcionSubnivel, '') AS DescripcionSubnivel
						,REPLACE(REPLACE(ISNULL(Estado, ''),'H','A'),'D','I') AS EstadoSubnivel
						,0 AS Monto
					FROM @tableTemporal 
					FOR XML PATH('DetalleSubNiveles'), TYPE
				)
			FOR XML PATH('Result')

		END TRY
		BEGIN CATCH

			SELECT 
				 '1' AS CodigoRespuesta
				,ISNULL(ERROR_MESSAGE(), 'ERROR') AS MensajeRespuesta   			
			FOR XML	PATH('Result')

		END CATCH

		

END
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerPlanPagos]    Script Date: 16/12/2021 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--SP_ObtenerPlanPagos 1, '2020', '30123', '5888','usuario01', 'NCXY8FY5VGXW4A01X5GPKDLEXEQ4DY179PES1GUHGPBS1V61YK8IMFXV893ZRT'
--Metodo : ObtenerPlanPagos
--Descripcion : Devuelve el plan de pagos completo de un determinado cliente de la empresa

CREATE PROCEDURE [dbo].[SP_ObtenerPlanPagos]
	 @CodigoConvenio INTEGER
	,@Gestion VARCHAR(10)
	,@CodigoTipoBusqueda VARCHAR(3)
	,@CodigoCliente VARCHAR(30)
	,@Usuario VARCHAR(30)
	,@Sesion VARCHAR(300)

AS
BEGIN

-----------------------------------------------VALIDA EL TOKEN-----------------------------------------------------	
	IF NOT EXISTS(SELECT tokenid FROM dbo.Token T WHERE T.Token = @Sesion AND GETDATE() BETWEEN T.FechaInicio AND T.FechaFin)
	BEGIN
		SELECT
			'1' AS CodigoRespuesta
			,'El token es invalido, favor verificarlo.' AS MensajeRespuesta
		FOR XML	PATH('Result')

		RETURN;
	END
-----------------------------------------------LOG-----------------------------------------------------	
INSERT INTO LogEvento(Usuario,Parametros,Funcion,FechaReg)
VALUES
(
	SYSTEM_USER,
	CONCAT(
		 '@CodigoConvenio = ', CAST(@CodigoConvenio AS VARCHAR), ', ',
		 '@Gestion = ', @Gestion, ', ',
		 '@CodigoTipoBusqueda = ', @CodigoTipoBusqueda, ', ',
		 '@CodigoCliente = ', @CodigoCliente, ', ',
		 '@Usuario = ', @Usuario, ', ',		 		 
		 '@Sesion = ', @Sesion, ' '
	),
	OBJECT_NAME(@@PROCID),
	GETDATE()
)

			
	BEGIN TRY
			 			   
		DECLARE	@tableResult AS TABLE
		(	
			 NombreCliente VARCHAR(60)
			,AbreviaturaNivel VARCHAR(20)
			,AbreviaturaSubNivel VARCHAR(20)
			,Gestion INT
			,AbreviaturaConceptoPago VARCHAR(20)
			,Prioridad INT
			,NroCuota INT
			,MesPeriodo INT
			,AnioPeriodo INT
			,FechaVencimiento varchar(50)
			,CodigoMoneda VARCHAR(3)
			,MontoConcepto DECIMAL(15,2)
			,MontoMulta DECIMAL(15,2)
			,MontoDescuento DECIMAL(15,2)
			,MontoNeto DECIMAL(15,2)
			,Estado CHAR(1)
			,DatosAdicionales VARCHAR(150)
		)

		
		DECLARE @OPENQUERY VARCHAR(MAX) = CONCAT
		(
			'SELECT 
				 NOMBRECLIENTE
				,ABREVIATURANIVEL
				,ABREVIATURASUBNIVEL
				,GESTION
				,ABREVIATURACONCEPTOPAGO
				,PRIORIDAD
				,NROCUOTA
				,MESPERIODO
				,ANIOPERIODO
				,FECHAVENCIMIENTO
				,CODIGOMONEDA
				,MONTOCONCEPTO
				,MONTOMULTA
				,MONTODESCUENTO
				,MONTONETO
				,ESTADO
				,DATOSADICIONALES
			FROM nexsol.V_MDW_OBTENERPLANPAGOS 
			WHERE ESTADO = ''''A'''' AND CODIGOCLIENTE =', @CodigoCliente, ' AND GESTION= ', @Gestion
		)

		DECLARE @QUERY VARCHAR(MAX) = CONCAT
		(
			'SELECT
				 NOMBRECLIENTE
				,ABREVIATURANIVEL
				,ABREVIATURASUBNIVEL
				,GESTION
				,ABREVIATURACONCEPTOPAGO
				,PRIORIDAD
				,NROCUOTA
				,MESPERIODO
				,ANIOPERIODO
				,FECHAVENCIMIENTO
				,CODIGOMONEDA
				,MONTOCONCEPTO
				,MONTOMULTA
				,MONTODESCUENTO
				,MONTONETO
				,ESTADO
				,DATOSADICIONALES
			FROM OPENQUERY(NEXSOL,''', @OPENQUERY,''')'
		)

		INSERT INTO @tableResult
		EXEC(@QUERY)
		--INSERT INTO @tableResult
		--SELECT
		--		 'Victor Terceros' AS NOMBRECLIENTE
		--		,'SEC' AS ABREVIATURANIVEL
		--		,'PRI' AS ABREVIATURASUBNIVEL
		--		,'2020' AS GESTION
		--		,'M' AS ABREVIATURACONCEPTOPAGO
		--		,'' AS PRIORIDAD
		--		,'1' AS NROCUOTA
		--		,'1' AS MESPERIODO
		--		,'2020' AS ANIOPERIODO
		--		, FORMAT (getdate(), 'ddMMyyyy ')  AS FECHAVENCIMIENTO
		--		,'BOB' AS CODIGOMONEDA
		--		,'1500' AS MONTOCONCEPTO
		--		,'0' AS MONTOMULTA
		--		,'0' AS MONTODESCUENTO
		--		,'1500' AS MONTONETO
		--		,'A' AS ESTADO
		--		,'' AS DATOSADICIONALES

		IF NOT EXISTS(SELECT * FROM @tableResult)
			BEGIN
				SELECT
					 '1' AS CodigoRespuesta
					,'No existen datos de Planes de Pago.' AS MensajeRespuesta
				FOR XML	PATH('Result')

				RETURN;
			END
-----------------------------------------------RESULTADO FINAL-----------------------------------------------------	
														
		-- Resultado Final
		SELECT TOP 1
			 '0' AS CodigoRespuesta
			,'' AS MensajeRespuesta
			,@CodigoCliente AS Codigo
			,ISNULL(NombreCliente, '') AS NombreCliente
			,ISNULL(AbreviaturaNivel, '') AS AbreviaturaNivel
			,ISNULL(AbreviaturaSubNivel, '') AS AbreviaturaSubNivel
			,'' AS DatosAdicionales
			,(
				SELECT 
					 ISNULL(Gestion, '') AS Gestion
					,ISNULL(AbreviaturaConceptoPago, '') AS AbreviaturaConceptoPago
					,ISNULL(Prioridad, '') AS Prioridad
					,ISNULL(NroCuota, '') AS NroCuota
					,ISNULL(MesPeriodo, '') AS MesPeriodo
					,ISNULL(AnioPeriodo, '') AS AnioPeriodo
					,ISNULL(FechaVencimiento, '') AS FechaVencimiento
					,ISNULL(CodigoMoneda, '') AS CodigoMoneda
					,ISNULL(MontoConcepto,0) AS MontoConcepto
					,ISNULL(MontoMulta, 0) AS MontoMulta
					,ISNULL(MontoDescuento, 0) AS MontoDescuento
					,ISNULL(MontoNeto, 0) AS MontoNeto
					,ISNULL(Estado, 'A') AS Estado
					,'' AS DatosAdicionalesFormato
					,'' AS DatosAdicionales
				FROM  @tableResult
				FOR XML PATH('DetalleDeuda'), TYPE
			)
		FROM @tableResult
		FOR XML	PATH('Result')
		-- Fin Resultado

	END TRY
    BEGIN CATCH

		SELECT 
			'1' AS CodigoRespuesta
			,ISNULL(ERROR_MESSAGE(), '') AS MensajeRespuesta   			
		FOR XML	PATH('Result')

	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerServiciosRelacionados]    Script Date: 16/12/2021 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--SP_ObtenerServiciosRelacionados 1 ,'avc', '5645', 'demo', 'demo','Y1ISGE29IZZ2ISRN7A53QDP58E6FXF1JHBVTAH4CKBZXTAD5LEOBQQH523LPKC'
--Metodo : ObtenerServiciosRelacionados
--Descripcion : Devuelve la lista de clientes de servicios relacionados a un determinado código de la empresa


CREATE PROCEDURE [dbo].[SP_ObtenerServiciosRelacionados]
	@CodigoConvenio INTEGER
	,@Gestion VARCHAR(10)
	,@CodigoTipoBusqueda CHAR(3)
	,@CodigoCliente VARCHAR(30)
	,@Usuario VARCHAR(30)
	,@Sesion VARCHAR(300)

AS
BEGIN

	-----------------------------------------------VALIDA EL TOKEN-----------------------------------------------------	
	IF NOT EXISTS(SELECT tokenid FROM dbo.Token T WHERE T.Token = @Sesion AND GETDATE() BETWEEN T.FechaInicio AND T.FechaFin)
	BEGIN
		SELECT
			'1' AS CodigoRespuesta
			,'El token es invalido, favor verificarlo.' AS MensajeRespuesta
		FOR XML	PATH('Result')

		RETURN;
	END
	-----------------------------------------------LOG-----------------------------------------------------	
	INSERT INTO LogEvento(Usuario,Parametros,Funcion,FechaReg)
	VALUES
	(
		@Usuario,
		CONCAT(
			 '@CodigoConvenio = ', CAST(@CodigoConvenio AS VARCHAR), ', ',
			 '@Gestion = ', @Gestion, ', ',
			 '@CodigoTipoBusqueda = ', @CodigoTipoBusqueda, ', ',
			 '@CodigoCliente = ', @CodigoCliente, ', ',
			 '@Usuario = ', @Usuario, ', ',
			 '@Sesion = ', @Sesion, ' '
		),
		OBJECT_NAME(@@PROCID),
		GETDATE()
	)
	-----------------------------------------------LLAMADA ORACLE-----------------------------------------------------	
		BEGIN TRY

			DECLARE	@tableTemporal AS TABLE(CodigoTipoBusquedaRel VARCHAR(3),CodigoClienteRel VARCHAR(30),NombreClienteRel VARCHAR(60),AbreviaturaNivelRel VARCHAR(60),AbreviaturaSubnivelRel VARCHAR(60))
				
			DECLARE @OPENQUERY VARCHAR(MAX) = CONCAT
			(
				'SELECT
					CODIGOTIPOBUSQUEDA
					,CODIGOCLIENTE
					,NOMBRECLIENTE
					,ABREVIATURANIVEL
					,ABREVIATURASUBNIVEL 
				FROM nexsol.V_MDW_OBTENERLISTACLIENTES
				WHERE CODIGOCLIENTE = ''''', @CodigoCliente,''''''
			)

			DECLARE @QUERY VARCHAR(MAX) = CONCAT
			(
				'SELECT 
					CODIGOTIPOBUSQUEDA
					,CODIGOCLIENTE
					,NOMBRECLIENTE
					,ABREVIATURANIVEL
					,ABREVIATURASUBNIVEL 
				FROM OPENQUERY(NEXSOL,''', @OPENQUERY,''')'
			)

			--INSERT INTO @tableTemporal
			--EXEC(@QUERY)

			--INSERT INTO @tableTemporal
			--	SELECT 
			--		 'COD' CODIGOTIPOBUSQUEDA
			--		,@CodigoCliente CODIGOCLIENTE
			--		,'Victor' NOMBRECLIENTE
			--		,'SEC' ABREVIATURANIVEL
			--		,'PRI' ABREVIATURASUBNIVEL 
			
			IF NOT EXISTS(SELECT * FROM @tableTemporal)
			BEGIN
				SELECT
					 '1' AS CodigoRespuesta
					,'No existen datos de Servicios Relacionados.' AS MensajeRespuesta
				FOR XML	PATH('Result')

				RETURN;
			END
-----------------------------------------------RESULTADO FINAL-----------------------------------------------------	
			SELECT 
				 0 AS [CodigoRespuesta]
				,'' AS [MensajeRespuesta]
				,ISNULL(NombreClienteRel, '') AS NombreCliente
				,ISNULL(AbreviaturaNivelRel, '') AS AbreviaturaNivel
				,ISNULL(AbreviaturaSubnivelRel, '') AS AbreviaturaSubnivel
				,(
					SELECT
						ISNULL(CodigoTipoBusquedaRel, '') AS CodigoTipoBusquedaRel
						,@Gestion AS Gestion
						,ISNULL(CodigoClienteRel, '') AS CodigoClienteRel
						,ISNULL(NombreClienteRel, '') AS NombreClienteRel
						,ISNULL(AbreviaturaNivelRel, '') AS AbreviaturaNivelRel
						,ISNULL(AbreviaturaSubnivelRel, '') AS AbreviaturaSubnivelRel
						,'' AS Referencia
					FROM @tableTemporal 
					FOR XML PATH('Servicio'), ROOT('DetalleServiciosRelacionados'), TYPE
				)
			FROM @tableTemporal
			GROUP BY 					
				NombreClienteRel
				,AbreviaturaNivelRel
				,AbreviaturaSubnivelRel
			FOR XML PATH('Result')

		END TRY
		BEGIN CATCH

			SELECT
				'1' AS CodigoRespuesta
				,ISNULL(ERROR_MESSAGE(), '') AS MensajeRespuesta
			FOR XML	PATH('Result')

		END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[SP_RegistrarPago]    Script Date: 16/12/2021 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

/*

DECLARE @OPENQUERY VARCHAR(MAX) = 'SELECT * FROM nexsol.excmlog'
DECLARE @QUERY VARCHAR(MAX) = CONCAT('SELECT * FROM OPENQUERY(NEXSOL,''', @OPENQUERY, ''')')
EXEC(@QUERY)

*/
DECLARE @tblPagos TABLE(Gestion varchar(20),AbreviaturaConceptoPago varchar(20),NroCuota varchar(20),CodigoMoneda varchar(20),MontoNeto decimal(18,2),DatosAdicionalesFormato varchar(2), DatosAdicionales varchar(10))
    insert into @tblPagos
	SELECT 
	 '2020' Gestion 
	,'MEN' AbreviaturaConceptoPago 
	,'20003' NroCuota 
	,'BOB' CodigoMoneda 
	,2860 MontoNeto 
	,'1' DatosAdicionalesFormato 
	,'' DatosAdicionales
	--UNION
	--SELECT 
	-- '2020' Gestion 
	--,'MEN' AbreviaturaConceptoPago 
	--,11 NroCuota 
	--,'BOB' CodigoMoneda 
	--,2550 MontoNeto 
	--,'1' DatosAdicionalesFormato 
	--,'' DatosAdicionales

DECLARE @pagos xml  = (

SELECT
(
	SELECT * FROM @tblPagos
	FOR XML PATH('DetallePago'), TYPE
)
FOR XML	PATH('Root')
)

DECLARE @factura xml  = (

SELECT 
 '123457' NroAutorizacion
,'124' NroFactura
,'AD-EF-589' CodigoControl
,'4444444' FacturaNITCI
,'Victor Terceros' FacturaNombre
,'BOB' CodigoMoneda
,'2860' MontoFacturado
,'' DatosAdicionalesFormato
,'' DatosAdicionales
FOR XML PATH('DatosFactura')
)


EXEC dbo.SP_RegistrarPago @CodigoConvenio = '1020435022',              -- int
                          @FechaTransaccion = '2020-07-15', -- date
                          @CodigoTipoBusqueda = 'COD',         -- char(3)
                          @CodigoCliente = '5523',              -- varchar(30)
                          @FacturaNITCI = 0,                -- int
                          @FacturaNombre = '',              -- varchar(60)
                          @NroTransaccion = 2040,              -- int
                          @Usuario = 'BCP',                    -- varchar(30)
                          @Sesion = 'BCPTEST',             -- varchar(30)
                          @DetallePago = @pagos ,        -- varchar(30)
                          @DatosFactura = @factura         -- varchar(30)

						  --SELECT * FROM dbo.Usuario




*/
--Metodo : RegistrarPago
--Descripcion : Registra los pagos de un determinado cliente de la empresa

CREATE PROCEDURE [dbo].[SP_RegistrarPago]
   @CodigoConvenio VARCHAR(100)
  ,@FechaTransaccion DATE
  ,@CodigoTipoBusqueda CHAR(3)
  ,@CodigoCliente VARCHAR(30)
  ,@FacturaNITCI INT
  ,@FacturaNombre VARCHAR(60)
  ,@NroTransaccion INT
  ,@Usuario VARCHAR(30)
  ,@Sesion VARCHAR(300)  = 'I9FATQEDSBC9HNU66TS5HYKXWHE7GD6SOSM850687T3KXFKGNS3C9AGT6X0J0Q'
  ---------
  ,@DetallePago  xml
  ,@DatosFactura  xml
AS
BEGIN

-----------------------------------------------LOG-----------------------------------------------------	
INSERT INTO LogPagos(CodigoConvenio,FechaTransaccion,CodigoTipoBusqueda,CodigoCliente,FacturaNITCI
,FacturaNombre,NroTransaccion,Usuario,Sesion,DetallePago,DatosFactura)
SELECT @CodigoConvenio,@FechaTransaccion,@CodigoTipoBusqueda,@CodigoCliente,@FacturaNITCI 
  ,@FacturaNombre,@NroTransaccion,@Usuario,@Sesion,@DetallePago,@DatosFactura

-----------------------------------------------VALIDA EL CODIGO DE TIPO BUSQUEDA-----------------------------------------------------	
	IF @CodigoTipoBusqueda != 'COD' 
	BEGIN
		SELECT
			'1' AS CodigoRespuesta
			,'Solo se admite busqueda por Codigo de Alumno. Codigo Tipo Busqueda de ser COD.' AS MensajeRespuesta
		FOR XML	PATH('Result')

		RETURN;
	END
-----------------------------------------------VALIDA EL CODIGO DE CONVENIO-----------------------------------------------------		
    IF NOT EXISTS (SELECT * FROM [Usuario] WHERE Contrasenia = @Sesion )
	BEGIN
		SELECT
			'1' AS CodigoRespuesta
			,'La Sesion o el Usuario son invalidos.' AS MensajeRespuesta
		FOR XML	PATH('Result')

		RETURN;
	END
	----
	DECLARE @dbUsuario VARCHAR(30)
	DECLARE @dbCodigoConvenio VARCHAR(100)
	
	SELECT TOP 1 @dbUsuario = Usuario
	            ,@dbCodigoConvenio = CodigoConvenio
	FROM [Usuario] WHERE Contrasenia = @Sesion  
	----
	IF @dbUsuario != @Usuario 
	BEGIN
		SELECT
			'1' AS CodigoRespuesta
			,'La Sesion o el Usuario son invalidos' AS MensajeRespuesta
		FOR XML	PATH('Result')

		RETURN;
	END
	----
	IF @CodigoConvenio != @dbCodigoConvenio
	BEGIN
		SELECT
			'1' AS CodigoRespuesta
			,'El Codigo de convenio es invalido' AS MensajeRespuesta
		FOR XML	PATH('Result')

		RETURN;
	END
-----------------------------------------------LOG-----------------------------------------------------	
	INSERT INTO LogEvento
	(
		Usuario
		,Parametros
		,Funcion
		,FechaReg
	)
	VALUES
	(
		@Usuario,
		CONCAT(
			 '@CodigoConvenio = ', CAST( @CodigoConvenio AS VARCHAR), ', ',		
			 '@FechaTransaccion = ', CAST( @FechaTransaccion AS VARCHAR), ', ',	
			 '@NroTransaccion = ', CAST(@NroTransaccion AS VARCHAR), ', ',	
			 '@CodigoCliente = ', @CodigoCliente, ', ',		
			 '@FacturaNITCI = ', CAST(@FacturaNITCI AS VARCHAR), ', ',		
			 '@FacturaNombre = ', @FacturaNombre , ', ',
			 '@Usuario = ', @Usuario, ', ',		 		 
			 '@sesion = ', @sesion, ' '
		),
		OBJECT_NAME(@@PROCID),
		GETDATE()
	)
-----------------------------------------------FACTURA---------------------------------------------------------------------
   
DECLARE @NroAutorizacion varchar(100)
DECLARE @NroFactura varchar(100)
DECLARE @CodigoControl varchar(100)
DECLARE @FacturaNITCI2 varchar(100)
DECLARE @FacturaNombre2 varchar(500)
DECLARE @CodigoMoneda varchar(100)
DECLARE @MontoFacturado varchar(100)
--DECLARE @DatosAdicionalesFormato varchar(50)
--DECLARE @DatosAdicionales varchar(max)

SET @NroAutorizacion  =  @DatosFactura.value('(/DatosFactura/NroAutorizacion)[1]', 'varchar(100)' )  
SET @NroFactura   =  @DatosFactura.value('(/DatosFactura/NroFactura)[1]', 'varchar(100)' )  
SET @CodigoControl   =  @DatosFactura.value('(/DatosFactura/CodigoControl)[1]', 'varchar(100)' )  
SET @FacturaNITCI2   =  @DatosFactura.value('(/DatosFactura/FacturaNITCI)[1]', 'varchar(100)' )  
SET @FacturaNombre2   =  @DatosFactura.value('(/DatosFactura/FacturaNombre)[1]', 'varchar(500)' )  
SET @CodigoMoneda   =  @DatosFactura.value('(/DatosFactura/CodigoMoneda)[1]', 'varchar(100)' )  
SET @MontoFacturado   =  @DatosFactura.value('(/DatosFactura/MontoFacturado)[1]', 'varchar(100)' )  
--SET @DatosAdicionalesFormato  =  @DatosFactura.value('(/DatosFactura/DatosAdicionalesFormato)[1]', 'varchar(100)' )  
--SET @DatosAdicionales   =  @DatosFactura.value('(/DatosFactura/DatosAdicionales)[1]', 'varchar(max)' )  

BEGIN TRY
-----------------------------------------------PAGO---------------------------------------------------------------------
DECLARE @Gestion varchar(20)
DECLARE @AbreviaturaConceptoPago varchar(20)
DECLARE @NroCuota varchar(20)
--DECLARE @CodigoMoneda varchar(20)
DECLARE @MontoNeto decimal(18,2)
DECLARE @DatosAdicionalesFormato varchar(2)
DECLARE @DatosAdicionales varchar(10)




DECLARE @tblPagoList TABLE(Pago xml, ID UNIQUEIDENTIFIER)
INSERT INTO @tblPagoList
SELECT T.c.query('.') AS result, NEWID()  
FROM   @DetallePago.nodes('/Root/DetallePago') T(c)  

DECLARE @Pago XML
DECLARE @ID UNIQUEIDENTIFIER
WHILE (SELECT COUNT(*) from @tblPagoList) > 0
BEGIN
	SELECT TOP 1 @ID = ID, @Pago = Pago From @tblPagoList 

	DELETE FROM @tblPagoList WHERE ID = @ID
	
	SET @Gestion =  @Pago.value('(/DetallePago/Gestion)[1]', 'varchar(100)' )  
	SET @AbreviaturaConceptoPago =  @Pago.value('(/DetallePago/AbreviaturaConceptoPago)[1]', 'varchar(100)' )  
	SET @NroCuota =  @Pago.value('(/DetallePago/NroCuota)[1]', 'varchar(100)' )  
	SET @MontoNeto =  @Pago.value('(/DetallePago/MontoNeto)[1]', 'decimal(18,2)' )  
	SET @DatosAdicionalesFormato =  @Pago.value('(/DetallePago/DatosAdicionalesFormato)[1]', 'varchar(100)' )  
	SET @DatosAdicionales = @Pago.value('(/DetallePago/@DatosAdicionales )[1]', 'varchar(100)' )  


	-----------------------------------------------LLAMADA ORACLE-----------------------------------------------------	
		
		DECLARE	@tableResult AS TABLE(NroTran VARCHAR(1000), NumOpe varchar(500), CodigoRespuesta VARCHAR(100),MensajeRespuesta VARCHAR(2000), Fecha DATETIME)
		DECLARE @FechaFormateada VARCHAR(20) = (SELECT CONVERT(varchar(10), CAST(@FechaTransaccion as date), 103) )
		
		EXEC
			(
				'BEGIN nexsol.pkg_ing_mdw.p_RegistrarPago
				(
					 ?
					,?
					,?
					,?
					,?
					,?
					,?
					,?
					,?
					,?
					,?
					,?
					,?
					,?
					,?
					,?
					,?
					,?
					,?
				);
				END;'
				,@FechaFormateada
				,@CodigoTipoBusqueda
				,@CodigoCliente
				,@FacturaNITCI2
				,@FacturaNombre2
				,@NroTransaccion
				,@Usuario
				,@AbreviaturaConceptoPago
				,@NroCuota
				,@MontoNeto
				,@DatosAdicionales
				,@NroAutorizacion
				,@NroFactura
				,@CodigoControl
				,@FacturaNITCI2
				,@FacturaNombre2
				,@CodigoMoneda
				,@MontoFacturado
				,@CodigoConvenio
			) AT NEXSOL

			
END 
-----------------------------------------------VERIFICAR SI HUBO ERROR-----------------------------------------------------	
			DECLARE @OPENQUERY VARCHAR(MAX) = CONCAT('SELECT * FROM nexsol.excmlog WHERE INGNRODOC = ', @NroTransaccion)	
			DECLARE @QUERY VARCHAR(MAX) = CONCAT('SELECT INGNRODOC, EXCNUMOPE, CODERROR, MENSAJE, EXCFEMOVI FROM OPENQUERY(NEXSOL,''', @OPENQUERY, ''')')
			INSERT INTO @tableResult
			EXEC(@QUERY)

			IF EXISTS(SELECT * FROM @tableResult WHERE ISNULL(MensajeRespuesta,'') != '')
			BEGIN
				SELECT TOP 1
					 '1' AS CodigoRespuesta
					,CONCAT('[Transaccion=',ISNULL(NroTran,''),'] ','[ID=',ISNULL(NumOpe,''),'] ', ISNULL(MensajeRespuesta,''), ' (' , ISNULL(Fecha,GETDATE()), ')') AS MensajeRespuesta
				 FROM @tableResult
				 ORDER BY Fecha DESC
				FOR XML	PATH('Result')

				RETURN;
			END
-----------------------------------------------RESULTADO FINAL-----------------------------------------------------	
			SELECT
				 '0' AS CodigoRespuesta
				,'' AS MensajeRespuesta
				,ISNULL(@NroTransaccion, '') AS NroTransaccion
				,(
					SELECT
						 ISNULL(@NroAutorizacion, '') AS NroAutorizacion
						,ISNULL(@NroFactura, '') AS NroFactura
						,ISNULL(@CodigoControl, '') AS CodigoControl
						,ISNULL(@FacturaNITCI2, '0') AS FacturaNITCI
						,ISNULL(@FacturaNombre2, '') AS FacturaNombre
						,ISNULL(@CodigoMoneda, '') AS CodigoMoneda
						,ISNULL(@MontoFacturado, '') AS MontoFacturado
						,'' AS DatosAdicionalesFormato
						,'' AS DatosAdicionales
					FOR XML PATH('DatosFacturaEmpresa'), TYPE
				)
			FOR XML	PATH('Result')

		END TRY
		BEGIN CATCH

			SELECT
				'1' AS CodigoRespuesta
				,ISNULL(ERROR_MESSAGE(), 'ERROR') AS MensajeRespuesta   			
			FOR XML	PATH('Result')

		END CATCH

END

GO
/****** Object:  StoredProcedure [dbo].[SP_RevertirPago]    Script Date: 16/12/2021 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
EXEC dbo.SP_RevertirPago 1,'01/01/2010',1,'demo','50QPHHENKNDXYK1UQRXY192ZE9YMPYKHB994G78P9RIYVVK75JBQK5HHNZMOOX'

*/

--Metodo : RevertirPago
--Descripcion : Permite anular una transacción de pago y la factura si corresponde, en la misma fecha del pago

CREATE PROCEDURE [dbo].[SP_RevertirPago]
	 @CodigoConvenio VARCHAR(100)='1020435022'
	,@FechaTransaccion DATE = '2020-07-15'
	,@NroTransaccion INT = 2037 
	,@Usuario VARCHAR(30) = 'BCP'
	,@Sesion VARCHAR(300) = 'I9FATQEDSBC9HNU66TS5HYKXWHE7GD6SOSM850687T3KXFKGNS3C9AGT6X0J0Q'

AS
BEGIN

	-----------------------------------------------VALIDA EL CODIGO DE CONVENIO-----------------------------------------------------		
    IF NOT EXISTS (SELECT * FROM [Usuario] WHERE Contrasenia = @Sesion )
	BEGIN
		SELECT
			'1' AS CodigoRespuesta
			,'La Sesion o el Usuario son invalidos.' AS MensajeRespuesta
		FOR XML	PATH('Result')

		RETURN;
	END
	----
	DECLARE @dbUsuario VARCHAR(30)
	DECLARE @dbCodigoConvenio VARCHAR(100)
	
	SELECT TOP 1 @dbUsuario = Usuario
	            ,@dbCodigoConvenio = CodigoConvenio
	FROM [Usuario] WHERE Contrasenia = @Sesion  
	----
	IF @dbUsuario != @Usuario 
	BEGIN
		SELECT
			'1' AS CodigoRespuesta
			,'La Sesion o el Usuario son invalidos' AS MensajeRespuesta
		FOR XML	PATH('Result')

		RETURN;
	END
	----
	IF @CodigoConvenio != @dbCodigoConvenio
	BEGIN
		SELECT
			'1' AS CodigoRespuesta
			,'El Codigo de convenio es invalido' AS MensajeRespuesta
		FOR XML	PATH('Result')

		RETURN;
	END
	-----------------------------------------------LOG-----------------------------------------------------	
	INSERT INTO LogEvento
	(
		Usuario
		,Parametros
		,Funcion
		,FechaReg
	)
	VALUES
	(
		@Usuario,
		CONCAT(
			 '@CodigoConvenio = ', CAST(@CodigoConvenio AS VARCHAR), ', ',
			 '@FechaTransaccion = ', CAST(@FechaTransaccion AS VARCHAR), ', ',
			 '@NroTransaccion = ', CAST(@NroTransaccion AS VARCHAR), ', ',
			 '@Usuario = ', @Usuario, ', ',
			 '@Sesion = ', @Sesion, ', '		 
		),
		OBJECT_NAME(@@PROCID),
		GETDATE()
	)

	-----------------------------------------------LLAMADA ORACLE-----------------------------------------------------		

	DECLARE	@tableResult AS TABLE(NroTran VARCHAR(1000), NumOpe varchar(500), CodigoRespuesta VARCHAR(100),MensajeRespuesta VARCHAR(2000), Fecha DATETIME)
	DECLARE @FechaFormateada VARCHAR(20) = (SELECT CONVERT(varchar(10), CAST(@FechaTransaccion as date), 103) )
		BEGIN TRY

			EXEC
			(
				'BEGIN nexsol.pkg_ing_mdw.p_RevertirPago
				(
					?
					,?
					,?
					,?
				);
				END;'
				,@FechaFormateada
				,@NroTransaccion
				,@Usuario
				,@CodigoConvenio
			) AT NEXSOL				
			
			DECLARE @OPENQUERY VARCHAR(MAX) = CONCAT('SELECT * FROM nexsol.excmlog WHERE INGNRODOC = ', @NroTransaccion)	
			DECLARE @QUERY VARCHAR(MAX) = CONCAT('SELECT INGNRODOC, EXCNUMOPE, CODERROR, MENSAJE, EXCFEMOVI FROM OPENQUERY(NEXSOL,''', @OPENQUERY, ''')')
			INSERT INTO @tableResult
			EXEC(@QUERY)


			IF EXISTS(SELECT * FROM @tableResult WHERE ISNULL(MensajeRespuesta,'') != '' AND Fecha >= DATEADD(MI,-1, GETDATE()))
			BEGIN
				SELECT TOP 1
					 '1' AS CodigoRespuesta
					,CONCAT('[Transaccion=',ISNULL(NroTran,''),'] ','[ID=',ISNULL(NumOpe,''),'] ', ISNULL(MensajeRespuesta,''), ' (' , ISNULL(Fecha,GETDATE()), ')') AS MensajeRespuesta
				 FROM @tableResult
				 ORDER BY FECHA DESC
				FOR XML	PATH('Result')

				RETURN;
			END

-----------------------------------------------RESULTADO FINAL-----------------------------------------------------	
			SELECT 
				 '0' AS CodigoRespuesta
				,'' AS MensajeRespuesta    
			FOR XML	PATH('Result')

		END TRY
		BEGIN CATCH
	
			SELECT 
				 '1' AS CodigoRespuesta
				,ISNULL(ERROR_MESSAGE(), 'ERROR') AS MensajeRespuesta   			
			FOR XML	PATH('Result')

		END CATCH


END
GO
/****** Object:  StoredProcedure [dbo].[SP_VerificarConectividad]    Script Date: 16/12/2021 15:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Metodo :  VErificar Conectividad
-- Descripcionn : Verifica usuario y contrasena
-- SP_VerificarConectividad 'Test', 'demo', 'KWDKRVJT9PEOAIWEF25TL02EMBT6M1XFFKMF1O1VCV0SFPNIOX764DTK2VH3TO'
CREATE PROCEDURE [dbo].[SP_VerificarConectividad]	
	@Usuario VARCHAR(30)
	,@UsuarioConexion VARCHAR(30)
	,@ContraseniaConexion VARCHAR(200)

AS
BEGIN

DECLARE @CodigoRespuesta VARCHAR(10)
DECLARE @MensajeRespuesta VARCHAR(200)
SET @CodigoRespuesta = '0';

IF EXISTS(SELECT UsuarioId FROM dbo.Usuario WHERE Usuario = @UsuarioConexion AND Contrasenia = @ContraseniaConexion AND Activo = 1)
BEGIN	

	BEGIN TRY
		
		DECLARE @pToken VARCHAR(128)
		SET @pToken  = (SELECT dbo.fnCustomPass(128,'CN'))
		
		INSERT INTO dbo.Token
		(
			UsuarioId
			,Token
			,FechaInicio
			,FechaFin
		)
		VALUES
		(
			(SELECT UsuarioId FROM dbo.Usuario WHERE Usuario = @UsuarioConexion)         -- UsuarioId - int
			,@pToken        -- Token - varchar(128)
			,GETDATE() -- FechaInicio - datetime
			,DATEADD(hh, 12, GETDATE())  -- FechaFin - datetime
		)
			
		SELECT
			0 AS [CodigoRespuesta]
			,'' AS [MensajeRespuesta]
			,ISNULL(@pToken, '') AS [Sesion]
		FOR XML PATH('Result')

	END TRY
	BEGIN CATCH

		SET @CodigoRespuesta = '1';
		SET @MensajeRespuesta = ISNULL(ERROR_MESSAGE(), '')
	
		SELECT
			@CodigoRespuesta AS CodigoRespuesta
			,@MensajeRespuesta AS MensajeRespuesta
			,'' AS [Sesion]  			
		FOR XML	PATH('Result')

	END CATCH		

END
ELSE	
BEGIN	

	SET @CodigoRespuesta = '1';
	SET @MensajeRespuesta = 'El usuario/Contraseña son invalidos, favor verificarlo.'

	SELECT 
		@CodigoRespuesta AS [CodigoRespuesta]
		,@MensajeRespuesta AS [MensajeRespuesta]
		,'' AS [Sesion]
	FOR XML PATH('Result')

END	
END	



GO
