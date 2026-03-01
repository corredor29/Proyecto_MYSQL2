CREATE TABLE AuditoriaEstadoPropiedad (
    ID_Auditoria INT AUTO_INCREMENT PRIMARY KEY,
    ID_Propiedad INT NOT NULL,
    EstadoAnterior INT NOT NULL,
    EstadoNuevo INT NOT NULL,
    FechaCambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UsuarioBD VARCHAR(100) NOT NULL
);

CREATE TABLE AuditoriaContrato (
    ID_Auditoria INT AUTO_INCREMENT PRIMARY KEY,
    ID_Contrato INT NOT NULL,
    Accion VARCHAR(20) NOT NULL,
    FechaAccion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UsuarioBD VARCHAR(100) NOT NULL
);

--- cambio estado propiedad

DELIMITER $$

CREATE TRIGGER trg_auditoria_estado_propiedad
AFTER UPDATE ON Propiedades
FOR EACH ROW
BEGIN
    IF OLD.ID_EstadoPropiedad <> NEW.ID_EstadoPropiedad THEN
        INSERT INTO AuditoriaEstadoPropiedad
        (ID_Propiedad, EstadoAnterior, EstadoNuevo, UsuarioBD)
        VALUES
        (OLD.ID_Propiedad, OLD.ID_EstadoPropiedad, NEW.ID_EstadoPropiedad, CURRENT_USER());
    END IF;
END$$

DELIMITER ;

--- auditoria contratos

DELIMITER $$

CREATE TRIGGER trg_auditoria_nuevo_contrato
AFTER INSERT ON Contratos
FOR EACH ROW
BEGIN
    INSERT INTO AuditoriaContrato
        (ID_Contrato, Accion, UsuarioBD)
    VALUES
        (NEW.ID_Contrato, 'CREADO', CURRENT_USER());
END$$

DELIMITER ;