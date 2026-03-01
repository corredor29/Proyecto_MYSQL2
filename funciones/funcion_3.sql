--- Función para contar el total de propiedades disponibles por tipo


DELIMITER $$

CREATE FUNCTION TotalDisponibles(p_IDTipo INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_total INT;

    SELECT COUNT(*)
    INTO v_total
    FROM Propiedades
    WHERE IDTipoPropiedad = p_IDTipo
        AND ID_EstadoPropiedad = 1; 

    RETURN v_total;
END$$

DELIMITER ;

--- para su uso SELECT TotalDisponibles(1);