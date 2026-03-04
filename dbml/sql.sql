CREATE DATABASE  Inmobiliaria;
USE Inmobiliaria;

CREATE TABLE TipoPropiedad (
    idTipoPropiedad INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL UNIQUE
);
CREATE TABLE EstadoPropiedad(
    ID_EstadoPropiedad INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(30) NOT NULL UNIQUE
);
CREATE TABLE Propiedades(
    ID_Propiedad INT AUTO_INCREMENT PRIMARY KEY,
    Direccion VARCHAR(150) NOT NULL,
    IDTipoPropiedad INT NOT NULL,
    ID_EstadoPropiedad INT NOT NULL,
    FOREIGN KEY (IDTipoPropiedad) REFERENCES TipoPropiedad(idTipoPropiedad),
    FOREIGN KEY (ID_EstadoPropiedad) REFERENCES EstadoPropiedad(ID_EstadoPropiedad)
);
CREATE TABLE Clientes (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL
);
CREATE TABLE Agente (
    ID_Agente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(60) NOT NULL,
    Apellidos VARCHAR(60) NOT NULL,
    PorcentajeComision DECIMAL(5,2) NOT NULL DEFAULT 3.00
);
CREATE TABLE Contratos(
    ID_Contrato INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT NOT NULL,
    ID_Propiedad INT NOT NULL,
    ID_Agente INT NOT NULL,
    TipoContrato ENUM('ARRIENDO','VENTA') NOT NULL,
    FechaFirma DATE NOT NULL,
    Estado ENUM('ACTIVO','FINALIZADO','CANCELADO') NOT NULL DEFAULT 'ACTIVO',
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
    FOREIGN KEY (ID_Propiedad) REFERENCES Propiedades(ID_Propiedad),
    FOREIGN KEY (ID_Agente) REFERENCES Agente(ID_Agente)
);
CREATE TABLE ContratoArriendo (
    ID_Contrato INT PRIMARY KEY,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NULL,
    CanonMensual DECIMAL(12,2) NOT NULL,
    Deposito DECIMAL(12,2) NOT NULL DEFAULT 0,
    DiaPago TINYINT NOT NULL,
    FOREIGN KEY (ID_Contrato) REFERENCES Contratos(ID_Contrato)
);

CREATE TABLE ContratoVenta (
    ID_Contrato INT PRIMARY KEY,
    PrecioVenta DECIMAL(12,2) NOT NULL,
    FechaCierre DATE NULL,
    FOREIGN KEY (ID_Contrato) REFERENCES Contratos(ID_Contrato)
);
CREATE TABLE Pagos (
    ID_Pago INT AUTO_INCREMENT PRIMARY KEY,
    ID_Contrato INT NOT NULL,
    Fecha DATE NOT NULL,
    Valor DECIMAL(12,2) NOT NULL,
    Concepto ENUM('ARRIENDO','DEPOSITO','CUOTA_VENTA','ABONO','OTRO') NOT NULL DEFAULT 'OTRO',
    EstadoPago ENUM('APLICADO','ANULADO') NOT NULL DEFAULT 'APLICADO',
    FOREIGN KEY (ID_Contrato) REFERENCES Contratos(ID_Contrato)
);
CREATE TABLE LogSistema (
    ID_Log INT AUTO_INCREMENT PRIMARY KEY,
    TablaAfectada VARCHAR(50),
    TipoAccion VARCHAR(20), 
    Descripcion TEXT,
    UsuarioBD VARCHAR(100),
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE LogErrores (
    ID_Error INT AUTO_INCREMENT PRIMARY KEY,
    Procedimiento VARCHAR(100),
    MensajeError TEXT,
    CodigoError INT,
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
