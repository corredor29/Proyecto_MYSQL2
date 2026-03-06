-- Crear una vista llamada vista_resumen_ventas que muestre vendedor, total vendido y número de clientes atendidos.

CREATE VIEW vista_resumen_ventas AS
SELECT 
    a.Nombre AS agente,
    SUM(cv.PrecioVenta) AS total_vendido,
    COUNT(DISTINCT c.ID_Cliente) AS numero_clientes
FROM Contratos c
JOIN Agente a 
    ON c.ID_Agente = a.ID_Agente
JOIN ContratoVenta cv 
    ON c.ID_Contrato = cv.ID_Contrato
GROUP BY a.Nombre;