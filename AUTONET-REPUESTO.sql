/****** Nombre: Dionys Cabrera Rosario Matricula: 18-SIIN-1-057  ******/
/****** Proyecto Final de Base de Datos de la universidad OYM con el Maestro Starlin Germosen ******/


USE [master]
GO
/****** Object:  Database [AUTO_REPUESTO]    Script Date: 24/08/2020 12:42:27 ******/
CREATE DATABASE [AUTO_REPUESTO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AUTO_REPUESTO', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\AUTO_REPUESTO.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AUTO_REPUESTO_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\AUTO_REPUESTO_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AUTO_REPUESTO] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AUTO_REPUESTO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AUTO_REPUESTO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AUTO_REPUESTO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AUTO_REPUESTO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AUTO_REPUESTO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AUTO_REPUESTO] SET ARITHABORT OFF 
GO
ALTER DATABASE [AUTO_REPUESTO] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AUTO_REPUESTO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AUTO_REPUESTO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AUTO_REPUESTO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AUTO_REPUESTO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AUTO_REPUESTO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AUTO_REPUESTO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AUTO_REPUESTO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AUTO_REPUESTO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AUTO_REPUESTO] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AUTO_REPUESTO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AUTO_REPUESTO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AUTO_REPUESTO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AUTO_REPUESTO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AUTO_REPUESTO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AUTO_REPUESTO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AUTO_REPUESTO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AUTO_REPUESTO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AUTO_REPUESTO] SET  MULTI_USER 
GO
ALTER DATABASE [AUTO_REPUESTO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AUTO_REPUESTO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AUTO_REPUESTO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AUTO_REPUESTO] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [AUTO_REPUESTO]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 24/08/2020 12:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Cedula/RNC] [varchar](50) NOT NULL,
	[Matricula] [varchar](50) NOT NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Sexo] [nvarchar](2) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 24/08/2020 12:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Cedula] [varchar](50) NOT NULL,
	[Cargo] [varchar](50) NOT NULL,
	[Foto] [image] NULL,
	[Departamento] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 24/08/2020 12:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[ID] [int] NOT NULL,
	[ID_producto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Almancen] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Inventario_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 24/08/2020 12:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Referencia] [varchar](50) NOT NULL,
	[Categoria] [varchar](50) NOT NULL,
	[ID_Proveedor] [int] NOT NULL,
	[COD_barra] [varchar](50) NULL,
	[Costo] [money] NULL,
	[Precio] [money] NULL,
 CONSTRAINT [PK_Inventario] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 24/08/2020 12:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[RNC] [varchar](50) NOT NULL,
	[Telefono] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
 CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([ID], [Nombre], [Apellido], [Cedula/RNC], [Matricula], [Direccion], [Telefono], [Sexo]) VALUES (1, N'Pedro', N'Castillo', N'12121121', N'A156482', NULL, N'8295551236', N'M')
INSERT [dbo].[Clientes] ([ID], [Nombre], [Apellido], [Cedula/RNC], [Matricula], [Direccion], [Telefono], [Sexo]) VALUES (2, N'Manuel', N'Espaillat', N'55562142', N'EM89571', NULL, N'80911247814', N'M')
INSERT [dbo].[Clientes] ([ID], [Nombre], [Apellido], [Cedula/RNC], [Matricula], [Direccion], [Telefono], [Sexo]) VALUES (3, N'Felicia', N'Catran', N'51548852', N'G784214', NULL, N'8091154848', N'F')
INSERT [dbo].[Clientes] ([ID], [Nombre], [Apellido], [Cedula/RNC], [Matricula], [Direccion], [Telefono], [Sexo]) VALUES (5, N'Luis', N'Bueno', N'18422647', N'A157814', NULL, N'8496651236', N'M')
INSERT [dbo].[Clientes] ([ID], [Nombre], [Apellido], [Cedula/RNC], [Matricula], [Direccion], [Telefono], [Sexo]) VALUES (7, N'Andrea', N'Castro', N'11144447', N'G457811', NULL, N'8296539978', N'F')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
SET IDENTITY_INSERT [dbo].[Empleados] ON 

INSERT [dbo].[Empleados] ([ID], [Nombre], [Apellido], [Cedula], [Cargo], [Foto], [Departamento]) VALUES (2, N'Starlin', N'Ruiz', N'15448425', N'Gerente', NULL, N'Tecnologia')
INSERT [dbo].[Empleados] ([ID], [Nombre], [Apellido], [Cedula], [Cargo], [Foto], [Departamento]) VALUES (4, N'Jesus', N'Fabian', N'18545567', N'Afiliado', NULL, N'Ventas')
INSERT [dbo].[Empleados] ([ID], [Nombre], [Apellido], [Cedula], [Cargo], [Foto], [Departamento]) VALUES (5, N'Maria', N'Castro', N'15484841', N'Gerente', NULL, N'Ventas')
INSERT [dbo].[Empleados] ([ID], [Nombre], [Apellido], [Cedula], [Cargo], [Foto], [Departamento]) VALUES (6, N'Petronila', N'Sanchez', N'14554474', N'Geremte', NULL, N'RHH')
SET IDENTITY_INSERT [dbo].[Empleados] OFF
INSERT [dbo].[Inventario] ([ID], [ID_producto], [Cantidad], [Almancen]) VALUES (1, 1, 10, N'ALM1')
INSERT [dbo].[Inventario] ([ID], [ID_producto], [Cantidad], [Almancen]) VALUES (2, 3, 15, N'ALM1')
INSERT [dbo].[Inventario] ([ID], [ID_producto], [Cantidad], [Almancen]) VALUES (3, 5, 5, N'ALM1')
INSERT [dbo].[Inventario] ([ID], [ID_producto], [Cantidad], [Almancen]) VALUES (4, 2, 25, N'ALM1')
INSERT [dbo].[Inventario] ([ID], [ID_producto], [Cantidad], [Almancen]) VALUES (5, 4, 11, N'ALM1')
INSERT [dbo].[Productos] ([ID], [Nombre], [Referencia], [Categoria], [ID_Proveedor], [COD_barra], [Costo], [Precio]) VALUES (1, N'Disco de Freno', N'100', N'Frenos', 2, NULL, NULL, NULL)
INSERT [dbo].[Productos] ([ID], [Nombre], [Referencia], [Categoria], [ID_Proveedor], [COD_barra], [Costo], [Precio]) VALUES (2, N'Bujias', N'101', N'Auto', 1, NULL, NULL, NULL)
INSERT [dbo].[Productos] ([ID], [Nombre], [Referencia], [Categoria], [ID_Proveedor], [COD_barra], [Costo], [Precio]) VALUES (3, N'Faros delanteros', N'102', N'Faros', 5, NULL, NULL, NULL)
INSERT [dbo].[Productos] ([ID], [Nombre], [Referencia], [Categoria], [ID_Proveedor], [COD_barra], [Costo], [Precio]) VALUES (4, N'Filtro de aceite', N'103', N'Filtros', 4, NULL, NULL, NULL)
INSERT [dbo].[Productos] ([ID], [Nombre], [Referencia], [Categoria], [ID_Proveedor], [COD_barra], [Costo], [Precio]) VALUES (5, N'Filtro de combustible', N'104', N'Filtros', 4, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Proveedores] ON 

INSERT [dbo].[Proveedores] ([ID], [Nombre], [RNC], [Telefono], [Direccion]) VALUES (1, N'Lubirpoint', N'1115154', N'8095681125', NULL)
INSERT [dbo].[Proveedores] ([ID], [Nombre], [RNC], [Telefono], [Direccion]) VALUES (2, N'Ecobrex', N'5487714', N'8095336155', NULL)
INSERT [dbo].[Proveedores] ([ID], [Nombre], [RNC], [Telefono], [Direccion]) VALUES (4, N'Xport Auto-art', N'15448585', N'8295694875', NULL)
INSERT [dbo].[Proveedores] ([ID], [Nombre], [RNC], [Telefono], [Direccion]) VALUES (5, N'Fancy Auto', N'89454844', N'8495561178', NULL)
SET IDENTITY_INSERT [dbo].[Proveedores] OFF
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Inventario] FOREIGN KEY([ID])
REFERENCES [dbo].[Inventario] ([ID])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [FK_Inventario_Inventario]
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Productos] FOREIGN KEY([ID_producto])
REFERENCES [dbo].[Productos] ([ID])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [FK_Inventario_Productos]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Proveedores] FOREIGN KEY([ID_Proveedor])
REFERENCES [dbo].[Proveedores] ([ID])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Proveedores]
GO
USE [master]
GO
ALTER DATABASE [AUTO_REPUESTO] SET  READ_WRITE 
GO
