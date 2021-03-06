USE [master]
GO
/****** Object:  Database [MarvelDB]    Script Date: 29/02/2020 09:28:31 a. m. ******/
CREATE DATABASE [MarvelDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MarvelDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER2016\MSSQL\DATA\MarvelDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MarvelDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER2016\MSSQL\DATA\MarvelDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MarvelDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MarvelDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MarvelDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MarvelDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MarvelDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MarvelDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MarvelDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MarvelDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MarvelDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MarvelDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MarvelDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MarvelDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MarvelDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MarvelDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MarvelDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MarvelDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MarvelDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MarvelDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MarvelDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MarvelDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MarvelDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MarvelDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MarvelDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MarvelDB] SET RECOVERY FULL 
GO
ALTER DATABASE [MarvelDB] SET  MULTI_USER 
GO
ALTER DATABASE [MarvelDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MarvelDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MarvelDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MarvelDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MarvelDB', N'ON'
GO
USE [MarvelDB]
GO
/****** Object:  Table [dbo].[Inventarios]    Script Date: 29/02/2020 09:28:35 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventarios](
	[IdInventario] [int] NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[Codigo] [varchar](50) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
	[IdUsuarioAlta] [int] NULL,
	[FCreacion] [datetime] NULL,
	[FModificacion] [datetime] NULL,
	[Activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdInventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 29/02/2020 09:28:35 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[IdProducto] [int] NOT NULL,
	[IdInventario] [int] NOT NULL,
	[Codigo] [varchar](50) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
	[IdUsuarioAlta] [int] NULL,
	[FCreacion] [datetime] NULL,
	[FModificacion] [datetime] NULL,
	[Activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursales]    Script Date: 29/02/2020 09:28:35 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursales](
	[IdSucursal] [int] NOT NULL,
	[Nombre] [varchar](500) NOT NULL,
	[Ubicacion] [varchar](max) NOT NULL,
	[Telefonos] [varchar](500) NOT NULL,
	[IdUsuarioAlta] [int] NULL,
	[FCreacion] [datetime] NULL,
	[FModificacion] [datetime] NULL,
	[Activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 29/02/2020 09:28:35 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] NOT NULL,
	[Nombre] [varchar](200) NULL,
	[ApellidoParterno] [varchar](200) NULL,
	[ApellidoMaterno] [varchar](200) NULL,
	[Activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Inventarios] ([IdInventario], [IdSucursal], [Codigo], [Descripcion], [IdUsuarioAlta], [FCreacion], [FModificacion], [Activo]) VALUES (1, 1, N'InvBIT', N'Inventario BIT', 1, CAST(N'2020-02-08T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Inventarios] ([IdInventario], [IdSucursal], [Codigo], [Descripcion], [IdUsuarioAlta], [FCreacion], [FModificacion], [Activo]) VALUES (2, 2, N'InvTerra', N'Inventario Terra', 1, CAST(N'2020-02-08T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Inventarios] ([IdInventario], [IdSucursal], [Codigo], [Descripcion], [IdUsuarioAlta], [FCreacion], [FModificacion], [Activo]) VALUES (3, 3, N'InvDomi', N'Inventario Domi', 1, CAST(N'2020-02-08T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Productos] ([IdProducto], [IdInventario], [Codigo], [Descripcion], [IdUsuarioAlta], [FCreacion], [FModificacion], [Activo]) VALUES (1, 1, N'21477', N'21477', 1, CAST(N'2020-02-28T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Productos] ([IdProducto], [IdInventario], [Codigo], [Descripcion], [IdUsuarioAlta], [FCreacion], [FModificacion], [Activo]) VALUES (2, 1, N'21469', N'21469', 1, CAST(N'2020-02-28T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Productos] ([IdProducto], [IdInventario], [Codigo], [Descripcion], [IdUsuarioAlta], [FCreacion], [FModificacion], [Activo]) VALUES (3, 1, N'25321', N'25321', 1, CAST(N'2020-02-28T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Productos] ([IdProducto], [IdInventario], [Codigo], [Descripcion], [IdUsuarioAlta], [FCreacion], [FModificacion], [Activo]) VALUES (4, 2, N'59739', N'59739', 1, CAST(N'2020-02-28T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Productos] ([IdProducto], [IdInventario], [Codigo], [Descripcion], [IdUsuarioAlta], [FCreacion], [FModificacion], [Activo]) VALUES (5, 2, N'16233', N'16233', 1, CAST(N'2020-02-28T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Productos] ([IdProducto], [IdInventario], [Codigo], [Descripcion], [IdUsuarioAlta], [FCreacion], [FModificacion], [Activo]) VALUES (6, 2, N'21462', N'21462', 1, CAST(N'2020-02-28T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Productos] ([IdProducto], [IdInventario], [Codigo], [Descripcion], [IdUsuarioAlta], [FCreacion], [FModificacion], [Activo]) VALUES (7, 3, N'37376', N'37376', 1, CAST(N'2020-02-28T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Productos] ([IdProducto], [IdInventario], [Codigo], [Descripcion], [IdUsuarioAlta], [FCreacion], [FModificacion], [Activo]) VALUES (8, 3, N'58586', N'58586', 1, CAST(N'2020-02-28T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Productos] ([IdProducto], [IdInventario], [Codigo], [Descripcion], [IdUsuarioAlta], [FCreacion], [FModificacion], [Activo]) VALUES (9, 3, N'59548', N'59548', 1, CAST(N'2020-02-28T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Sucursales] ([IdSucursal], [Nombre], [Ubicacion], [Telefonos], [IdUsuarioAlta], [FCreacion], [FModificacion], [Activo]) VALUES (1, N'BIT Tec', N'Plaza San Juan', N'72225447811', 1, CAST(N'2020-02-27T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Sucursales] ([IdSucursal], [Nombre], [Ubicacion], [Telefonos], [IdUsuarioAlta], [FCreacion], [FModificacion], [Activo]) VALUES (2, N'Terra', N'Pino Suarez', N'722114559', 1, CAST(N'2020-02-28T07:19:47.013' AS DateTime), NULL, 1)
INSERT [dbo].[Sucursales] ([IdSucursal], [Nombre], [Ubicacion], [Telefonos], [IdUsuarioAlta], [FCreacion], [FModificacion], [Activo]) VALUES (3, N'Domi', N'Metepec Centro', N'78112245122', 1, CAST(N'2020-02-28T07:24:46.393' AS DateTime), NULL, 1)
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombre], [ApellidoParterno], [ApellidoMaterno], [Activo]) VALUES (1, N'Admin', N'Admin', N'Admin', 1)
ALTER TABLE [dbo].[Inventarios]  WITH CHECK ADD FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursales] ([IdSucursal])
GO
ALTER TABLE [dbo].[Inventarios]  WITH CHECK ADD FOREIGN KEY([IdUsuarioAlta])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([IdInventario])
REFERENCES [dbo].[Inventarios] ([IdInventario])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([IdUsuarioAlta])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Sucursales]  WITH CHECK ADD FOREIGN KEY([IdUsuarioAlta])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
USE [master]
GO
ALTER DATABASE [MarvelDB] SET  READ_WRITE 
GO
