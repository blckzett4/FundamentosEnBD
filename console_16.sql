CREATE DATABASE PlataformaDeCursosEnLinea;
USE PlataformaDeCursosEnLinea;

CREATE TABLE Usuario (
                         id_usuario INT PRIMARY KEY AUTO_INCREMENT,
                         nombre VARCHAR(50) NOT NULL,
                         apellido VARCHAR(50) NOT NULL,
                         correo VARCHAR(100) UNIQUE NOT NULL,
                         telefono VARCHAR(20)
);

CREATE TABLE Curso (
                       id_curso INT PRIMARY KEY AUTO_INCREMENT,
                       nombre VARCHAR(100) NOT NULL,
                       descripcion TEXT NOT NULL,
                       duracion INT NOT NULL CHECK (duracion > 0)
);

CREATE TABLE Inscripcion (
                             id_inscripcion INT PRIMARY KEY AUTO_INCREMENT,
                             id_usuario INT NOT NULL,
                             id_curso INT NOT NULL,
                             fecha_inscripcion DATE NOT NULL DEFAULT (CURDATE()),
                             FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON DELETE CASCADE,
                             FOREIGN KEY (id_curso) REFERENCES Curso(id_curso) ON DELETE CASCADE
);

-- Insertar Usuarios
INSERT INTO Usuario (nombre, apellido, correo, telefono) VALUES
                                                             ('Juan', 'Pérez', 'juan.perez@email.com', '555-1234'),
                                                             ('María', 'López', 'maria.lopez@email.com', '555-5678'),
                                                             ('Carlos', 'Gómez', 'carlos.gomez@email.com', '555-9876'),
                                                             ('Ana', 'Martínez', 'ana.martinez@email.com', '555-6543'),
                                                             ('Luis', 'Fernández', 'luis.fernandez@email.com', '555-3210'),
                                                             ('Diana', 'Hernández', 'diana.hernandez@email.com', '555-8523'),
                                                             ('Roberto', 'Torres', 'roberto.torres@email.com', '555-9632'),
                                                             ('Elena', 'Díaz', 'elena.diaz@email.com', '555-7531'),
                                                             ('Pedro', 'Sánchez', 'pedro.sanchez@email.com', '555-7412'),
                                                             ('Lucía', 'Ramírez', 'lucia.ramirez@email.com', '555-3698');

-- Insertar Cursos
INSERT INTO Curso (nombre, descripcion, duracion) VALUES
                                                      ('SQL Básico', 'Aprende los fundamentos de SQL.', 20),
                                                      ('Python para Principiantes', 'Curso introductorio de programación con Python.', 30),
                                                      ('Desarrollo Web con HTML y CSS', 'Construcción de sitios web estáticos.', 25),
                                                      ('JavaScript Avanzado', 'Profundización en JavaScript para aplicaciones dinámicas.', 35),
                                                      ('Administración de Bases de Datos', 'Conceptos avanzados de bases de datos relacionales.', 40),
                                                      ('Machine Learning con Python', 'Aprende los fundamentos del aprendizaje automático.', 50),
                                                      ('Ciberseguridad Básica', 'Introducción a la seguridad informática.', 30),
                                                      ('Marketing Digital', 'Estrategias de marketing para redes sociales y SEO.', 20),
                                                      ('Desarrollo de Apps Móviles', 'Creación de aplicaciones móviles con Flutter.', 45),
                                                      ('Big Data y Analítica', 'Procesamiento y análisis de grandes volúmenes de datos.', 50);

-- Insertar Inscripciones
INSERT INTO Inscripcion (id_usuario, id_curso, fecha_inscripcion) VALUES
                                                                      (1, 1, '2024-03-01'),
                                                                      (2, 2, '2024-03-05'),
                                                                      (3, 3, '2024-03-10'),
                                                                      (4, 4, '2024-03-12'),
                                                                      (5, 5, '2024-03-15'),
                                                                      (6, 6, '2024-03-18'),
                                                                      (7, 7, '2024-03-20'),
                                                                      (8, 8, '2024-03-22'),
                                                                      (9, 9, '2024-03-25'),
                                                                      (10, 10, '2024-03-28');

SELECT
    Usuario.nombre AS Nombre_Usuario,
    Usuario.apellido AS Apellido_Usuario,
    Curso.nombre AS Curso_Inscrito,
    Curso.duracion AS Duración_Horas,
    Inscripcion.fecha_inscripcion
FROM Inscripcion
         JOIN Usuario ON Inscripcion.id_usuario = Usuario.id_usuario
         JOIN Curso ON Inscripcion.id_curso = Curso.id_curso
WHERE Usuario.id_usuario = 1;
