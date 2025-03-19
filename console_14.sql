CREATE DATABASE Bibliotecadiigital;
USE Bibliotecadiigital;

CREATE TABLE Usuario (
                         id_usuario INT PRIMARY KEY AUTO_INCREMENT,
                         nombre VARCHAR(50) NOT NULL,
                         apellido VARCHAR(50) NOT NULL,
                         correo VARCHAR(100) UNIQUE NOT NULL,
                         telefono VARCHAR(20)
);

CREATE TABLE Libro (
                       id_libro INT PRIMARY KEY AUTO_INCREMENT,
                       titulo VARCHAR(150) NOT NULL,
                       autor VARCHAR(100) NOT NULL,
                       año_publicacion INT NOT NULL CHECK (año_publicacion > 0),
                       disponibilidad BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE Prestamo (
                          id_prestamo INT PRIMARY KEY AUTO_INCREMENT,
                          id_usuario INT NOT NULL,
                          id_libro INT NOT NULL,
                          fecha_prestamo DATE NOT NULL DEFAULT (CURDATE()),
                          fecha_devolucion DATE,
                          estado ENUM('Activo', 'Devuelto') NOT NULL DEFAULT 'Activo',
                          FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON DELETE CASCADE,
                          FOREIGN KEY (id_libro) REFERENCES Libro(id_libro) ON DELETE CASCADE
);

-- Insertar datos en Usuario
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

-- Insertar datos en Libro
INSERT INTO Libro (titulo, autor, año_publicacion, disponibilidad) VALUES
                                                                        ('Cien años de soledad', 'Gabriel García Márquez', 1967, TRUE),
                                                                        ('1984', 'George Orwell', 1949, TRUE),
                                                                        ('El Principito', 'Antoine de Saint-Exupéry', 1943, TRUE),
                                                                        ('Don Quijote de la Mancha', 'Miguel de Cervantes', 1605, TRUE),
                                                                        ('Crimen y castigo', 'Fiódor Dostoyevski', 1866, TRUE),
                                                                        ('Moby Dick', 'Herman Melville', 1851, TRUE),
                                                                        ('Orgullo y prejuicio', 'Jane Austen', 1813, TRUE),
                                                                        ('El Hobbit', 'J.R.R. Tolkien', 1937, TRUE),
                                                                        ('Rayuela', 'Julio Cortázar', 1963, TRUE),
                                                                        ('Fahrenheit 451', 'Ray Bradbury', 1953, TRUE);

-- Insertar datos en Prestamo
INSERT INTO Prestamo (id_usuario, id_libro, fecha_prestamo, fecha_devolucion, estado) VALUES
                                                                                          (1, 1, '2024-03-01', NULL, 'Activo'),
                                                                                          (2, 2, '2024-02-25', '2024-03-10', 'Devuelto'),
                                                                                          (3, 3, '2024-03-10', NULL, 'Activo'),
                                                                                          (4, 4, '2024-03-05', '2024-03-15', 'Devuelto'),
                                                                                          (5, 5, '2024-03-12', NULL, 'Activo'),
                                                                                          (6, 6, '2024-03-15', NULL, 'Activo'),
                                                                                          (7, 7, '2024-03-14', '2024-03-20', 'Devuelto'),
                                                                                          (8, 8, '2024-03-13', NULL, 'Activo'),
                                                                                          (9, 9, '2024-03-10', '2024-03-18', 'Devuelto'),
                                                                                          (10, 10, '2024-03-09', NULL, 'Activo');

SELECT
    Usuario.nombre AS Nombre_Usuario,
    Usuario.apellido AS Apellido_Usuario,
    Libro.titulo AS Libro_Prestado,
    Prestamo.fecha_prestamo,
    Prestamo.estado
FROM Prestamo
         JOIN Usuario ON Prestamo.id_usuario = Usuario.id_usuario
         JOIN Libro ON Prestamo.id_libro = Libro.id_libro
WHERE Prestamo.estado = 'Activo' AND Usuario.id_usuario = 1;
