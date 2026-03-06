-- Mostrar todos los vendedores y las propiedades que han vendido (usar RIGHT JOIN para incluir vendedores sin ventas).
SELECT 
    a.Nombre AS agente,
    p.Direccion AS propiedad
FROM Contratos c
RIGHT JOIN Agente a 
    ON c.ID_Agente = a.ID_Agente
LEFT JOIN Propiedades p 
    ON c.ID_Propiedad = p.ID_Propiedad;
    