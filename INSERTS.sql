USE [master]
GO
/****** Object:  Database [Pharmacy]    Script Date: 15/10/2017 02:12:46 p.m. ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Pharmacy')
BEGIN
CREATE DATABASE [Pharmacy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pharmacy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Pharmacy.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Pharmacy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Pharmacy_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [Pharmacy] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pharmacy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pharmacy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pharmacy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pharmacy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pharmacy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pharmacy] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pharmacy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Pharmacy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pharmacy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pharmacy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pharmacy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pharmacy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pharmacy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pharmacy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pharmacy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pharmacy] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Pharmacy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pharmacy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pharmacy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pharmacy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pharmacy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pharmacy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pharmacy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pharmacy] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Pharmacy] SET  MULTI_USER 
GO
ALTER DATABASE [Pharmacy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pharmacy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pharmacy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pharmacy] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Pharmacy] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Pharmacy]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 15/10/2017 02:12:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[Teléfono] [varchar](50) NOT NULL,
	[Dirección] [varchar](50) NOT NULL,
	[Correo] [varchar](50) NOT NULL,
	[RFC] [nchar](10) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetalleCompra]    Script Date: 15/10/2017 02:12:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DetalleCompra]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DetalleCompra](
	[IdDetalleCompra] [uniqueidentifier] NOT NULL,
	[IdOrdenCompra] [uniqueidentifier] NULL,
	[IdProducto] [uniqueidentifier] NULL,
	[Cantidad] [int] NULL,
	[Precio] [float] NULL,
	[Total] [float] NULL,
 CONSTRAINT [PK_DetalleCompra_1] PRIMARY KEY CLUSTERED 
(
	[IdDetalleCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 15/10/2017 02:12:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Empleado]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Empleado](
	[IdEmpleado] [uniqueidentifier] NOT NULL,
	[IdSucursal] [uniqueidentifier] NOT NULL,
	[IdPuesto] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[Teléfono] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Empleado_1] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 15/10/2017 02:12:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Factura]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Factura](
	[IdFactura] [uniqueidentifier] NOT NULL,
	[IdCliente] [uniqueidentifier] NOT NULL,
	[IdVenta] [uniqueidentifier] NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [PK_Factura_1] PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 15/10/2017 02:12:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Inventario]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Inventario](
	[IdInventario] [uniqueidentifier] NOT NULL,
	[IdSucursal] [uniqueidentifier] NOT NULL,
	[IdProducto] [uniqueidentifier] NOT NULL,
	[CantidadAlmacen] [int] NOT NULL,
 CONSTRAINT [PK_Inventario_1] PRIMARY KEY CLUSTERED 
(
	[IdInventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OrdenCompra]    Script Date: 15/10/2017 02:12:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrdenCompra]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OrdenCompra](
	[IdOrdenCompra] [uniqueidentifier] NOT NULL,
	[IdProveedor] [uniqueidentifier] NOT NULL,
	[FechaOrdenCompra] [date] NOT NULL,
 CONSTRAINT [PK_OrdenCompra_1] PRIMARY KEY CLUSTERED 
(
	[IdOrdenCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 15/10/2017 02:12:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Producto](
	[IdProducto] [uniqueidentifier] NOT NULL,
	[IdDetalleCompra] [uniqueidentifier] NOT NULL,
	[NombreProducto] [varchar](50) NOT NULL,
	[Precio] [float] NOT NULL,
 CONSTRAINT [PK_Producto_1] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 15/10/2017 02:12:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proveedor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Proveedor](
	[IdProveedor] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Teléfono] [varchar](50) NOT NULL,
	[Dirección] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Puesto]    Script Date: 15/10/2017 02:12:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Puesto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Puesto](
	[IdPuesto] [uniqueidentifier] NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[Sueldo] [float] NOT NULL,
 CONSTRAINT [PK_Puesto] PRIMARY KEY CLUSTERED 
(
	[IdPuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 15/10/2017 02:12:47 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sucursal]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sucursal](
	[IdSucursal] [uniqueidentifier] NOT NULL,
	[IdProveedor] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Dirección] [varchar](50) NOT NULL,
	[Teléfono] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Sucursal_1] PRIMARY KEY CLUSTERED 
(
	[IdSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 15/10/2017 02:12:47 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Venta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Venta](
	[IdVenta] [uniqueidentifier] NOT NULL,
	[IdEmpleado] [uniqueidentifier] NOT NULL,
	[IdProducto] [uniqueidentifier] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Subtotal] [float] NOT NULL,
	[Total] [float] NOT NULL,
 CONSTRAINT [PK_Venta_1] PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [Apellidos], [Teléfono], [Dirección], [Correo], [RFC]) VALUES (N'ca15aec7-33bb-4194-9b37-238b85ac67a1', N'Daniel', N'Cabazos Reyna', N'8180850586', N'Av.Cardona', N'daniel@gmail.com', N'SSWS8269  ')
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [Apellidos], [Teléfono], [Dirección], [Correo], [RFC]) VALUES (N'806ab5bc-9723-41a0-9564-5a58bcd02843', N'Abraham', N'Perez Lopez', N'8188900586', N'Av.Qwerty', N'fvfbdg@gmail.com', N'LDFBG582  ')
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [Apellidos], [Teléfono], [Dirección], [Correo], [RFC]) VALUES (N'83e55600-2453-42b3-bff4-b500d55a1c9e', N'Angel', N'Mendez Perez', N'8156974580', N'Av.Ezequiel', N'qfscoiuj@gmail.com', N'FSGVYZ61  ')
INSERT [dbo].[DetalleCompra] ([IdDetalleCompra], [IdOrdenCompra], [IdProducto], [Cantidad], [Precio], [Total]) VALUES (N'7bab14a9-b620-4253-9c4d-82334a90295d', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DetalleCompra] ([IdDetalleCompra], [IdOrdenCompra], [IdProducto], [Cantidad], [Precio], [Total]) VALUES (N'8bc03c6b-3b32-4316-a015-e2ddfad4eb89', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DetalleCompra] ([IdDetalleCompra], [IdOrdenCompra], [IdProducto], [Cantidad], [Precio], [Total]) VALUES (N'0bc39f0b-7483-46d8-8355-e582cbf233a2', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleado] ([IdEmpleado], [IdSucursal], [IdPuesto], [Nombre], [Apellidos], [Teléfono]) VALUES (N'223cca2e-346e-4a31-ba57-69a11b1d501e', N'aca3ab77-ac42-451b-89c1-fda008bde918', N'6a459a2e-2caf-42d6-8c74-78940ee54128', N'Karina', N'Bakula', N'45623213')
INSERT [dbo].[Empleado] ([IdEmpleado], [IdSucursal], [IdPuesto], [Nombre], [Apellidos], [Teléfono]) VALUES (N'52e9a93b-2f7b-4528-a67c-9a82edc0cf34', N'756847d9-235c-4122-afdb-832cae5a8a2d', N'4723a255-eea3-4d1e-be3f-4d04ae54e582', N'Felipe', N'Cedillo', N'4456125489')
INSERT [dbo].[Empleado] ([IdEmpleado], [IdSucursal], [IdPuesto], [Nombre], [Apellidos], [Teléfono]) VALUES (N'ffd721da-db05-45cc-be97-e79f1c556230', N'12ae25ef-d17f-4b6c-93fb-53a137bf7c65', N'e29c9af6-30a7-49ca-86fe-006f6b383a1d', N'Juan', N'Perez Lopez', N'8956232659')
INSERT [dbo].[OrdenCompra] ([IdOrdenCompra], [IdProveedor], [FechaOrdenCompra]) VALUES (N'13593301-62b6-43f6-8b5a-9e8c6c7993ea', N'32190271-10e5-4b02-8be7-a642cd819c02', CAST(N'2016-09-05' AS Date))
INSERT [dbo].[OrdenCompra] ([IdOrdenCompra], [IdProveedor], [FechaOrdenCompra]) VALUES (N'734c56a9-512f-4804-af89-d46362d46ed7', N'17eed89d-a627-4dfa-ac56-3830c6531481', CAST(N'2016-06-08' AS Date))
INSERT [dbo].[OrdenCompra] ([IdOrdenCompra], [IdProveedor], [FechaOrdenCompra]) VALUES (N'c78cf74e-8e8b-45da-8afc-fe80c8d88e17', N'0a568239-b745-4013-9517-13884e72700d', CAST(N'2016-10-01' AS Date))
INSERT [dbo].[Proveedor] ([IdProveedor], [Nombre], [Teléfono], [Dirección]) VALUES (N'0a568239-b745-4013-9517-13884e72700d', N'FarmacosLopez', N'81596840', N'Av.Gustavo 08')
INSERT [dbo].[Proveedor] ([IdProveedor], [Nombre], [Teléfono], [Dirección]) VALUES (N'17eed89d-a627-4dfa-ac56-3830c6531481', N'FarmacosGarza', N'83941385', N'Av.Lago 06')
INSERT [dbo].[Proveedor] ([IdProveedor], [Nombre], [Teléfono], [Dirección]) VALUES (N'32190271-10e5-4b02-8be7-a642cd819c02', N'FarmacosMonte', N'89658978636', N'Av.Prodfsa')
INSERT [dbo].[Proveedor] ([IdProveedor], [Nombre], [Teléfono], [Dirección]) VALUES (N'fefa7c50-7836-4946-8249-deaf7eab7551', N'GarciaFarmacos', N'895672306', N'Av.Profeco')
INSERT [dbo].[Puesto] ([IdPuesto], [Tipo], [Sueldo]) VALUES (N'e29c9af6-30a7-49ca-86fe-006f6b383a1d', N'Cajero', 1500)
INSERT [dbo].[Puesto] ([IdPuesto], [Tipo], [Sueldo]) VALUES (N'4723a255-eea3-4d1e-be3f-4d04ae54e582', N'Limpiado', 500)
INSERT [dbo].[Puesto] ([IdPuesto], [Tipo], [Sueldo]) VALUES (N'6a459a2e-2caf-42d6-8c74-78940ee54128', N'Despachador', 600)
INSERT [dbo].[Puesto] ([IdPuesto], [Tipo], [Sueldo]) VALUES (N'79d01b85-5081-4106-a8f2-86243d41cf44', N'Limpiador', 800)
INSERT [dbo].[Sucursal] ([IdSucursal], [IdProveedor], [Nombre], [Dirección], [Teléfono]) VALUES (N'12ae25ef-d17f-4b6c-93fb-53a137bf7c65', N'fefa7c50-7836-4946-8249-deaf7eab7551', N'FarmaciaDOC', N'Av.Juan08', N'302156847')
INSERT [dbo].[Sucursal] ([IdSucursal], [IdProveedor], [Nombre], [Dirección], [Teléfono]) VALUES (N'756847d9-235c-4122-afdb-832cae5a8a2d', N'17eed89d-a627-4dfa-ac56-3830c6531481', N'FarmaciaSNN', N'Av.Perez08', N'8956231201')
INSERT [dbo].[Sucursal] ([IdSucursal], [IdProveedor], [Nombre], [Dirección], [Teléfono]) VALUES (N'aca3ab77-ac42-451b-89c1-fda008bde918', N'0a568239-b745-4013-9517-13884e72700d', N'FarmaciaGPE', N'Av.Lopez08', N'8653215478')
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Empleado_Puesto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Puesto] FOREIGN KEY([IdPuesto])
REFERENCES [dbo].[Puesto] ([IdPuesto])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Empleado_Puesto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Puesto]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Empleado_Sucursal]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Sucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Empleado_Sucursal]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Sucursal]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Factura_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Factura]'))
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Factura_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Factura]'))
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Cliente]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Factura_Venta]') AND parent_object_id = OBJECT_ID(N'[dbo].[Factura]'))
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Venta] FOREIGN KEY([IdVenta])
REFERENCES [dbo].[Venta] ([IdVenta])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Factura_Venta]') AND parent_object_id = OBJECT_ID(N'[dbo].[Factura]'))
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Venta]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Inventario_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Inventario]'))
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Inventario_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Inventario]'))
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [FK_Inventario_Producto]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Inventario_Sucursal]') AND parent_object_id = OBJECT_ID(N'[dbo].[Inventario]'))
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Sucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Inventario_Sucursal]') AND parent_object_id = OBJECT_ID(N'[dbo].[Inventario]'))
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [FK_Inventario_Sucursal]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrdenCompra_Proveedor]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrdenCompra]'))
ALTER TABLE [dbo].[OrdenCompra]  WITH CHECK ADD  CONSTRAINT [FK_OrdenCompra_Proveedor] FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedor] ([IdProveedor])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrdenCompra_Proveedor]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrdenCompra]'))
ALTER TABLE [dbo].[OrdenCompra] CHECK CONSTRAINT [FK_OrdenCompra_Proveedor]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_DetalleCompra]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto]'))
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_DetalleCompra] FOREIGN KEY([IdDetalleCompra])
REFERENCES [dbo].[DetalleCompra] ([IdDetalleCompra])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_DetalleCompra]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto]'))
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_DetalleCompra]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sucursal_Proveedor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sucursal]'))
ALTER TABLE [dbo].[Sucursal]  WITH CHECK ADD  CONSTRAINT [FK_Sucursal_Proveedor] FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedor] ([IdProveedor])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sucursal_Proveedor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sucursal]'))
ALTER TABLE [dbo].[Sucursal] CHECK CONSTRAINT [FK_Sucursal_Proveedor]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Venta_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Empleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Venta_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Empleado]
GO
USE [master]
GO
ALTER DATABASE [Pharmacy] SET  READ_WRITE 
GO
