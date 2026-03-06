-- Obtener las propiedades vendidas con un valor entre 150 millones y 400 millones (BETWEEN)
SELECT 
    p.*
FROM Propiedades p
JOIN Contratos c 
    ON p.ID_Propiedad = c.ID_Propiedad
JOIN ContratoVenta cv 
    ON c.ID_Contrato = cv.ID_Contrato
WHERE cv.PrecioVenta BETWEEN 150000000 AND 400000000;