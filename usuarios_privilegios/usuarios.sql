CREATE ROLE rol_admin;
CREATE ROLE rol_agente;
CREATE ROLE rol_contador;

GRANT ALL PRIVILEGES ON Inmobiliaria.* TO rol_admin WITH GRANT OPTION;

GRANT SELECT, INSERT, UPDATE ON Inmobiliaria.Propiedades TO rol_agente;

GRANT SELECT, INSERT, UPDATE ON Inmobiliaria.Contratos TO rol_agente;

GRANT SELECT ON Inmobiliaria.Clientes TO rol_agente;

GRANT SELECT, INSERT, UPDATE ON Inmobiliaria.Pagos TO rol_contador;

GRANT SELECT ON Inmobiliaria.Contratos TO rol_contador;

GRANT SELECT ON Inmobiliaria.ReporteMensualMora TO rol_contador;

GRANT SELECT ON Inmobiliaria.Clientes TO rol_contador;

CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'Admin123!';
CREATE USER 'agente_user'@'localhost' IDENTIFIED BY 'Agente123!';
CREATE USER 'contador_user'@'localhost' IDENTIFIED BY 'Conta123!';

GRANT rol_admin TO 'admin_user'@'localhost';
GRANT rol_agente TO 'agente_user'@'localhost';
GRANT rol_contador TO 'contador_user'@'localhost';

SET DEFAULT ROLE rol_admin TO 'admin_user'@'localhost';
SET DEFAULT ROLE rol_agente TO 'agente_user'@'localhost';
SET DEFAULT ROLE rol_contador TO 'contador_user'@'localhost';

FLUSH PRIVILEGES;