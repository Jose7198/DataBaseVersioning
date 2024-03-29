USE [master]
GO
/****** Object:  Database [PedidosTest]    Script Date: 7/6/2019 13:09:17 ******/
CREATE DATABASE [PedidosTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pedidos1', FILENAME = N'D:\test\Data\pedidos1.mdf' , SIZE = 5120KB , MAXSIZE = 10240KB , FILEGROWTH = 10%), 
 FILEGROUP [Secundario] 
( NAME = N'pedidos2', FILENAME = N'D:\test\Data\pedidos2.ndf' , SIZE = 5120KB , MAXSIZE = 10240KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'pedidos1_log', FILENAME = N'D:\test\Log\pedidos1log.ldf' , SIZE = 4096KB , MAXSIZE = 8192KB , FILEGROWTH = 1024KB )
GO
ALTER DATABASE [PedidosTest] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PedidosTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PedidosTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PedidosTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PedidosTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PedidosTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PedidosTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [PedidosTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PedidosTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PedidosTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PedidosTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PedidosTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PedidosTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PedidosTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PedidosTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PedidosTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PedidosTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PedidosTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PedidosTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PedidosTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PedidosTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PedidosTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PedidosTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PedidosTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PedidosTest] SET RECOVERY FULL 
GO
ALTER DATABASE [PedidosTest] SET  MULTI_USER 
GO
ALTER DATABASE [PedidosTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PedidosTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PedidosTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PedidosTest] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PedidosTest] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PedidosTest', N'ON'
GO
ALTER DATABASE [PedidosTest] SET QUERY_STORE = OFF
GO
USE [PedidosTest]
GO
/****** Object:  Schema [catalogo]    Script Date: 7/6/2019 13:09:21 ******/
CREATE SCHEMA [catalogo]
GO
/****** Object:  Schema [movimiento]    Script Date: 7/6/2019 13:09:21 ******/
CREATE SCHEMA [movimiento]
GO
/****** Object:  Table [catalogo].[Ciudad]    Script Date: 7/6/2019 13:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [catalogo].[Ciudad](
	[codciu] [char](3) NOT NULL,
	[nombre] [varchar](40) NULL,
 CONSTRAINT [pk_Ciudad] PRIMARY KEY CLUSTERED 
(
	[codciu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
) ON [Secundario]
GO
/****** Object:  Table [catalogo].[Cliente]    Script Date: 7/6/2019 13:09:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [catalogo].[Cliente](
	[codcli] [char](6) NOT NULL,
	[codciu] [char](3) NOT NULL,
	[garante] [char](6) NOT NULL,
	[direnvio] [varchar](80) NULL,
	[credito] [numeric](7, 2) NULL,
	[descuento] [numeric](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[codcli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [catalogo].[ClienteTemp]    Script Date: 7/6/2019 13:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [catalogo].[ClienteTemp](
	[codcli] [char](3) NOT NULL,
	[codciu] [char](3) NOT NULL,
	[garante] [char](3) NOT NULL,
	[direnvio] [varchar](80) NULL,
	[credito] [numeric](7, 2) NULL,
	[descuento] [numeric](5, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [catalogo].[Producto]    Script Date: 7/6/2019 13:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [catalogo].[Producto](
	[codpro] [char](3) NOT NULL,
	[nomprod] [varchar](40) NULL,
	[preunit] [numeric](7, 2) NULL,
	[stock] [smallint] NULL,
 CONSTRAINT [pk_Producto] PRIMARY KEY CLUSTERED 
(
	[codpro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
) ON [Secundario]
GO
/****** Object:  Table [catalogo].[Proveedor]    Script Date: 7/6/2019 13:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [catalogo].[Proveedor](
	[codprov] [char](3) NOT NULL,
	[nomprov] [varchar](40) NULL,
 CONSTRAINT [pk_Proveedor] PRIMARY KEY CLUSTERED 
(
	[codprov] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
) ON [Secundario]
GO
/****** Object:  Table [catalogo].[Telprov]    Script Date: 7/6/2019 13:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [catalogo].[Telprov](
	[numtelf] [char](10) NOT NULL,
	[codprov] [char](3) NOT NULL,
 CONSTRAINT [pk_Telprov] PRIMARY KEY CLUSTERED 
(
	[numtelf] ASC,
	[codprov] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
) ON [Secundario]
GO
/****** Object:  Table [movimiento].[CabezeraP]    Script Date: 7/6/2019 13:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [movimiento].[CabezeraP](
	[codped] [char](10) NOT NULL,
	[fecha] [datetime] NULL,
	[montototal] [numeric](10, 2) NULL,
	[codcli] [char](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codped] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [movimiento].[CabezeraPTemp]    Script Date: 7/6/2019 13:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [movimiento].[CabezeraPTemp](
	[codped] [char](3) NOT NULL,
	[fecha] [datetime] NULL,
	[montototal] [numeric](10, 2) NULL,
	[codcli] [char](3) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [movimiento].[DetalleP]    Script Date: 7/6/2019 13:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [movimiento].[DetalleP](
	[numlinea] [tinyint] NOT NULL,
	[preciou] [numeric](7, 2) NULL,
	[cantidad] [smallint] NULL,
	[codped] [char](10) NOT NULL,
	[codpro] [char](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[numlinea] ASC,
	[codped] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [movimiento].[DetallePTemp]    Script Date: 7/6/2019 13:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [movimiento].[DetallePTemp](
	[numlinea] [tinyint] NOT NULL,
	[preciou] [numeric](7, 2) NULL,
	[cantidad] [smallint] NULL,
	[codped] [char](3) NOT NULL,
	[codpro] [char](3) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [movimiento].[Provee]    Script Date: 7/6/2019 13:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [movimiento].[Provee](
	[codprov] [char](3) NOT NULL,
	[codpro] [char](3) NOT NULL,
	[cantidad] [smallint] NULL,
 CONSTRAINT [pk_Provee] PRIMARY KEY CLUSTERED 
(
	[codprov] ASC,
	[codpro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [catalogo].[Cliente]  WITH CHECK ADD  CONSTRAINT [CK_codcli] CHECK  (([codcli] like 'C[0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [catalogo].[Cliente] CHECK CONSTRAINT [CK_codcli]
GO
ALTER TABLE [catalogo].[Cliente]  WITH CHECK ADD  CONSTRAINT [CK_credito] CHECK  (([credito]<=(2000)))
GO
ALTER TABLE [catalogo].[Cliente] CHECK CONSTRAINT [CK_credito]
GO
ALTER TABLE [catalogo].[Cliente]  WITH CHECK ADD  CONSTRAINT [Ck_descuento] CHECK  (([descuento]<=(100) AND [descuento]>=(0)))
GO
ALTER TABLE [catalogo].[Cliente] CHECK CONSTRAINT [Ck_descuento]
GO
ALTER TABLE [catalogo].[Cliente]  WITH CHECK ADD  CONSTRAINT [CK_garante] CHECK  (([garante] like 'C[0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [catalogo].[Cliente] CHECK CONSTRAINT [CK_garante]
GO
ALTER TABLE [movimiento].[CabezeraP]  WITH CHECK ADD  CONSTRAINT [CK_codcli] CHECK  (([codcli] like 'C[0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [movimiento].[CabezeraP] CHECK CONSTRAINT [CK_codcli]
GO
ALTER TABLE [movimiento].[CabezeraP]  WITH CHECK ADD  CONSTRAINT [CK_codped] CHECK  (([codped] like 'PE[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [movimiento].[CabezeraP] CHECK CONSTRAINT [CK_codped]
GO
ALTER TABLE [movimiento].[DetalleP]  WITH CHECK ADD  CONSTRAINT [CK_codped_Detalle] CHECK  (([codped] like 'PE[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [movimiento].[DetalleP] CHECK CONSTRAINT [CK_codped_Detalle]
GO
USE [master]
GO
ALTER DATABASE [PedidosTest] SET  READ_WRITE 
GO
