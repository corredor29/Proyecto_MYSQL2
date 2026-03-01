CREATE TABLE ReporteMensualMora (
    ID_Reporte INT AUTO_INCREMENT PRIMARY KEY,
    MesReporte DATE,
    ID_Contrato INT,
    ID_Cliente INT,
    ID_Propiedad INT,
    FechaGeneracion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE EVENT ev_reporte_mora_simple
ON SCHEDULE
EVERY 1 MONTH
STARTS '2026-03-01 00:00:00'
DO
BEGIN

    INSERT INTO ReporteMensualMora
    (MesReporte, ID_Contrato, ID_Cliente, ID_Propiedad)

    SELECT 
        CURDATE(),
        c.ID_Contrato,
        c.ID_Cliente,
        c.ID_Propiedad

    FROM Contratos c

    WHERE c.TipoContrato = 'ARRIENDO'
        AND c.Estado = 'ACTIVO'
        AND NOT EXISTS (
            SELECT 1 
            FROM Pagos p
            WHERE p.ID_Contrato = c.ID_Contrato
                AND MONTH(p.Fecha) = MONTH(CURDATE())
                AND YEAR(p.Fecha) = YEAR(CURDATE())
        );

END$$

DELIMITER ;