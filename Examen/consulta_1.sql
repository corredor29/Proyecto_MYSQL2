-- Mostrar el nombre del vendedor y la cantidad total de propiedades vendidas (usar JOIN y GROUP BY).

SELECT 
    a.Nombre AS agente,
    COUNT(cv.ID_Contrato) AS total_propiedades_vendidas
FROM Agente a
JOIN Contratos c 
    ON a.ID_Agente = c.ID_Agente
JOIN ContratoVenta cv 
    ON c.ID_Contrato = cv.ID_Contrato
GROUP BY a.Nombre;