USE [master]
GO
/****** Object:  Database [TallerMantenimientoBD]    Script Date: 15/8/2023 0:35:32 ******/
CREATE DATABASE [TallerMantenimientoBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TallerMantenimientoBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TallerMantenimientoBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TallerMantenimientoBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TallerMantenimientoBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TallerMantenimientoBD] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TallerMantenimientoBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TallerMantenimientoBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TallerMantenimientoBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TallerMantenimientoBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TallerMantenimientoBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TallerMantenimientoBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [TallerMantenimientoBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TallerMantenimientoBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TallerMantenimientoBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TallerMantenimientoBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TallerMantenimientoBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TallerMantenimientoBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TallerMantenimientoBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TallerMantenimientoBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TallerMantenimientoBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TallerMantenimientoBD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TallerMantenimientoBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TallerMantenimientoBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TallerMantenimientoBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TallerMantenimientoBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TallerMantenimientoBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TallerMantenimientoBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TallerMantenimientoBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TallerMantenimientoBD] SET RECOVERY FULL 
GO
ALTER DATABASE [TallerMantenimientoBD] SET  MULTI_USER 
GO
ALTER DATABASE [TallerMantenimientoBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TallerMantenimientoBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TallerMantenimientoBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TallerMantenimientoBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TallerMantenimientoBD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TallerMantenimientoBD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TallerMantenimientoBD', N'ON'
GO
ALTER DATABASE [TallerMantenimientoBD] SET QUERY_STORE = ON
GO
ALTER DATABASE [TallerMantenimientoBD] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TallerMantenimientoBD]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 15/8/2023 0:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[Cedula] [nvarchar](20) NOT NULL,
	[Correo] [nvarchar](100) NOT NULL,
	[Telefono] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mantenimiento]    Script Date: 15/8/2023 0:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mantenimiento](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](20) NULL,
	[ClienteID] [int] NULL,
	[MecanicoID] [int] NULL,
	[VehiculoID] [int] NULL,
	[FechaMantenimiento] [datetime] NULL,
	[Diagnostico] [nvarchar](200) NULL,
	[Tipo] [nvarchar](20) NULL,
	[Precio] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MantenimientoRepuesto]    Script Date: 15/8/2023 0:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MantenimientoRepuesto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MantenimientoID] [int] NOT NULL,
	[RepuestoID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MantenimientoServicio]    Script Date: 15/8/2023 0:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MantenimientoServicio](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MantenimientoID] [int] NOT NULL,
	[ServicioID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mecanico]    Script Date: 15/8/2023 0:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mecanico](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[Cedula] [nvarchar](20) NOT NULL,
	[Especialidad] [nvarchar](50) NOT NULL,
	[Salario] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Repuesto]    Script Date: 15/8/2023 0:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Repuesto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 15/8/2023 0:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicio](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehiculo]    Script Date: 15/8/2023 0:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehiculo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Placa] [nvarchar](20) NOT NULL,
	[Marca] [nvarchar](50) NOT NULL,
	[Modelo] [nvarchar](50) NOT NULL,
	[Color] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Mantenimiento]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Mantenimiento] FOREIGN KEY([ClienteID])
REFERENCES [dbo].[Cliente] ([ID])
GO
ALTER TABLE [dbo].[Mantenimiento] CHECK CONSTRAINT [FK_Cliente_Mantenimiento]
GO
ALTER TABLE [dbo].[Mantenimiento]  WITH CHECK ADD  CONSTRAINT [FK_Mecanico_Mantenimiento] FOREIGN KEY([MecanicoID])
REFERENCES [dbo].[Mecanico] ([ID])
GO
ALTER TABLE [dbo].[Mantenimiento] CHECK CONSTRAINT [FK_Mecanico_Mantenimiento]
GO
ALTER TABLE [dbo].[Mantenimiento]  WITH CHECK ADD  CONSTRAINT [FK_Vehiculo_Mantenimiento] FOREIGN KEY([VehiculoID])
REFERENCES [dbo].[Vehiculo] ([ID])
GO
ALTER TABLE [dbo].[Mantenimiento] CHECK CONSTRAINT [FK_Vehiculo_Mantenimiento]
GO
ALTER TABLE [dbo].[MantenimientoRepuesto]  WITH CHECK ADD  CONSTRAINT [FK_Mantenimiento_MantenimientoRepuesto] FOREIGN KEY([MantenimientoID])
REFERENCES [dbo].[Mantenimiento] ([ID])
GO
ALTER TABLE [dbo].[MantenimientoRepuesto] CHECK CONSTRAINT [FK_Mantenimiento_MantenimientoRepuesto]
GO
ALTER TABLE [dbo].[MantenimientoRepuesto]  WITH CHECK ADD  CONSTRAINT [FK_Repuesto_MantenimientoRepuesto] FOREIGN KEY([RepuestoID])
REFERENCES [dbo].[Repuesto] ([ID])
GO
ALTER TABLE [dbo].[MantenimientoRepuesto] CHECK CONSTRAINT [FK_Repuesto_MantenimientoRepuesto]
GO
ALTER TABLE [dbo].[MantenimientoServicio]  WITH CHECK ADD  CONSTRAINT [FK_Mantenimiento_MantenimientoServicio] FOREIGN KEY([MantenimientoID])
REFERENCES [dbo].[Mantenimiento] ([ID])
GO
ALTER TABLE [dbo].[MantenimientoServicio] CHECK CONSTRAINT [FK_Mantenimiento_MantenimientoServicio]
GO
ALTER TABLE [dbo].[MantenimientoServicio]  WITH CHECK ADD  CONSTRAINT [FK_Servicio_MantenimientoServicio] FOREIGN KEY([ServicioID])
REFERENCES [dbo].[Servicio] ([ID])
GO
ALTER TABLE [dbo].[MantenimientoServicio] CHECK CONSTRAINT [FK_Servicio_MantenimientoServicio]
GO
/****** Object:  StoredProcedure [dbo].[SP_CLIENTE_CRUD]    Script Date: 15/8/2023 0:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CLIENTE_CRUD]
    @ACCION CHAR(1), -- 'C' para crear, 'R' para leer, 'U' para actualizar, 'D' para desactivar
    @ID INT = NULL,
    @NOMBRE NVARCHAR(50) = NULL,
    @APELLIDO NVARCHAR(50) = NULL,
    @CEDULA NVARCHAR(20) = NULL,
    @CORREO NVARCHAR(100) = NULL,
    @TELEFONO NVARCHAR(20) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF (@ACCION = 'C')
    BEGIN
        -- Insertar nuevo cliente
        INSERT INTO Cliente (Nombre, Apellido, Cedula, Correo, Telefono)
        VALUES (@NOMBRE, @APELLIDO, @CEDULA, @CORREO, @TELEFONO);
    END

    IF (@ACCION = 'R')
    BEGIN
        -- Leer todos los clientes o uno específico
        IF @ID IS NULL
            SELECT * FROM Cliente;
        ELSE
            SELECT * FROM Cliente WHERE ID = @ID;
    END

    IF (@ACCION = 'U')
    BEGIN
        -- Actualizar un cliente existente
        UPDATE Cliente SET
        Nombre = ISNULL(@NOMBRE, Nombre),
        Apellido = ISNULL(@APELLIDO, Apellido),
        Cedula = ISNULL(@CEDULA, Cedula),
        Correo = ISNULL(@CORREO, Correo),
        Telefono = ISNULL(@TELEFONO, Telefono)
        WHERE ID = @ID;
    END

    IF (@ACCION = 'D')
    BEGIN
        -- Eliminar un cliente existente
        DELETE FROM Cliente WHERE ID = @ID;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_MANTENIMIENTO_CRUD]    Script Date: 15/8/2023 0:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_MANTENIMIENTO_CRUD]
    @ACCION CHAR(1), -- 'C' para crear, 'R' para leer, 'U' para actualizar, 'D' para eliminar
    @ID INT = NULL,
    @CODIGO NVARCHAR(20) = NULL,
    @CLIENTE_ID INT = NULL,
    @MECANICO_ID INT = NULL,
    @VEHICULO_ID INT = NULL,
    @FECHA_MANTENIMIENTO DATETIME = NULL,
    @DIAGNOSTICO NVARCHAR(200) = NULL,
    @TIPO NVARCHAR(20) = NULL,
    @PRECIO DECIMAL(10, 2) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF (@ACCION = 'C')
    BEGIN
        -- Insertar nuevo mantenimiento
        INSERT INTO Mantenimiento (Codigo, ClienteID, MecanicoID, VehiculoID, FechaMantenimiento, Diagnostico, Tipo, Precio) 
        VALUES (@CODIGO, @CLIENTE_ID, @MECANICO_ID, @VEHICULO_ID, @FECHA_MANTENIMIENTO, @DIAGNOSTICO, @TIPO, @PRECIO);
    END

    IF (@ACCION = 'R')
    BEGIN
        -- Leer todos los mantenimientos o uno específico por ID
        IF @ID IS NULL
            SELECT * FROM Mantenimiento;
        ELSE
            SELECT * FROM Mantenimiento WHERE ID = @ID;
    END

    IF (@ACCION = 'U')
    BEGIN
        -- Actualizar un mantenimiento existente
        UPDATE Mantenimiento SET 
        Codigo = ISNULL(@CODIGO, Codigo),
        ClienteID = ISNULL(@CLIENTE_ID, ClienteID),
        MecanicoID = ISNULL(@MECANICO_ID, MecanicoID),
        VehiculoID = ISNULL(@VEHICULO_ID, VehiculoID),
        FechaMantenimiento = ISNULL(@FECHA_MANTENIMIENTO, FechaMantenimiento),
        Diagnostico = ISNULL(@DIAGNOSTICO, Diagnostico),
        Tipo = ISNULL(@TIPO, Tipo),
        Precio = ISNULL(@PRECIO, Precio)
        WHERE ID = @ID;
    END

    IF (@ACCION = 'D')
    BEGIN
        -- Eliminar un mantenimiento existente
        DELETE FROM Mantenimiento WHERE ID = @ID;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_MECANICO_CRUD]    Script Date: 15/8/2023 0:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_MECANICO_CRUD]
    @ACCION CHAR(1), -- 'C' para crear, 'R' para leer, 'U' para actualizar, 'D' para eliminar
    @ID INT = NULL,
    @NOMBRE NVARCHAR(50) = NULL,
    @APELLIDO NVARCHAR(50) = NULL,
    @CEDULA NVARCHAR(20) = NULL,
    @ESPECIALIDAD NVARCHAR(50) = NULL,
    @SALARIO FLOAT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF (@ACCION = 'C')
    BEGIN
        -- Insertar nuevo mecanico
        INSERT INTO Mecanico (Nombre, Apellido, Cedula, Especialidad, Salario) 
        VALUES (@NOMBRE, @APELLIDO, @CEDULA, @ESPECIALIDAD, @SALARIO);
    END

    IF (@ACCION = 'R')
    BEGIN
        -- Leer todos los mecanicos o uno específico
        IF @ID IS NULL
            SELECT * FROM Mecanico;
        ELSE
            SELECT * FROM Mecanico WHERE ID = @ID;
    END

    IF (@ACCION = 'U')
    BEGIN
        -- Actualizar un mecanico existente
        UPDATE Mecanico SET 
        Nombre = ISNULL(@NOMBRE, Nombre),
        Apellido = ISNULL(@APELLIDO, Apellido),
        Cedula = ISNULL(@CEDULA, Cedula),
        Especialidad = ISNULL(@ESPECIALIDAD, Especialidad),
        Salario = ISNULL(@SALARIO, Salario)
        WHERE ID = @ID;
    END

    IF (@ACCION = 'D')
    BEGIN
        -- Eliminar un mecanico existente
        DELETE FROM Mecanico WHERE ID = @ID;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_VEHICULO_CRUD]    Script Date: 15/8/2023 0:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_VEHICULO_CRUD]
    @ACCION CHAR(1), -- 'C' para crear, 'R' para leer, 'U' para actualizar, 'D' para eliminar
    @ID INT = NULL,
    @PLACA NVARCHAR(10) = NULL,
    @MARCA NVARCHAR(50) = NULL,
    @MODELO NVARCHAR(50) = NULL,
    @COLOR NVARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF (@ACCION = 'C')
    BEGIN
        -- Insertar nuevo vehiculo
        INSERT INTO Vehiculo (Placa, Marca, Modelo, Color) 
        VALUES (@PLACA, @MARCA, @MODELO, @COLOR);
    END

    IF (@ACCION = 'R')
    BEGIN
        -- Leer todos los vehiculos o uno específico
        IF @ID IS NULL
            SELECT * FROM Vehiculo;
        ELSE
            SELECT * FROM Vehiculo WHERE ID = @ID;
    END

    IF (@ACCION = 'U')
    BEGIN
        -- Actualizar un vehiculo existente
        UPDATE Vehiculo SET 
        Placa = ISNULL(@PLACA, Placa),
        Marca = ISNULL(@MARCA, Marca),
        Modelo = ISNULL(@MODELO, Modelo),
        Color = ISNULL(@COLOR, Color)
        WHERE ID = @ID;
    END

    IF (@ACCION = 'D')
    BEGIN
        -- Eliminar un vehiculo existente
        DELETE FROM Vehiculo WHERE ID = @ID;
    END
END
GO
USE [master]
GO
ALTER DATABASE [TallerMantenimientoBD] SET  READ_WRITE 
GO
