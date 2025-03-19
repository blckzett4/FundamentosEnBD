CREATE DATABASE SistemaDeRecursosHumanos;
USE SistemaDeRecursosHumanos;

CREATE TABLE Empresa (
    id_empresa INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(150) NOT NULL
);

CREATE TABLE Departamento (
                              id_departamento INT PRIMARY KEY AUTO_INCREMENT,
                              nombre VARCHAR(100) NOT NULL,
                              id_empresa INT NOT NULL,
                              FOREIGN KEY (id_empresa) REFERENCES Empresa(id_empresa) ON DELETE CASCADE
);

CREATE TABLE Empleado (
                          id_empleado INT PRIMARY KEY AUTO_INCREMENT,
                          nombre VARCHAR(50) NOT NULL,
                          apellido VARCHAR(50) NOT NULL,
                          cargo VARCHAR(100) NOT NULL,
                          salario DECIMAL(10,2) NOT NULL CHECK (salario > 0),
                          id_departamento INT NOT NULL,
                          FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento) ON DELETE CASCADE
);

-- Insertar Empresas
INSERT INTO Empresa (nombre, ubicacion) VALUES
                                            ('Tech Solutions', 'Nueva York'),
                                            ('Innovatech', 'San Francisco');

-- Insertar Departamentos
INSERT INTO Departamento (nombre, id_empresa) VALUES
                                                  ('Desarrollo', 1),
                                                  ('Recursos Humanos', 1),
                                                  ('Ventas', 1),
                                                  ('Soporte Técnico', 2),
                                                  ('Marketing', 2);

-- Insertar Empleados
INSERT INTO Empleado (nombre, apellido, cargo, salario, id_departamento) VALUES
                                                                             ('Juan', 'Pérez', 'Desarrollador', 5000.00, 1),
                                                                             ('María', 'López', 'Gerente de RRHH', 6000.00, 2),
                                                                             ('Carlos', 'Gómez', 'Vendedor', 4000.00, 3),
                                                                             ('Ana', 'Martínez', 'Soporte Técnico', 4500.00, 4),
                                                                             ('Luis', 'Fernández', 'Especialista en Marketing', 4800.00, 5),
                                                                             ('Elena', 'Díaz', 'Líder de Proyecto', 7000.00, 1),
                                                                             ('Roberto', 'Torres', 'Analista de RRHH', 5500.00, 2),
                                                                             ('Diana', 'Hernández', 'Ejecutivo de Ventas', 4200.00, 3),
                                                                             ('Pedro', 'Sánchez', 'Técnico en Soporte', 4600.00, 4),
                                                                             ('Lucía', 'Ramírez', 'Coordinadora de Marketing', 4900.00, 5);

SELECT
    Empleado.nombre AS Nombre_Empleado,
    Empleado.apellido AS Apellido_Empleado,
    Empleado.cargo AS Cargo,
    Departamento.nombre AS Nombre_Departamento
FROM Empleado
         JOIN Departamento ON Empleado.id_departamento = Departamento.id_departamento
WHERE Departamento.id_departamento = 1;
