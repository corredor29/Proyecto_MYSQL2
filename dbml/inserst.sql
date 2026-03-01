USE Inmobiliaria;


-- Catalogos

INSERT INTO TipoPropiedad (nombre) VALUES
('Casa'),
('Apartamento'),
('Local Comercial');

INSERT INTO EstadoPropiedad (Nombre) VALUES
('Disponible'),
('Arrendada'),
('Vendida');


--  Clientes

INSERT INTO Clientes (Nombre, Apellidos) VALUES
('Juan', 'Perez'),
('Maria', 'Gomez'),
('Carlos', 'Rodriguez');


--  Agentes

INSERT INTO Agente (Nombre, Apellidos, PorcentajeComision) VALUES
('Ana', 'Martinez', 3.00),
('Luis', 'Ramirez', 2.50);


--  Propiedades

INSERT INTO Propiedades (Direccion, IDTipoPropiedad, ID_EstadoPropiedad) VALUES
('Calle 10 #20-30', 1, 1),
('Carrera 5 #12-45 Apto 301', 2, 1),
('Av Principal #99-10 Local 2', 3, 1);


--  Contratos

INSERT INTO Contratos (ID_Cliente, ID_Propiedad, ID_Agente, TipoContrato, FechaFirma, Estado) VALUES
(1, 2, 1, 'ARRIENDO', '2026-02-01', 'ACTIVO'),
(2, 1, 2, 'VENTA', '2026-01-15', 'ACTIVO');


--  Detalle Arriendo

INSERT INTO ContratoArriendo 
(ID_Contrato, FechaInicio, FechaFin, CanonMensual, Deposito, DiaPago)
VALUES
(1, '2026-02-01', NULL, 1200000.00, 1200000.00, 5);


--  Detalle Venta

INSERT INTO ContratoVenta
(ID_Contrato, PrecioVenta, FechaCierre)
VALUES
(2, 250000000.00, '2026-02-20');


--  Pagos

INSERT INTO Pagos (ID_Contrato, Fecha, Valor, Concepto, EstadoPago) VALUES
(1, '2026-02-05', 1200000.00, 'ARRIENDO', 'APLICADO'),
(1, '2026-03-05', 1200000.00, 'ARRIENDO', 'APLICADO'),
(1, '2026-02-01', 1200000.00, 'DEPOSITO', 'APLICADO'),
(2, '2026-01-20', 50000000.00, 'ABONO', 'APLICADO');