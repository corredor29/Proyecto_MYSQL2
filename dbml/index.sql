CREATE INDEX idx_contratos_cliente ON Contratos (ID_Cliente);
CREATE INDEX idx_contratos_propiedad ON Contratos (ID_Propiedad);
CREATE INDEX idx_contratos_agente ON Contratos (ID_Agente);
CREATE INDEX idx_pagos_contrato ON Pagos (ID_Contrato);
CREATE INDEX idx_pagos_contrato_fecha ON Pagos (ID_Contrato, Fecha);
CREATE INDEX idx_propiedades_tipo_estado 
ON Propiedades (IDTipoPropiedad, ID_EstadoPropiedad);
