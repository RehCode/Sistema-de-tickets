USE [master]
GO
/****** Object:  Database [sistemaTickets]    Script Date: 14/05/2018 01:32:52 p. m. ******/
CREATE DATABASE [sistemaTickets]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sistemaTickets', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\sistemaTickets.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'sistemaTickets_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\sistemaTickets_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [sistemaTickets] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sistemaTickets].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sistemaTickets] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sistemaTickets] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sistemaTickets] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sistemaTickets] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sistemaTickets] SET ARITHABORT OFF 
GO
ALTER DATABASE [sistemaTickets] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sistemaTickets] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sistemaTickets] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sistemaTickets] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sistemaTickets] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sistemaTickets] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sistemaTickets] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sistemaTickets] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sistemaTickets] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sistemaTickets] SET  DISABLE_BROKER 
GO
ALTER DATABASE [sistemaTickets] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sistemaTickets] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sistemaTickets] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sistemaTickets] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sistemaTickets] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sistemaTickets] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sistemaTickets] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sistemaTickets] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [sistemaTickets] SET  MULTI_USER 
GO
ALTER DATABASE [sistemaTickets] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sistemaTickets] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sistemaTickets] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sistemaTickets] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [sistemaTickets] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [sistemaTickets] SET QUERY_STORE = OFF
GO
USE [sistemaTickets]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [sistemaTickets]
GO
/****** Object:  Table [dbo].[categorias]    Script Date: 14/05/2018 01:32:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categorias](
	[categoria_id] [int] IDENTITY(1,1) NOT NULL,
	[categoria] [nvarchar](50) NULL,
 CONSTRAINT [PK_categorias] PRIMARY KEY CLUSTERED 
(
	[categoria_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departamentos]    Script Date: 14/05/2018 01:32:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departamentos](
	[departamento_id] [int] IDENTITY(1,1) NOT NULL,
	[departamento] [nvarchar](50) NULL,
 CONSTRAINT [PK_departamentos] PRIMARY KEY CLUSTERED 
(
	[departamento_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[responsables]    Script Date: 14/05/2018 01:32:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[responsables](
	[responsable_id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[apellido] [nvarchar](50) NULL,
 CONSTRAINT [PK_responsables] PRIMARY KEY CLUSTERED 
(
	[responsable_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tickets]    Script Date: 14/05/2018 01:32:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tickets](
	[ticket_id] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](max) NULL,
	[fecha] [datetime] NOT NULL,
	[fecha_solucionado] [datetime] NULL,
	[solucionado] [bit] NULL,
	[departamento_id] [int] NOT NULL,
	[nombre_interesado] [nvarchar](50) NOT NULL,
	[responsable_id] [int] NULL,
	[categoria_id] [int] NOT NULL,
	[comentario_tecnico] [nvarchar](max) NULL,
 CONSTRAINT [PK_tickets] PRIMARY KEY CLUSTERED 
(
	[ticket_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tickets] ADD  CONSTRAINT [DF_tickets_fecha]  DEFAULT (sysdatetime()) FOR [fecha]
GO
ALTER TABLE [dbo].[tickets] ADD  CONSTRAINT [DF_tickets_solucionado]  DEFAULT ((0)) FOR [solucionado]
GO
ALTER TABLE [dbo].[tickets] ADD  CONSTRAINT [DF_tickets_responsable_id]  DEFAULT ((1)) FOR [responsable_id]
GO
ALTER TABLE [dbo].[tickets]  WITH CHECK ADD  CONSTRAINT [FK_tickets_categorias] FOREIGN KEY([categoria_id])
REFERENCES [dbo].[categorias] ([categoria_id])
GO
ALTER TABLE [dbo].[tickets] CHECK CONSTRAINT [FK_tickets_categorias]
GO
ALTER TABLE [dbo].[tickets]  WITH CHECK ADD  CONSTRAINT [FK_tickets_departamentos] FOREIGN KEY([departamento_id])
REFERENCES [dbo].[departamentos] ([departamento_id])
GO
ALTER TABLE [dbo].[tickets] CHECK CONSTRAINT [FK_tickets_departamentos]
GO
ALTER TABLE [dbo].[tickets]  WITH CHECK ADD  CONSTRAINT [FK_tickets_responsables] FOREIGN KEY([responsable_id])
REFERENCES [dbo].[responsables] ([responsable_id])
GO
ALTER TABLE [dbo].[tickets] CHECK CONSTRAINT [FK_tickets_responsables]
GO
/****** Object:  StoredProcedure [dbo].[nuevoTicket]    Script Date: 14/05/2018 01:32:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[nuevoTicket](
	@titulo nvarchar(50),
	@descripcion nvarchar(max),
	@departamento_id int,
	@nombre_interesado nvarchar(50),
	@categoria_id int
)
as
begin
	insert into tickets (titulo, descripcion, departamento_id, nombre_interesado, categoria_id)
	values (@titulo, @descripcion, @departamento_id, @nombre_interesado, @categoria_id)
end
GO
USE [master]
GO
ALTER DATABASE [sistemaTickets] SET  READ_WRITE 
GO
