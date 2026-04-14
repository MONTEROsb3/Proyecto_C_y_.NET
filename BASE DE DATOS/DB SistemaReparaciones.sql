--Creacion de DB
CREATE DATABASE SistemaReparaciones;

--Eleccion de DB
USE SistemaReparaciones;

--Creacion de Tabla Usuarios
CREATE TABLE Usuarios (UsuarioID INT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL,
CorreoElectronico VARCHAR(150) NOT NULL UNIQUE,
Telefono VARCHAR(20) NOT NULL);

--Creacion de Tabla Equipos
CREATE TABLE Equipos (EquipoID INT IDENTITY(1,1) PRIMARY KEY,
TipoEquipo VARCHAR(50) NOT NULL,
Modelo VARCHAR(50) NOT NULL,
UsuarioID INT NOT NULL,
FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID));

--Creacion de Tabla Reaparaciones
CREATE TABLE Reparaciones (ReparacionID INT IDENTITY(1,1) PRIMARY KEY,
EquipoID INT NOT NULL,
FechaSolicitud DATE NOT NULL,
Estado VARCHAR(50) NOT NULL,
FOREIGN KEY (EquipoID) REFERENCES Equipos(EquipoID));

--Creacion de Tabla Detalles Reparacion
CREATE TABLE DetallesReparacion (DetalleID INT IDENTITY(1,1) PRIMARY KEY,
ReparacionID INT NOT NULL,
Descripcion VARCHAR(300) NOT NULL,
FechaInicio DATE NOT NULL,
FechaFin DATE,
FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID));

--Creacion de Tabla Tecnicos
CREATE TABLE Tecnicos ( TecnicoID INT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL,
Especialidad VARCHAR(100) NOT NULL);

--Creacion de Tabla Asignaciones
CREATE TABLE Asignaciones (AsignacionID INT IDENTITY(1,1) PRIMARY KEY,
ReparacionID INT NOT NULL,
TecnicoID INT NOT NULL,
FechaAsignacion DATE NOT NULL,   
FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID),
FOREIGN KEY (TecnicoID) REFERENCES Tecnicos(TecnicoID));

--Introduccion de datos a tabla Usuarios
INSERT INTO Usuarios (Nombre, CorreoElectronico, Telefono) VALUES
('Messi Alvarado','messi@gmail.com','88881111'),
('Cristiano Lopez','cristiano@gmail.com','88882222'),
('Brayan Ruiz','brayan@gmail.com','88883333'),
('Mariano Torres','Mariano@gmail.com','88884444'),
('Keylor Mora','Keylor@gmail.com','88885555');

--Introduccion de datos a tabla Equipos
INSERT INTO Equipos (TipoEquipo, Modelo, UsuarioID) VALUES
('Laptop','ASUS ROG',1),
('Celular','Samsung A70',2),
('Tablet','HP 360',3),
('Laptop','HP Elitebook',4),
('Celular','Xiaomi x6',5);

--Introduccion de datos a tabla Reparaciones
INSERT INTO Reparaciones (EquipoID, FechaSolicitud, Estado) VALUES
(1,'2026-02-11','Pendiente'),
(2,'2026-02-24','Pendiente'),
(3,'2026-02-28','Pendiente'),
(4,'2026-02-21','Pendiente'),
(5,'2026-02-12','Pendiente');

--Introduccion de datos a tabla Tecnicos
INSERT INTO Tecnicos (Nombre, Especialidad) VALUES
('Juan Arias','Hardware'),
('Josue Alpizar','Software'),
('Mario Arroyo','Pantallas'),
('Andrea Alvares','Baterias'),
('Jose Chavez','Diagnostico');

--Introduccion de datos a tabla Detalles Reparacion
INSERT INTO DetallesReparacion (ReparacionID, Descripcion, FechaInicio, FechaFin) VALUES
(1,'Cambio de teclado','2026-03-02',NULL),
(2,'Cambio de pantalla','2026-03-03',NULL),
(3,'Reparacion de bateria','2026-03-04',NULL),
(4,'Instalacion de sistema','2026-03-05',NULL),
(5,'Diagnostico general','2026-03-06',NULL);

--Introduccion de datos a tabla Asignaciones
INSERT INTO Asignaciones (ReparacionID, TecnicoID, FechaAsignacion) VALUES
(1,1,'2026-03-02'),
(2,3,'2026-03-03'),
(3,4,'2026-03-04'),
(4,2,'2026-03-05'),
(5,5,'2026-03-06');

--Procedimiento para registrar estado de las reparacion 
CREATE PROCEDURE sp_RegistrarReparacion
    @EquipoID INT,
    @FechaSolicitud DATE
AS
BEGIN
    INSERT INTO Reparaciones (EquipoID, FechaSolicitud, Estado)
    VALUES (@EquipoID, @FechaSolicitud, 'Pendiente');
END;
 
EXEC sp_RegistrarReparacion 1, '2026-03-10'
select * from Reparaciones

--Procedimiento para registrar Tecnico
CREATE PROCEDURE sp_AsignarTecnico
    @ReparacionID INT,
    @TecnicoID INT,
    @FechaAsignacion DATE
AS
BEGIN
    INSERT INTO Asignaciones (ReparacionID, TecnicoID, FechaAsignacion)
    VALUES (@ReparacionID, @TecnicoID, @FechaAsignacion);
END;

EXEC sp_AsignarTecnico 2, 3, '2026-03-10';

CREATE TRIGGER trg_FinalizarReparacion
ON DetallesReparacion
AFTER UPDATE
AS
BEGIN

    UPDATE Reparaciones
    SET Estado = 'Completado'
    FROM Reparaciones R
    INNER JOIN inserted I
        ON R.ReparacionID = I.ReparacionID
    WHERE I.FechaFin IS NOT NULL;

END;

--Actualizar Fecha Fin
UPDATE DetallesReparacion
SET FechaFin = '2026-03-10'
WHERE ReparacionID = 1;

select * from DetallesReparacion
select * from Reparaciones