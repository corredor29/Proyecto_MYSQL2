--- Función para calcular la comisión de un contrato de venta

DELIMITER $$

CREATE FUNCTION CalcularComision(p_ID_Contrato INT)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    DECLARE v_precio DECIMAL(12,2);
    DECLARE v_porcentaje DECIMAL(5,2);
    DECLARE v_comision DECIMAL(12,2);

    SELECT cv.PrecioVenta, a.PorcentajeComision
    INTO v_precio, v_porcentaje
    FROM Contratos c
    JOIN ContratoVenta cv ON c.ID_Contrato = cv.ID_Contrato
    JOIN Agente a ON c.ID_Agente = a.ID_Agente
    WHERE c.ID_Contrato = p_ID_Contrato;

    SET v_comision = v_precio * (v_porcentaje / 100);

    RETURN v_comision;
END$$

DELIMITER ;

--- para su uso SELECT CalcularComision(2);
