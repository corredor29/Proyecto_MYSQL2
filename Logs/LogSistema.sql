DELIMITER $$

CREATE TRIGGER trg_log_estado_propiedad
AFTER UPDATE ON Propiedades
FOR EACH ROW
BEGIN
    IF OLD.ID_EstadoPropiedad <> NEW.ID_EstadoPropiedad THEN
        INSERT INTO LogSistema
        (TablaAfectada, TipoAccion, Descripcion, UsuarioBD)
        VALUES
        (
            'Propiedades',
            'UPDATE',
            CONCAT('Cambio de estado propiedad ID ',
                    OLD.ID_Propiedad,
                    ' de ',
                    OLD.ID_EstadoPropiedad,
                    ' a ',
                    NEW.ID_EstadoPropiedad),
            CURRENT_USER()
        );
    END IF;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_log_nuevo_contrato
AFTER INSERT ON Contratos
FOR EACH ROW
BEGIN
    INSERT INTO LogSistema
    (TablaAfectada, TipoAccion, Descripcion, UsuarioBD)
    VALUES
    (
        'Contratos',
        'INSERT',
        CONCAT('Nuevo contrato ID ', NEW.ID_Contrato),
        CURRENT_USER()
    );
END$$

DELIMITER ;