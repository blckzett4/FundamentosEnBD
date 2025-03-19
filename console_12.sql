CREATE DATABASE SistemaDeGestionDeHospitales;
USE SistemaDeGestionDeHospitales;

CREATE TABLE Paciente (
                          id_paciente INT PRIMARY KEY AUTO_INCREMENT,
                          nombre VARCHAR(50),
                          apellido VARCHAR(50),
                          fecha_nacimiento DATE,
                          direccion VARCHAR(100),
                          telefono VARCHAR(20)
);

CREATE TABLE Medico (
                        id_medico INT PRIMARY KEY AUTO_INCREMENT,
                        nombre VARCHAR(50),
                        apellido VARCHAR(50),
                        especialidad VARCHAR(50),
                        telefono VARCHAR(20)
);

CREATE TABLE Cita (
                      id_cita INT PRIMARY KEY AUTO_INCREMENT,
                      fecha DATE,
                      hora TIME,
                      id_paciente INT,
                      id_medico INT,
                      FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
                      FOREIGN KEY (id_medico) REFERENCES Medico(id_medico)
);

CREATE TABLE Tratamiento (
                             id_tratamiento INT PRIMARY KEY AUTO_INCREMENT,
                             descripcion TEXT,
                             id_paciente INT,
                             id_medico INT,
                             FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
                             FOREIGN KEY (id_medico) REFERENCES Medico(id_medico)
);

-- Insertar datos en Paciente
INSERT INTO Paciente (nombre, apellido, fecha_nacimiento, direccion, telefono) VALUES
                                                                                   ('Juan', 'Pérez', '1990-05-14', 'Av. Siempre Viva 742', '555-1234'),
                                                                                   ('María', 'López', '1985-10-20', 'Calle Falsa 123', '555-5678'),
                                                                                   ('Carlos', 'Gómez', '1978-07-05', 'Av. Principal 456', '555-9876'),
                                                                                   ('Ana', 'Martínez', '1995-03-12', 'Calle Secundaria 789', '555-6543'),
                                                                                   ('Luis', 'Fernández', '1982-09-25', 'Paseo del Río 321', '555-3210'),
                                                                                   ('Lucía', 'Ramírez', '2000-01-30', 'Plaza Mayor 101', '555-7412'),
                                                                                   ('Pedro', 'Sánchez', '1993-06-14', 'Av. Central 222', '555-8523'),
                                                                                   ('Diana', 'Hernández', '1989-12-05', 'Callejón Azul 777', '555-9632'),
                                                                                   ('Roberto', 'Torres', '1976-08-22', 'Camino Real 999', '555-7531'),
                                                                                   ('Elena', 'Díaz', '1998-04-17', 'Bulevar Norte 888', '555-3698');

-- Insertar datos en Medico
INSERT INTO Medico (nombre, apellido, especialidad, telefono) VALUES
                                                                  ('María', 'González', 'Cardiología', '555-5678'),
                                                                  ('José', 'Rodríguez', 'Pediatría', '555-1239'),
                                                                  ('Elena', 'Castro', 'Neurología', '555-4567'),
                                                                  ('Andrés', 'Ortiz', 'Dermatología', '555-7890'),
                                                                  ('Fernanda', 'Jiménez', 'Oftalmología', '555-1597'),
                                                                  ('Raúl', 'Paredes', 'Gastroenterología', '555-3579'),
                                                                  ('Clara', 'Rivas', 'Ginecología', '555-4682'),
                                                                  ('Martín', 'Vega', 'Traumatología', '555-2795'),
                                                                  ('Carmen', 'Flores', 'Oncología', '555-6842'),
                                                                  ('Javier', 'Luna', 'Endocrinología', '555-9731');

-- Insertar datos en Cita
INSERT INTO Cita (fecha, hora, id_paciente, id_medico) VALUES
                                                           ('2024-06-20', '10:00', 1, 1),
                                                           ('2024-06-21', '11:30', 2, 2),
                                                           ('2024-06-22', '09:00', 3, 3),
                                                           ('2024-06-23', '14:00', 4, 4),
                                                           ('2024-06-24', '16:30', 5, 5),
                                                           ('2024-06-25', '08:00', 6, 6),
                                                           ('2024-06-26', '13:15', 7, 7),
                                                           ('2024-06-27', '17:45', 8, 8),
                                                           ('2024-06-28', '12:30', 9, 9),
                                                           ('2024-06-29', '15:20', 10, 10);

-- Insertar datos en Tratamiento
INSERT INTO Tratamiento (descripcion, id_paciente, id_medico) VALUES
                                                                  ('Tratamiento para hipertensión', 1, 1),
                                                                  ('Fisioterapia post-operatoria', 2, 2),
                                                                  ('Terapia neurológica', 3, 3),
                                                                  ('Tratamiento para acné severo', 4, 4),
                                                                  ('Corrección de miopía', 5, 5),
                                                                  ('Dieta especial para problemas digestivos', 6, 6),
                                                                  ('Control prenatal', 7, 7),
                                                                  ('Rehabilitación por fractura', 8, 8),
                                                                  ('Quimioterapia para cáncer', 9, 9),
                                                                  ('Regulación de glucosa', 10, 10);

SELECT
    Cita.id_cita,
    Paciente.nombre AS Nombre_Paciente,
    Paciente.apellido AS Apellido_Paciente,
    Cita.fecha,
    Cita.hora,
    Medico.nombre AS Nombre_Medico,
    Medico.apellido AS Apellido_Medico
FROM Cita
         JOIN Paciente ON Cita.id_paciente = Paciente.id_paciente
         JOIN Medico ON Cita.id_medico = Medico.id_medico
WHERE Paciente.nombre LIKE '%Juan%'
ORDER BY Cita.fecha;
