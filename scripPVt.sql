USE [master]
GO
/****** Object:  Database [dbPaseVersion]    Script Date: 15/4/2024 16:02:52 ******/
CREATE DATABASE [dbPaseVersion]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbPaseVersion', FILENAME = N'E:\SQLDATA\dbPaseVersion.mdf' , SIZE = 33285888KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'dbPaseVersion_log', FILENAME = N'E:\SQLDATA\dbPaseVersion_log.LDF' , SIZE = 1008000KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
GO
ALTER DATABASE [dbPaseVersion] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbPaseVersion].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [dbPaseVersion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbPaseVersion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbPaseVersion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbPaseVersion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbPaseVersion] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbPaseVersion] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbPaseVersion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbPaseVersion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbPaseVersion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbPaseVersion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbPaseVersion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbPaseVersion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbPaseVersion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbPaseVersion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbPaseVersion] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbPaseVersion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbPaseVersion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbPaseVersion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbPaseVersion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbPaseVersion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbPaseVersion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbPaseVersion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbPaseVersion] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbPaseVersion] SET  MULTI_USER 
GO
ALTER DATABASE [dbPaseVersion] SET PAGE_VERIFY TORN_PAGE_DETECTION  
GO
ALTER DATABASE [dbPaseVersion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbPaseVersion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbPaseVersion] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [dbPaseVersion] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbPaseVersion] SET QUERY_STORE = OFF
GO
USE [dbPaseVersion]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [dbPaseVersion]
GO
/****** Object:  User [pypas_vrs_usdb]    Script Date: 15/4/2024 16:02:53 ******/
CREATE USER [pypas_vrs_usdb] FOR LOGIN [pypas_vrs_usdb] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [paseVersion]    Script Date: 15/4/2024 16:02:53 ******/
CREATE USER [paseVersion] FOR LOGIN [paseVersion] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [FAVORITA_FRUIT\syanez]    Script Date: 15/4/2024 16:02:53 ******/
CREATE USER [FAVORITA_FRUIT\syanez] FOR LOGIN [FAVORITA_FRUIT\syanez] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [FAVORITA_FRUIT\Sistemas Desarrollo]    Script Date: 15/4/2024 16:02:53 ******/
CREATE USER [FAVORITA_FRUIT\Sistemas Desarrollo] FOR LOGIN [FAVORITA_FRUIT\Sistemas Desarrollo]
GO
/****** Object:  User [FAVORITA_FRUIT\GRSeguInfo_Operaciones]    Script Date: 15/4/2024 16:02:53 ******/
CREATE USER [FAVORITA_FRUIT\GRSeguInfo_Operaciones] FOR LOGIN [FAVORITA_FRUIT\GRSeguInfo_Operaciones]
GO
/****** Object:  User [FAVORITA_FRUIT\GRSeguInfo_Ingenieria]    Script Date: 15/4/2024 16:02:53 ******/
CREATE USER [FAVORITA_FRUIT\GRSeguInfo_Ingenieria] FOR LOGIN [FAVORITA_FRUIT\GRSeguInfo_Ingenieria]
GO
/****** Object:  User [FAVORITA_FRUIT\GRSeguInfo_Cumplimiento]    Script Date: 15/4/2024 16:02:53 ******/
CREATE USER [FAVORITA_FRUIT\GRSeguInfo_Cumplimiento] FOR LOGIN [FAVORITA_FRUIT\GRSeguInfo_Cumplimiento]
GO
ALTER ROLE [db_owner] ADD MEMBER [pypas_vrs_usdb]
GO
ALTER ROLE [db_owner] ADD MEMBER [paseVersion]
GO
ALTER ROLE [db_datareader] ADD MEMBER [FAVORITA_FRUIT\syanez]
GO
ALTER ROLE [db_owner] ADD MEMBER [FAVORITA_FRUIT\Sistemas Desarrollo]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [FAVORITA_FRUIT\GRSeguInfo_Operaciones]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [FAVORITA_FRUIT\GRSeguInfo_Ingenieria]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [FAVORITA_FRUIT\GRSeguInfo_Cumplimiento]
GO
/****** Object:  UserDefinedDataType [dbo].[codigo]    Script Date: 15/4/2024 16:02:53 ******/
CREATE TYPE [dbo].[codigo] FROM [varchar](15) NULL
GO
/****** Object:  Table [dbo].[PARAMETRO]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PARAMETRO](
	[parSecuencia] [int] IDENTITY(1,1) NOT NULL,
	[parTipo] [char](3) NOT NULL,
	[parDescripcion] [varchar](50) NOT NULL,
	[parEstado] [bit] NOT NULL,
 CONSTRAINT [pk_PARAMETRO] PRIMARY KEY CLUSTERED 
(
	[parSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CABPASEVERSION]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CABPASEVERSION](
	[capSecuencia] [int] IDENTITY(1,1) NOT NULL,
	[capCodigo] [varchar](14) NULL,
	[capFechaReg] [smalldatetime] NOT NULL,
	[capFechaImp] [smalldatetime] NULL,
	[plaSecuencia] [int] NOT NULL,
	[capPrioridad] [int] NOT NULL,
	[capMotivoPase] [int] NOT NULL,
	[capAreaSolicitante] [varchar](100) NULL,
	[capObservacion] [varchar](1000) NULL,
	[capImplementador] [int] NULL,
	[capReqImpPV] [varchar](2000) NULL,
	[capUsuario] [int] NOT NULL,
	[tecSecuencia] [int] NOT NULL,
	[capLocalidad] [int] NOT NULL,
	[capNomPrj] [varchar](150) NULL,
	[capImpSec] [varchar](15) NULL,
	[capSerDesarrollo] [int] NULL,
	[capSerProduccion] [int] NULL,
	[capFecPrnPV] [smalldatetime] NULL,
	[capFecImpEst] [smalldatetime] NULL,
	[capObsImplementador] [varchar](300) NULL,
	[capTipoPase] [int] NULL,
	[capUsuarioSolicitante] [varchar](100) NULL,
	[capAutUpdate] [bit] NULL,
	[capAutPVDesa] [int] NULL,
	[capAutPVCC] [int] NULL,
	[capFecAutPVCC] [smalldatetime] NULL,
	[capFecAutPVDesa] [smalldatetime] NULL,
	[capFecRegCC] [smalldatetime] NULL,
	[capEstado] [nvarchar](3) NOT NULL,
 CONSTRAINT [pk_CABPASEVERSION] PRIMARY KEY CLUSTERED 
(
	[capSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ANEXOPASVER]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ANEXOPASVER](
	[capSecuencia] [int] NOT NULL,
	[apvObjetos] [image] NULL,
	[apvAutPase] [image] NULL,
	[apvRutaObjetos] [varchar](300) NULL,
	[apvRutaAutPase] [varchar](300) NULL,
 CONSTRAINT [pk_ANEXOPASVER] PRIMARY KEY CLUSTERED 
(
	[capSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TECNICO]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TECNICO](
	[tecSecuencia] [int] IDENTITY(1,1) NOT NULL,
	[tecTipDesImp] [char](1) NOT NULL,
	[tecCodigo] [char](4) NOT NULL,
	[tecNombre] [varchar](60) NOT NULL,
	[tecNumPases] [int] NOT NULL,
	[tecEstado] [bit] NOT NULL,
	[tecPassword] [varchar](50) NULL,
	[tecNPAlterno] [int] NULL,
 CONSTRAINT [pk_TECNICO] PRIMARY KEY CLUSTERED 
(
	[tecSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PLATAFORMA]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PLATAFORMA](
	[plaSecuencia] [int] IDENTITY(1,1) NOT NULL,
	[plaDescripcion] [varchar](100) NOT NULL,
	[plaEstado] [bit] NOT NULL,
	[plaUsuario] [int] NOT NULL,
	[plaFecha] [smalldatetime] NOT NULL,
 CONSTRAINT [pkPLATAFORMA] PRIMARY KEY CLUSTERED 
(
	[plaSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_CAPPASEVERSION]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*select convert (char(10), capFecPrnPV ,120),capFecPrnPV from vw_CAPPASEVERSION*/
CREATE VIEW [dbo].[vw_CAPPASEVERSION]
AS
SELECT        cab.capSecuencia, cab.capCodigo, cab.capAreaSolicitante, REPLACE(REPLACE(REPLACE(cab.capObservacion, CHAR(10) + CHAR(13), ' '), CHAR(10), ' '), CHAR(13), ' ') AS capObservacion, cab.capNomPrj, 
                         cab.capUsuarioSolicitante,
                             (SELECT        parDescripcion
                               FROM            dbo.PARAMETRO
                               WHERE        (parSecuencia = cab.capPrioridad)) AS capPrioridad,
                             (SELECT        parDescripcion
                               FROM            dbo.PARAMETRO AS PARAMETRO_4
                               WHERE        (parSecuencia = cab.capMotivoPase)) AS capMotivoPase,
                             (SELECT        parDescripcion
                               FROM            dbo.PARAMETRO AS PARAMETRO_3
                               WHERE        (parSecuencia = cab.capLocalidad)) AS capLocalidad,
                             (SELECT        tecNombre
                               FROM            dbo.TECNICO
                               WHERE        (tecSecuencia = cab.capImplementador)) AS capImplementador,
                             (SELECT        tecNombre
                               FROM            dbo.TECNICO AS TECNICO_3
                               WHERE        (tecSecuencia = cab.tecSecuencia)) AS capDesarrollador,
                             (SELECT        parDescripcion
                               FROM            dbo.PARAMETRO AS PARAMETRO_2
                               WHERE        (parSecuencia = cab.capSerDesarrollo)) AS capSerDesarrollo,
                             (SELECT        parDescripcion
                               FROM            dbo.PARAMETRO AS PARAMETRO_1
                               WHERE        (parSecuencia = cab.capSerProduccion)) AS capSerProduccion, cab.capImpSec,
                             (SELECT        tecNombre
                               FROM            dbo.TECNICO AS TECNICO_2
                               WHERE        (tecSecuencia = cab.capAutPVCC)) AS capAutPVCC,
                             (SELECT        tecNombre
                               FROM            dbo.TECNICO AS TECNICO_1
                               WHERE        (tecSecuencia = cab.capAutPVDesa)) AS capAutPVDesa, pla.plaDescripcion, DATEPART(ww, cab.capFecPrnPV) AS capSemana, DATEPART(yy, cab.capFecPrnPV) AS capAnno, DATEPART(mm, 
                         cab.capFecPrnPV) AS capMes, DATEPART(dd, cab.capFecPrnPV) AS capDia, CONVERT(char(8), cab.capFecPrnPV, 108) AS capHoraReg, cab.tecSecuencia, cab.capImplementador AS cImplementador, 
                         cab.capFecPrnPV, cab.capFechaImp, cab.capFechaReg, REPLACE(REPLACE(REPLACE(cab.capReqImpPV, CHAR(10) + CHAR(13), ' '), CHAR(10), ' '), CHAR(13), ' ') AS capReqImpPV, RTRIM(cab.capAreaSolicitante) 
                         + ' / ' + cab.capUsuarioSolicitante AS capAerUsuSol, cab.capFecAutPVCC, cab.capFecAutPVDesa, cab.capTipoPase,
                             (SELECT        apvRutaObjetos
                               FROM            dbo.ANEXOPASVER
                               WHERE        (capSecuencia = cab.capSecuencia)) AS apvRutaObjetos, cab.capFecImpEst, 'Fecha de Implementación Solicitada: ' + CONVERT(char(10), cab.capFecImpEst, 103) AS FechaImplemeta, 
                         cab.capFecRegCC
FROM            dbo.CABPASEVERSION AS cab INNER JOIN
                         dbo.PLATAFORMA AS pla ON cab.plaSecuencia = pla.plaSecuencia
GO
/****** Object:  Table [dbo].[VERSION]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VERSION](
	[verSecuencia] [int] IDENTITY(1,1) NOT NULL,
	[objSecuencia] [int] NOT NULL,
	[verCodigo] [dbo].[codigo] NOT NULL,
	[verDescripcion] [varchar](200) NULL,
	[verUsuario] [int] NOT NULL,
	[verFecha] [smalldatetime] NOT NULL,
	[verEstado] [bit] NOT NULL,
	[verFuncion] [varchar](8000) NULL,
 CONSTRAINT [pk_VERSION] PRIMARY KEY CLUSTERED 
(
	[verSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OBJETO]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OBJETO](
	[objSecuencia] [int] IDENTITY(1,1) NOT NULL,
	[modSecuencia] [int] NOT NULL,
	[objCodigo] [dbo].[codigo] NOT NULL,
	[objDescripcion] [varchar](200) NULL,
	[objUsuario] [int] NOT NULL,
	[objFecha] [smalldatetime] NOT NULL,
	[objEstado] [bit] NOT NULL,
	[objFuncion] [varchar](2000) NULL,
	[objRefMenu] [varchar](150) NULL,
	[objTypeObj] [int] NULL,
 CONSTRAINT [pk_OBJETO] PRIMARY KEY CLUSTERED 
(
	[objSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETPASEVERSION]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETPASEVERSION](
	[detIndex] [int] NOT NULL,
	[capSecuencia] [int] NOT NULL,
	[depTipoObjVer] [char](1) NOT NULL,
	[depCodObjVer] [int] NOT NULL,
	[depDesCambio] [varchar](500) NULL,
	[depJusCambio] [varchar](200) NULL,
	[depOrigen] [varchar](150) NULL,
	[depDestino] [varchar](150) NULL,
	[depCodProv] [int] NULL,
	[depDevInt] [int] NULL,
 CONSTRAINT [pk_DETPASEVERSION] PRIMARY KEY CLUSTERED 
(
	[detIndex] ASC,
	[capSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APLICACION]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APLICACION](
	[appSecuencia] [int] IDENTITY(1,1) NOT NULL,
	[appDecripcion] [varchar](100) NOT NULL,
	[appUsuario] [int] NOT NULL,
	[appFecha] [smalldatetime] NOT NULL,
	[appEstado] [bit] NOT NULL,
 CONSTRAINT [pk_APLICACIOn] PRIMARY KEY CLUSTERED 
(
	[appSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MODULO]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MODULO](
	[modSecuencia] [int] IDENTITY(1,1) NOT NULL,
	[appSecuencia] [int] NOT NULL,
	[modCodigo] [dbo].[codigo] NOT NULL,
	[modDescripcion] [varchar](100) NOT NULL,
	[modUsuario] [int] NOT NULL,
	[modFecha] [smalldatetime] NOT NULL,
	[modEstado] [bit] NOT NULL,
	[modAbreviado] [varchar](6) NULL,
 CONSTRAINT [pk_MOdulo] PRIMARY KEY CLUSTERED 
(
	[modSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_DETPASEVERSION]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









CREATE         view [dbo].[vw_DETPASEVERSION] AS 


select 
 capSecuencia,detIndex,depDesCambio,depJusCambio
-- ,substring(depOrigen,1,50)+CHAR(13)+substring(depOrigen,51,100)+char(13)+substring(depOrigen,101,150) as  depOrigen
,depOrigen


 ,depDestino
 ,rtrim(objCodigo)+'|'+verCodigo as verCodigo
 ,verDescripcion 
-- ,rtrim(modDescripcion)+' / '+(select appDecripcion from aplicacion where appSecuencia=modulo.appSecuencia) as depModApp
 ,appDecripcion as depModApp
 ,depTipoObjVer
 ,version.verSecuencia as depKeyObjVer
 ,modulo.modAbreviado as modCodigo
 ,objTypeObj
 ,version.verSecuencia
 ,objeto.objSecuencia
 ,aplicacion.appSecuencia
 ,modulo.modSecuencia
 ,APLICACION.appDecripcion
from detpaseversion,objeto,version,modulo,aplicacion
where depTipoObjVer='V' 
		and version.verSecuencia=depCodObjVer 
		and version.objSecuencia=objeto.objSecuencia 
		and objeto.modSecuencia=modulo.modSecuencia
		and aplicacion.appSecuencia=modulo.appSecuencia
union
select 
 capSecuencia,detIndex,depDesCambio,depJusCambio,depOrigen,depDestino
 ,objCodigo as verCodigo
 ,objDescripcion as verDescripcion 
-- ,rtrim(modDescripcion)+' / '+(select appDecripcion from aplicacion where appSecuencia=modulo.appSecuencia) as depModApp
 ,appDecripcion as depModApp
 ,depTipoObjVer
 ,objeto.objSecuencia as depKeyObjVer
 ,modulo.modAbreviado as modCodigo
 ,objTypeObj
 ,verSecuencia=null
 ,objeto.objSecuencia
 ,aplicacion.appSecuencia
 ,modulo.modSecuencia
 ,APLICACION.appDecripcion
from detpaseversion,objeto,modulo,aplicacion
where depTipoObjVer='O' 
		and objeto.objSecuencia = depCodObjVer 
		and objeto.modSecuencia = modulo.modSecuencia
		and aplicacion.appSecuencia=modulo.appSecuencia











GO
/****** Object:  Table [dbo].[EsusObjetos]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EsusObjetos](
	[OBJETOS] [nvarchar](255) NULL,
	[NOMBRE DEL OBJETO] [nvarchar](255) NULL,
	[MÓDULO] [float] NULL,
	[NOMBRE DEL MÓDULO] [nvarchar](255) NULL,
	[ESSU] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListaESU]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListaESU](
	[OBJETOS] [nvarchar](255) NULL,
	[MÓDULO] [nvarchar](255) NULL,
	[Area] [nvarchar](255) NULL,
	[ESU] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SEGNIVEL]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SEGNIVEL](
	[NIVEL1] [int] NOT NULL,
	[NIVEL2] [int] NOT NULL,
	[NIVEL3] [int] NOT NULL,
	[NIVEL4] [int] NOT NULL,
	[DESCRIPCION] [nvarchar](100) NOT NULL,
	[NOM_MENU] [nvarchar](100) NOT NULL,
	[NUMERO] [int] NULL,
	[UBICACION] [int] NULL,
 CONSTRAINT [pk_SEGNIVEL00] PRIMARY KEY CLUSTERED 
(
	[NIVEL1] ASC,
	[NIVEL2] ASC,
	[NIVEL3] ASC,
	[NIVEL4] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SEGNIVUSER]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SEGNIVUSER](
	[usuSecuencia] [int] NOT NULL,
	[NIV_NIVEL1] [int] NOT NULL,
	[NIV_NIVEL2] [int] NOT NULL,
	[NIV_NIVEL3] [int] NOT NULL,
	[NIV_NIVEL4] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t1]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t1](
	[a] [int] NOT NULL,
	[b] [int] NULL,
 CONSTRAINT [PK__t1__4081A9AE] PRIMARY KEY CLUSTERED 
(
	[a] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_MODULO01]    Script Date: 15/4/2024 16:02:53 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ix_MODULO01] ON [dbo].[MODULO]
(
	[modCodigo] ASC,
	[appSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_OBJETO01]    Script Date: 15/4/2024 16:02:53 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ix_OBJETO01] ON [dbo].[OBJETO]
(
	[objCodigo] ASC,
	[modSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_TECNICO01]    Script Date: 15/4/2024 16:02:53 ******/
CREATE NONCLUSTERED INDEX [ix_TECNICO01] ON [dbo].[TECNICO]
(
	[tecCodigo] ASC,
	[tecTipDesImp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_VERSION01]    Script Date: 15/4/2024 16:02:53 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ix_VERSION01] ON [dbo].[VERSION]
(
	[verCodigo] ASC,
	[objSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CABPASEVERSION] ADD  CONSTRAINT [DF_CABPASEVERSION_capEstado]  DEFAULT (N'REG') FOR [capEstado]
GO
ALTER TABLE [dbo].[ANEXOPASVER]  WITH NOCHECK ADD  CONSTRAINT [fk_ANEXOPASVER01] FOREIGN KEY([capSecuencia])
REFERENCES [dbo].[CABPASEVERSION] ([capSecuencia])
GO
ALTER TABLE [dbo].[ANEXOPASVER] CHECK CONSTRAINT [fk_ANEXOPASVER01]
GO
ALTER TABLE [dbo].[DETPASEVERSION]  WITH NOCHECK ADD  CONSTRAINT [fk_DETPASEVERSION01] FOREIGN KEY([capSecuencia])
REFERENCES [dbo].[CABPASEVERSION] ([capSecuencia])
GO
ALTER TABLE [dbo].[DETPASEVERSION] CHECK CONSTRAINT [fk_DETPASEVERSION01]
GO
ALTER TABLE [dbo].[MODULO]  WITH NOCHECK ADD  CONSTRAINT [fk_MODULO01] FOREIGN KEY([appSecuencia])
REFERENCES [dbo].[APLICACION] ([appSecuencia])
GO
ALTER TABLE [dbo].[MODULO] CHECK CONSTRAINT [fk_MODULO01]
GO
ALTER TABLE [dbo].[OBJETO]  WITH NOCHECK ADD  CONSTRAINT [fk_OBJETO01] FOREIGN KEY([modSecuencia])
REFERENCES [dbo].[MODULO] ([modSecuencia])
GO
ALTER TABLE [dbo].[OBJETO] CHECK CONSTRAINT [fk_OBJETO01]
GO
ALTER TABLE [dbo].[VERSION]  WITH NOCHECK ADD  CONSTRAINT [fk_VERSION01] FOREIGN KEY([objSecuencia])
REFERENCES [dbo].[OBJETO] ([objSecuencia])
GO
ALTER TABLE [dbo].[VERSION] CHECK CONSTRAINT [fk_VERSION01]
GO
/****** Object:  StoredProcedure [dbo].[sp_AUTCCPASEVERSION]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    procedure [dbo].[sp_AUTCCPASEVERSION]
@_capSecuencia			int,						--pk del registro
@_capImpSec				varchar(15) output,	--Código del Implementador seleccionado
@_capImplementador	int,
@_capAutPVCC			int
as
begin
--Variables locales al procedimiento
declare @Semana 			int
declare @Anno 				int
declare @_tecCodigo		varchar(4) 

select @Semana=datepart(ww,getdate())		--Obtengo el número de la semana vigente
select @Anno=datepart(yy,getdate())			--Obtengo el año vigente

	--Obtengo el parte del código para el implementador
	   select @_capImpSec='SEM'+   right('000'+cast(@Semana as varchar),3)+'-'+right('000'+cast(count(capSecuencia)+1 as varchar),3)
		from CABPASEVERSION where datepart(yy,capFecAutPVCC)=@Anno and datepart(ww,capFecAutPVCC)=@Semana
	
	--Obtengo el código del Implementador
		select @_tecCodigo=tecCodigo from tecnico where tecSecuencia=@_capImplementador
		set @_capImpSec=rtrim(@_tecCodigo)+'-'+@_capImpSec

	update CABPASEVERSION set 
		capImplementador=@_capImplementador,
		capImpSec=@_capImpSec,
		capAutPVCC=@_capAutPVCC,
		capFecAutPVCC=getdate()
	where capSecuencia=@_capSecuencia
end

















GO
/****** Object:  StoredProcedure [dbo].[sp_ExecQuery]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_ExecQuery] (@sStrQuery nvarchar(1000)) as
EXEC sp_executesql @sStrQuery

GO
/****** Object:  StoredProcedure [dbo].[sp_GetObjPases]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetObjPases]
AS
BEGIN
    IF OBJECT_ID('tempdb..#objpases') IS NOT NULL
        DROP TABLE #objpases
 
    SELECT
        capAnno, capMes, capMotivoPase, Capcodigo,
        verCodigo AS NOMBREOBJETO, depModApp AS APLICACION,
        deptipoobjver AS OBJ_VER, SUBSTRING(vercodigo, 1, 1) AS INICIAL,
        CASE
            WHEN '''' + SUBSTRING(vercodigo, 2, 2) = '''X4' THEN '''' + '43'
            WHEN '''' + SUBSTRING(vercodigo, 2, 2) = '''P5' THEN '''' + '55'
            WHEN '''' + SUBSTRING(vercodigo, 2, 2) = '''XT' THEN '''' + SUBSTRING(vercodigo, 4, 2)
            WHEN '''' + SUBSTRING(vercodigo, 2, 2) = '''T4' THEN '''' + SUBSTRING(vercodigo, 3, 2)
            WHEN '''' + SUBSTRING(vercodigo, 2, 2) = '''5L' THEN '''' + '55'
            ELSE '''' + SUBSTRING(vercodigo, 2, 2)
        END AS MODULO,
        CASE
            WHEN SUBSTRING(vercodigo, 1, 1) IN ('B', 'N', 'X') THEN 'BSFN'
            WHEN SUBSTRING(vercodigo, 1, 1) IN ('D', 'T') THEN 'DSTR'
            WHEN SUBSTRING(vercodigo, 1, 1) IN ('F') THEN 'TBL'
            WHEN SUBSTRING(vercodigo, 1, 1) IN ('J') THEN 'BSSV'
            WHEN SUBSTRING(vercodigo, 1, 1) IN ('P') THEN 'APPL'
            WHEN SUBSTRING(vercodigo, 1, 1) IN ('R') THEN 'UBE'
            WHEN SUBSTRING(vercodigo, 1, 1) IN ('V') THEN 'BSVW'
            ELSE 'OTRO'
        END AS TIPO,
        capDesarrollador AS DESARROLLADOR, capFecAutPVDesa AS FECHA_PASE,
        capNomPrj AS Desc_MOTIVO, capObservacion AS OBSERVACION,
        capFecAutPVDesa AS Fecha_Aprobación_Des, capFecImpEst AS Fecha_Imp_Est,
        depDesCambio AS DESC_CAMBIO, capReqImpPV AS especificacion,
        modCodigo, capSerProduccion, depDestino, CAPSERDESARROLLO,
        depOrigen, capLocalidad,
        (
            SELECT parDescripcion
            FROM DBO.PARAMETRO
            WHERE capTipoPase = parSecuencia
        ) AS tipoPase
    INTO #objpases
    FROM vw_cappaseversion, vw_DETPASEVERSION
    WHERE vw_cappaseversion.capSecuencia = vw_DETPASEVERSION.capSecuencia
        AND capFecImpEst >= '2001-02-01 00:00:00'
    ORDER BY vercodigo, capFecAutPVDesa
END
GO
/****** Object:  StoredProcedure [dbo].[sp_IMPLEMENTAPV]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_IMPLEMENTAPV]
@_capSecuencia 			int ,					--pk del registro
@_capFechaImp				varchar(10),
@_capObsImplementador	varchar(300)
as
begin
	update CABPASEVERSION set 
		capObsImplementador=@_capObsImplementador,
		capFechaImp=cast(@_capFechaImp as  smalldatetime)
	where capSecuencia=@_capSecuencia
end
GO
/****** Object:  StoredProcedure [dbo].[sp_MSdel_dbot1]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSdel_dbot1] 
  @pkc1 int
as 
begin 
delete [dbo].[t1]
where [a] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
        exec sp_MSreplraiserror 20598
end 
GO
/****** Object:  StoredProcedure [dbo].[sp_MSins_dbot1]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSins_dbot1] 
  @c1 int,@c2 int
as 
begin 
insert into [dbo].[t1]( 
 [a]
,[b]
 )
values ( 
 @c1
,@c2
 ) 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_MSupd_dbot1]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSupd_dbot1] 
 @c1 int = null,@c2 int = null,@pkc1 int
,@bitmap binary(1)
as
begin
if ( substring(@bitmap,1,1) & 1 = 1 )
begin
update [dbo].[t1] set 
 [a] = case substring(@bitmap,1,1) & 1 when 1 then @c1 else [a] end
,[b] = case substring(@bitmap,1,1) & 2 when 2 then @c2 else [b] end
where [a] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
        exec sp_MSreplraiserror 20598
end
else
begin
update [dbo].[t1] set 
 [b] = case substring(@bitmap,1,1) & 2 when 2 then @c2 else [b] end
where [a] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
        exec sp_MSreplraiserror 20598
end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_NEWSAVEVERSION]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create       proc [dbo].[sp_NEWSAVEVERSION]
@_TipAccion     	varchar(3),		/*Indica el tipo de acción a realizar insert o update*/
@_verSecuencia 	int ,
@_objCodigo		codigo ,
@_verCodigo			codigo,
@_verDescripcion 	varchar(150) ,
@_verUsuario		int,
@_verEstado			bit,
@_verFuncion 		varchar(8000) 
as
declare @Sec 			int
begin

	if @_TipAccion='INS' --INSERT
		begin
		   select top 1 @Sec = objSecuencia   from OBJETO where objCodigo=@_objCodigo
		  insert into VERSION (objSecuencia,verCodigo,verDescripcion,verUsuario,verFecha,verEstado,verFuncion) values 
			(--(select top 1 objSecuencia from OBJETO where objCodigo=@_objCodigo)
			@Sec
			,@_verCodigo, upper(@_verDescripcion), @_verUsuario, getdate(),@_verEstado,@_verFuncion)
		end 
end



GO
/****** Object:  StoredProcedure [dbo].[sp_SAVEAPLICACION]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  proc [dbo].[sp_SAVEAPLICACION]
@_TipAccion     	varchar(3),		/*Indica el tipo de acción a realizar insert o update*/
@_appSecuencia 	int,
@_appDecripcion	varchar(100),
@_appUsuario		int,
@_appEstado			bit 
as
begin
	if @_TipAccion='INS' --INSERT
		begin
		  insert into APLICACION (appDecripcion,appUsuario,appFecha,appEstado) values
			(@_appDecripcion,@_appUsuario,getdate(),@_appEstado)
		end 
	else 
		if @_TipAccion='UPD' --UPDATE
		begin
			UPDATE APLICACION SET appDecripcion=@_appDecripcion,	
					   appEstado=@_appEstado	
			WHERE appSecuencia=@_appSecuencia
		end
end


GO
/****** Object:  StoredProcedure [dbo].[sp_SAVECABPASEVERSION]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE              procedure [dbo].[sp_SAVECABPASEVERSION]
@_capSecuencia 	int output,					--pk del registro
@_capCodigo			varchar(14) output	,	--Código Identificador para el usuario
@_plaSecuencia		int,
@_capPrioridad		int,
@_capMotivoPase	int,
@_capAreaSolic		varchar(100),
@_capObservacion	varchar(1000),
@_capReqImpPV		varchar(2000),
@_capUsuario		int,
@_tecSecuencia		int,
@_capLocalidad		int,
@_capNomPrj			varchar(150),
@_capSerDesarrollo int ,
@_capSerProduccion int ,
@_capFecImpEst		varchar(10),
@_capTipoPase		int,
@_capUserSolic		varchar(100),
@_capImprimePV		bit
as
declare @Semana 			int
declare @Anno 				int
declare @_capImpSec 		varchar(10)
declare @_capFecPrnVP 	smalldatetime
declare @codAutDE 		int
declare @codAutCC 		int
declare @_capFecAutPVDesa 	smalldatetime
begin
	--1) Verifica si es por el evento imprime, si es verdad obtiene secuencia final del pase y continua con update
	select @_capFecPrnVP=capFecPrnPV from cabpaseversion where capSecuencia=@_capSecuencia
	if (@_capImprimePV=1) and (@_capFecPrnVP is  null)
		begin
		--Obtengo el código (del desarrollador) para el pase (código final) 
			select @_capCodigo=rtrim(tecCodigo)+'-'+cast(datepart(yy,getdate()) as varchar(4))+'-'+
					right('0000'+cast(tecNumPases+1 as varchar),4) 
				from tecnico where tecSecuencia=@_tecSecuencia
		--Incremento la secuencia del desarrollador
			update  tecnico set   tecNumPases=tecNumPases+1 where tecSecuencia=@_tecSecuencia
		--Obtengo la fecha de impresion del pase
			select @_capFecPrnVP=getdate()			
		end	
	--2) Verifico si la variable @_capCodigo <> Null realiza update
	if @_capCodigo is not null 	--Para el Update
		begin
			if (@_capImprimePV=1)
				begin
					select @_capFecAutPVDesa=capFecAutPVDesa from cabpaseversion where capSecuencia=@_capSecuencia
					if @_capFecAutPVDesa is Null
						select @_capFecPrnVP=getdate()
					else
						select @Semana=capAutUpdate from CABPASEVERSION where capSecuencia=@_capSecuencia 
						if @Semana=1 
							select @_capFecPrnVP=getdate()	
				end
			-- capFecImpEst=cast(@_capFecImpEst as  smalldatetime),  
			update CABPASEVERSION set 
				plaSecuencia=@_plaSecuencia,
				capPrioridad=@_capPrioridad,
				capMotivoPase=@_capMotivoPase,
				capAreaSolicitante=@_capAreaSolic,
				capObservacion=@_capObservacion,
				capLocalidad=@_capLocalidad,
				capNomPrj=@_capNomPrj,
				capSerDesarrollo=@_capSerDesarrollo,
				capSerProduccion=@_capSerProduccion,
				capFecImpEst=cast(@_capFecPrnVP as  smalldatetime),
				capImpSec=@_capImpSec,
				capCodigo=@_capCodigo,
				capFecPrnPV=@_capFecPrnVP,
				capReqImpPV=@_capReqImpPV,
				capTipoPase=@_capTipoPase,
				capUsuarioSolicitante=@_capUserSolic
			where capSecuencia=@_capSecuencia
		end
	else									--Para el Insert
		begin
	--3) Comprueba si es un pase nuevo crea el codigo temporal del pase.
	--Obtengo el código (del desarrollador) para el pase (código temporal) 
			select @_capCodigo=rtrim(tecCodigo)+'-'+right('0000'+cast(tecNPAlterno+1 as varchar),4) 
				from tecnico where tecSecuencia=@_tecSecuencia
	--Obtengo el código temporal de Autorización por Desarrollo
			select top 1 @codAutDE=tecSecuencia from tecnico where tecTipDesImp=2 and  tecNumPases=1 
	--Obtengo el código temporal de Autorización por Centro de Cómputo
			select top 1 @codAutCC=tecSecuencia from tecnico where tecTipDesImp=3 and  tecNumPases=1

			insert into CABPASEVERSION (capCodigo,capFechaReg,plaSecuencia,capPrioridad,capMotivoPase,capAreaSolicitante,
					capObservacion,capImplementador,capReqImpPV	,capUsuario,tecSecuencia,capLocalidad,
					capNomPrj,capImpSec,capFechaImp,capSerDesarrollo , capSerProduccion,capFecImpEst
					,capTipoPase,capUsuarioSolicitante,capAutUpdate,capAutPVDesa,capAutPVCC) values
					(@_capCodigo,getdate(),@_plaSecuencia,@_capPrioridad,@_capMotivoPase,@_capAreaSolic,
					@_capObservacion,null,@_capReqImpPV	,@_capUsuario,@_tecSecuencia,@_capLocalidad,
					@_capNomPrj, null,null,@_capSerDesarrollo,@_capSerProduccion,cast(@_capFecImpEst as  smalldatetime)
					,@_capTipoPase,@_capUserSolic,0,@codAutDE,@codAutCC)
			--Obtengo la clave para el registro nuevo
				SELECT @_capSecuencia=@@IDENTITY 
			--Incremento la secuencia temporal
				update  tecnico set   tecNPAlterno=tecNPAlterno+1 where tecSecuencia=@_tecSecuencia
		end
end









GO
/****** Object:  StoredProcedure [dbo].[sp_SAVEDETPASEVERSION]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   proc [dbo].[sp_SAVEDETPASEVERSION]
@_detIndex			int ,
@_capSecuencia 	int ,
@_depTipoObjVer	char(1) ,
@_depCodObjVer		int ,
@_depDesCambio		varchar(500),
@_depJusCambio		varchar(100),
@_depOrigen			varchar(150),
@_depDestino		varchar(150)
as
begin
  insert into DETPASEVERSION  (detIndex, capSecuencia , depTipoObjVer, depCodObjVer, depDesCambio , depJusCambio, depOrigen, depDestino) values
		(@_detIndex,@_capSecuencia,@_depTipoObjVer,@_depCodObjVer,upper(@_depDesCambio),upper(@_depJusCambio),upper(@_depOrigen),upper(@_depDestino))
end


GO
/****** Object:  StoredProcedure [dbo].[sp_SAVEDETPASEVERSIONNEW]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE   proc [dbo].[sp_SAVEDETPASEVERSIONNEW]
@_detIndex			int ,
@_capSecuencia 	int ,
@_depTipoObjVer	char(1) ,
@_depCodObj		varchar(50),
@_depCodVersion		varchar(50),
@_depDesCambio		varchar(500),
@_depJusCambio		varchar(100),
@_depOrigen			varchar(150),
@_depDestino		varchar(150)
as
begin

declare @_depCodObjVer int
declare @idObjeto	  int

set @idObjeto = (select top 1 objSecuencia from OBJETO where objCodigo=@_depCodObj)
set @_depCodObjVer = (select top 1 case verSecuencia when null then 0 else verSecuencia end from [VERSION] where objSecuencia=@idObjeto and verCodigo=@_depCodVersion)

if @_depTipoObjVer = 'O'
	begin
		set @_depCodObjVer=@idObjeto
	end

set @_detIndex = (select COUNT(*)+1 from DETPASEVERSION where capSecuencia=@_capSecuencia)

  insert into DETPASEVERSION  (detIndex, capSecuencia , depTipoObjVer, depCodObjVer, depDesCambio , depJusCambio, depOrigen, depDestino) values
		(@_detIndex,@_capSecuencia,@_depTipoObjVer,@_depCodObjVer,upper(@_depDesCambio),upper(@_depJusCambio),upper(@_depOrigen),upper(@_depDestino))
end


GO
/****** Object:  StoredProcedure [dbo].[sp_SAVEMODULO]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE      proc [dbo].[sp_SAVEMODULO]
@_TipAccion     	varchar(3),		/*Indica el tipo de acción a realizar insert o update*/
@_modSecuencia 	int,
@_appSecuencia		int,
@_modCodigo			codigo,
@_modDescripcion 	varchar(100),
@_modUsuario		int,
@_modEstado			bit,
@_modAbreviado		varchar(6)
as
begin
	if len(isnull(@_modAbreviado,''))=0
	   set @_modAbreviado=substring(@_modCodigo,1,6)

	if @_TipAccion='INS' --INSERT
		begin
		  insert into MODULO (appSecuencia,modCodigo,modDescripcion,modUsuario,modFecha,modEstado,modAbreviado) values 
			(@_appSecuencia,@_modCodigo,upper(@_modDescripcion),@_modUsuario,getdate(),@_modEstado,@_modAbreviado)
		end 
	else 
		if @_TipAccion='UPD' --UPDATE
		begin
			UPDATE MODULO SET modDescripcion=upper(@_modDescripcion),	
									appSecuencia=@_appSecuencia,
					   			modEstado=@_modEstado,
									modAbreviado=@_modAbreviado	
			WHERE modSecuencia=@_modSecuencia
		end
end


GO
/****** Object:  StoredProcedure [dbo].[sp_SAVEOBJETO]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE        proc [dbo].[sp_SAVEOBJETO]
@_TipAccion     	varchar(3),		/*Indica el tipo de acción a realizar insert o update*/
@_objSecuencia 	int ,
@_modSecuencia		int ,
@_objCodigo			codigo,
@_objDescripcion 	varchar(150),
@_objUsuario		int,
@_objEstado			bit,
@_objFuncion 		varchar(2000),
@_objRefMenu		varchar(150),
@_objTypeObj		int
as
begin
	if @_TipAccion='INS' --INSERT
		begin
		  insert into OBJETO (modSecuencia,objCodigo,objDescripcion,objUsuario,objFecha,objEstado,objFuncion,objRefMenu,objTypeObj) values 
			(@_modSecuencia,@_objCodigo,upper(@_objDescripcion), @_objUsuario ,getdate(),@_objEstado,upper(@_objFuncion),upper(@_objRefMenu),@_objTypeObj)
		end 
	else 
		if @_TipAccion='UPD' --UPDATE
		begin
			UPDATE OBJETO SET objDescripcion=upper(@_objDescripcion),	
									modSecuencia=@_modSecuencia,
					   			objEstado=@_objEstado,
									objFuncion=upper(@_objFuncion)	,
									objRefMenu=upper(@_objRefMenu),
									objTypeObj=@_objTypeObj
			WHERE objSecuencia=@_objSecuencia
		end
end








GO
/****** Object:  StoredProcedure [dbo].[sp_SAVEPARAMETRO]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SAVEPARAMETRO]
@_TipAccion     	varchar(3),		/*Indica el tipo de acción a realizar insert o update*/
@_parSecuencia 	int,
@_parTipo			char(3),
@_parDescripcion	varchar(50),
@_parEstado			bit
as
begin
	if @_TipAccion='INS' --INSERT
		begin
		  insert into parametro (parTipo,parDescripcion,parEstado) values
										(@_parTipo,@_parDescripcion,@_parEstado)
		end 
	else 
		if @_TipAccion='UPD' --UPDATE
		begin
			UPDATE parametro SET parDescripcion=@_parDescripcion,	
					   parEstado=@_parEstado	
			WHERE parSecuencia=@_parSecuencia
		end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_SAVEPLATAFORMA]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  proc [dbo].[sp_SAVEPLATAFORMA]
@_TipAccion     	varchar(3),		/*Indica el tipo de acción a realizar insert o update*/
@_plaSecuencia 	int ,
@_plaDescripcion 	varchar(100),
@_plaUsuario		int,
@_plaEstado			bit 
as
begin
	if @_TipAccion='INS' --INSERT
		begin
		  insert into PLATAFORMA (plaDescripcion,plaUsuario,plaFecha,plaEstado) values 
			 			(@_plaDescripcion,@_plaUsuario,   getdate(),@_plaEstado)
		end 
	else 
		if @_TipAccion='UPD' --UPDATE
		begin
			UPDATE PLATAFORMA SET plaDescripcion=@_plaDescripcion,	
					   			plaEstado=@_plaEstado	
			WHERE plaSecuencia=@_plaSecuencia
		end
end


GO
/****** Object:  StoredProcedure [dbo].[sp_SAVETECNICO]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE    proc [dbo].[sp_SAVETECNICO]
@_TipAccion	   varchar(3),		/*Indica el tipo de acción a realizar insert o update*/
@_tecSecuencia int,
@_tecTipDesImp	char(1),
@_tecCodigo		char(4),
@_tecNombre		varchar(60),
@_tecEstado		bit,
@_tecPassword	varchar(16),
@_PrintDefault int
as
declare @iDefault 			int
begin
	if (@_tecTipDesImp=2 or @_tecTipDesImp=3)
		set @iDefault=@_PrintDefault
	else
		select @iDefault=tecNumPases from tecnico where tecSecuencia=@_tecSecuencia

	if @_TipAccion='INS' --INSERT
		begin
		  insert into tecnico (tecTipDesImp,tecCodigo,tecNombre,tecNumPases,tecEstado,tecPassword,tecNPAlterno) values
			(@_tecTipDesImp,@_tecCodigo,@_tecNombre,isnull(@iDefault,0),@_tecEstado,@_tecPassword,0)
		end 
	else 
		if @_TipAccion='UPD' --UPDATE
		begin

			UPDATE tecnico SET tecNombre=@_tecNombre,	tecEstado=@_tecEstado,tecNumPases=isnull(@iDefault,0)
								WHERE tecSecuencia=@_tecSecuencia
		end
	if (@_tecTipDesImp=2 or @_tecTipDesImp=3)
		begin
			if @_tecTipDesImp=2 
				begin 
					update tecnico set tecNumPases=0 where tecTipDesImp=2 
					update tecnico set tecNumPases=isnull(@iDefault,0) where tecSecuencia=@_tecSecuencia
				end
			else
				begin
					update tecnico set tecNumPases=0 where tecTipDesImp=3 
					update tecnico set tecNumPases=isnull(@iDefault,0) where tecSecuencia=@_tecSecuencia
				end
		end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_SAVEVERSION]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE       proc [dbo].[sp_SAVEVERSION]
@_TipAccion     	varchar(3),		/*Indica el tipo de acción a realizar insert o update*/
@_verSecuencia 	int ,
@_objSecuencia		int ,
@_verCodigo			codigo,
@_verDescripcion 	varchar(150) ,
@_verUsuario		int,
@_verEstado			bit,
@_verFuncion 		varchar(8000) 
as
begin
	if @_TipAccion='INS' --INSERT
		begin
		  insert into VERSION (objSecuencia,verCodigo,verDescripcion,verUsuario,verFecha,verEstado,verFuncion) values 
			(@_objSecuencia,@_verCodigo, upper(@_verDescripcion), @_verUsuario, getdate(),@_verEstado,@_verFuncion)
		end 
	else 
		if @_TipAccion='UPD' --UPDATE
		begin
			UPDATE VERSION SET verDescripcion=upper(@_verDescripcion),	
									objSecuencia=@_objSecuencia,
					   			verEstado=@_verEstado,
									verFuncion=@_verFuncion	
			WHERE verSecuencia=@_verSecuencia
		end
end






GO
/****** Object:  StoredProcedure [dbo].[spTemp]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spTemp] 
@_capSecuencia 	int output,					--pk del registro
@_capCodigo			varchar(14) output
as
	set @_capCodigo='nada'
	if exists (select capCodigo from cabpaseversion where capSecuencia=@_capSecuencia) 
      select @_capCodigo=capCodigo from cabpaseversion where capSecuencia=@_capSecuencia
	else
		set @_capSecuencia=0
		set @_capCodigo='nada'
GO
/****** Object:  StoredProcedure [dbo].[usp_ExportImage]    Script Date: 15/4/2024 16:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ExportImage] (
   @capSecuencia float
   ,@ImageFolderPath NVARCHAR(1000)
   ,@Filename NVARCHAR(1000)
   )
AS
BEGIN
   DECLARE @ImageData VARBINARY (max);
   DECLARE @Path2OutFile NVARCHAR (2000);
   DECLARE @Obj INT
 
   SET NOCOUNT ON
 
   SELECT @ImageData = (
         SELECT convert (VARBINARY (max), apvObjetos, 1)
         FROM dbPaseVersion.dbo.ANEXOPASVER
         WHERE capSecuencia = @capSecuencia
         );
 
   SET @Path2OutFile = 
         @ImageFolderPath +
         '\'+
          @Filename
         ;
    BEGIN TRY
     EXEC sp_OACreate 'ADODB.Stream' ,@Obj OUTPUT;
     EXEC sp_OASetProperty @Obj ,'Type',1;
     EXEC sp_OAMethod @Obj,'Open';
     EXEC sp_OAMethod @Obj,'Write', NULL, @ImageData;
     EXEC sp_OAMethod @Obj,'SaveToFile', NULL, @Path2OutFile, 2;
     EXEC sp_OAMethod @Obj,'Close';
     EXEC sp_OADestroy @Obj;
    END TRY
    
 BEGIN CATCH
  EXEC sp_OADestroy @Obj;
 END CATCH
 
   SET NOCOUNT OFF
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "cab"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 249
            End
            DisplayFlags = 280
            TopColumn = 25
         End
         Begin Table = "pla"
            Begin Extent = 
               Top = 6
               Left = 287
               Bottom = 136
               Right = 457
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_CAPPASEVERSION'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_CAPPASEVERSION'
GO
USE [master]
GO
ALTER DATABASE [dbPaseVersion] SET  READ_WRITE 
GO
