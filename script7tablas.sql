USE [master]
GO
/****** Object:  Database [7tablas]    Script Date: 10/09/2017 04:06:20 a.m. ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'7tablas')
BEGIN
CREATE DATABASE [7tablas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'7tablas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\7tablas.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'7tablas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\7tablas_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [7tablas] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [7tablas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [7tablas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [7tablas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [7tablas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [7tablas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [7tablas] SET ARITHABORT OFF 
GO
ALTER DATABASE [7tablas] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [7tablas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [7tablas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [7tablas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [7tablas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [7tablas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [7tablas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [7tablas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [7tablas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [7tablas] SET  ENABLE_BROKER 
GO
ALTER DATABASE [7tablas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [7tablas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [7tablas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [7tablas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [7tablas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [7tablas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [7tablas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [7tablas] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [7tablas] SET  MULTI_USER 
GO
ALTER DATABASE [7tablas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [7tablas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [7tablas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [7tablas] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [7tablas] SET DELAYED_DURABILITY = DISABLED 
GO
USE [7tablas]
GO
/****** Object:  Table [dbo].[Acceso]    Script Date: 10/09/2017 04:06:21 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Acceso]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Acceso](
	[CodigoEmpleado] [uniqueidentifier] NOT NULL,
	[NombreEmpleado] [varchar](50) NOT NULL,
	[PuestoEmpleado] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Acceso] PRIMARY KEY CLUSTERED 
(
	[CodigoEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 10/09/2017 04:06:21 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Clientes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Clientes](
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Dirección] [varchar](50) NOT NULL,
	[Tel] [int] NOT NULL,
	[Cel] [int] NOT NULL,
	[email] [varchar](50) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IDX_Nombre]    Script Date: 10/09/2017 04:06:21 a.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Clientes]') AND name = N'IDX_Nombre')
CREATE CLUSTERED INDEX [IDX_Nombre] ON [dbo].[Clientes]
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompuertaLogica]    Script Date: 10/09/2017 04:06:21 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CompuertaLogica]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CompuertaLogica](
	[IDCompuerta] [uniqueidentifier] NOT NULL,
	[NombreCompuerta] [varchar](50) NOT NULL,
	[NumBitsTrabaja] [bit] NOT NULL,
 CONSTRAINT [PK_CompuertaLogica] PRIMARY KEY CLUSTERED 
(
	[IDCompuerta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 10/09/2017 04:06:21 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Empleado]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Empleado](
	[ClaveEmpleado] [uniqueidentifier] NOT NULL,
	[NombreEmpleado] [varchar](50) NOT NULL,
	[FechaDeInicio] [date] NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[ClaveEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Libreria]    Script Date: 10/09/2017 04:06:21 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Libreria]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Libreria](
	[ISBN] [uniqueidentifier] NOT NULL,
	[Autor] [varchar](50) NOT NULL,
	[NombreLibro] [text] NOT NULL,
 CONSTRAINT [PK_Libreria] PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Presidentes]    Script Date: 10/09/2017 04:06:21 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Presidentes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Presidentes](
	[CodigoPresidente] [uniqueidentifier] NOT NULL,
	[NombrePresidente] [varchar](50) NOT NULL,
	[Salario] [money] NOT NULL,
	[Bonus] [money] NOT NULL,
	[Vacaciones] [money] NOT NULL,
	[TotalMoney]  AS (([Salario]+[Bonus])+[Vacaciones]),
 CONSTRAINT [PK_Presidentes] PRIMARY KEY CLUSTERED 
(
	[CodigoPresidente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tinyyy]    Script Date: 10/09/2017 04:06:21 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tinyyy]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tinyyy](
	[ID] [tinyint] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tinyyy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Veterinaria]    Script Date: 10/09/2017 04:06:21 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Veterinaria]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Veterinaria](
	[ID] [uniqueidentifier] NOT NULL,
	[NombreAnimal] [varchar](50) NOT NULL,
	[Edad] [int] NOT NULL,
 CONSTRAINT [PK_Veterinaria] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IDX_Apellido]    Script Date: 10/09/2017 04:06:21 a.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Clientes]') AND name = N'IDX_Apellido')
CREATE NONCLUSTERED INDEX [IDX_Apellido] ON [dbo].[Clientes]
(
	[Apellido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [7tablas] SET  READ_WRITE 
GO
