DELIMITER $$

CREATE PROCEDURE RegistrarPago(
    IN p_ID_Contrato INT,
    IN p_Valor DECIMAL(12,2)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO LogErrores
        (Procedimiento, MensajeError, CodigoError)
        VALUES
        (
            'RegistrarPago',
            'Error al insertar pago',
            1
        );
    END;

    INSERT INTO Pagos
    (ID_Contrato, Fecha, Valor, Concepto, EstadoPago)
    VALUES
    (p_ID_Contrato, CURDATE(), p_Valor, 'ARRIENDO', 'APLICADO');

END$$

DELIMITER ;