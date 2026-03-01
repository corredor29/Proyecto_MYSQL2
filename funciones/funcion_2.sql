--- Función para calcular la deuda de un contrato de arriendo


DELIMITER $$

CREATE FUNCTION CalcularDeuda(p_ID_Contrato INT)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    DECLARE v_canon DECIMAL(12,2);
    DECLARE v_pagado DECIMAL(12,2);
    DECLARE v_deuda DECIMAL(12,2);

    SELECT CanonMensual
    INTO v_canon
    FROM ContratoArriendo
    WHERE ID_Contrato = p_ID_Contrato;

    SELECT IFNULL(SUM(Valor),0)
    INTO v_pagado
    FROM Pagos
    WHERE ID_Contrato = p_ID_Contrato;

    SET v_deuda = v_canon - v_pagado;

    RETURN v_deuda;
END$$

DELIMITER ;

--- para su uso SELECT CalcularDeuda(1);