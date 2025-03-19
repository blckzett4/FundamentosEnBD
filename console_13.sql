CREATE DATABASE TiendaEnLinea;
USE TiendaEnLinea;

CREATE TABLE Cliente (
                         id_cliente INT PRIMARY KEY AUTO_INCREMENT,
                         nombre VARCHAR(50) NOT NULL,
                         apellido VARCHAR(50) NOT NULL,
                         correo VARCHAR(100) UNIQUE NOT NULL,
                         telefono VARCHAR(20),
                         direccion VARCHAR(150)
);

CREATE TABLE Producto (
                          id_producto INT PRIMARY KEY AUTO_INCREMENT,
                          nombre VARCHAR(100) NOT NULL,
                          descripcion TEXT,
                          precio DECIMAL(10,2) NOT NULL CHECK (precio > 0),
                          stock INT NOT NULL CHECK (stock >= 0)
);

CREATE TABLE Pedido (
                        id_pedido INT PRIMARY KEY AUTO_INCREMENT,
                        fecha DATE NOT NULL DEFAULT (CURDATE()),
                        total DECIMAL(10,2) NOT NULL CHECK (total >= 0),
                        id_cliente INT NOT NULL,
                        FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente) ON DELETE CASCADE
);

CREATE TABLE DetallePedido (
                               id_detalle INT PRIMARY KEY AUTO_INCREMENT,
                               id_pedido INT NOT NULL,
                               id_producto INT NOT NULL,
                               cantidad INT NOT NULL CHECK (cantidad > 0),
                               subtotal DECIMAL(10,2) NOT NULL CHECK (subtotal >= 0),
                               FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido) ON DELETE CASCADE,
                               FOREIGN KEY (id_producto) REFERENCES Producto(id_producto) ON DELETE CASCADE
);

-- Insertar datos en Cliente
INSERT INTO Cliente (nombre, apellido, correo, telefono, direccion) VALUES
                                                                        ('Juan', 'Pérez', 'juan.perez@email.com', '555-1234', 'Av. Central 123'),
                                                                        ('María', 'López', 'maria.lopez@email.com', '555-5678', 'Calle Falsa 456'),
                                                                        ('Carlos', 'Gómez', 'carlos.gomez@email.com', '555-9876', 'Av. Siempre Viva 789'),
                                                                        ('Ana', 'Martínez', 'ana.martinez@email.com', '555-6543', 'Calle Secundaria 321'),
                                                                        ('Luis', 'Fernández', 'luis.fernandez@email.com', '555-3210', 'Paseo del Río 111'),
                                                                        ('Lucía', 'Ramírez', 'lucia.ramirez@email.com', '555-7412', 'Plaza Mayor 202'),
                                                                        ('Pedro', 'Sánchez', 'pedro.sanchez@email.com', '555-8523', 'Av. Central 333'),
                                                                        ('Diana', 'Hernández', 'diana.hernandez@email.com', '555-9632', 'Callejón Azul 444'),
                                                                        ('Roberto', 'Torres', 'roberto.torres@email.com', '555-7531', 'Camino Real 555'),
                                                                        ('Elena', 'Díaz', 'elena.diaz@email.com', '555-3698', 'Bulevar Norte 666');

-- Insertar datos en Producto
INSERT INTO Producto (nombre, descripcion, precio, stock) VALUES
                                                              ('Laptop', 'Laptop HP con 16GB RAM', 1200.00, 10),
                                                              ('Smartphone', 'Samsung Galaxy S21', 850.00, 15),
                                                              ('Tablet', 'iPad Air 2024', 600.00, 8),
                                                              ('Monitor', 'Monitor 27” 144Hz', 300.00, 12),
                                                              ('Teclado', 'Teclado mecánico RGB', 90.00, 20),
                                                              ('Mouse', 'Mouse gamer Logitech', 50.00, 25),
                                                              ('Impresora', 'Impresora multifuncional HP', 200.00, 5),
                                                              ('Auriculares', 'Auriculares Bluetooth Sony', 120.00, 18),
                                                              ('Cámara', 'Cámara Canon EOS', 950.00, 6),
                                                              ('Disco Duro', 'Disco SSD 1TB', 150.00, 30);

-- Insertar datos en Pedido
INSERT INTO Pedido (fecha, total, id_cliente) VALUES
                                                  ('2024-06-15', 1350.00, 1),
                                                  ('2024-06-16', 900.00, 2),
                                                  ('2024-06-17', 1250.00, 3),
                                                  ('2024-06-18', 140.00, 4),
                                                  ('2024-06-19', 1100.00, 5),
                                                  ('2024-06-20', 2000.00, 6),
                                                  ('2024-06-21', 850.00, 7),
                                                  ('2024-06-22', 600.00, 8),
                                                  ('2024-06-23', 950.00, 9),
                                                  ('2024-06-24', 300.00, 10);

-- Insertar datos en DetallePedido
INSERT INTO DetallePedido (id_pedido, id_producto, cantidad, subtotal) VALUES
                                                                           (1, 1, 1, 1200.00),
                                                                           (1, 5, 2, 150.00),
                                                                           (2, 2, 1, 850.00),
                                                                           (3, 3, 2, 1200.00),
                                                                           (3, 6, 1, 50.00),
                                                                           (4, 5, 1, 90.00),
                                                                           (4, 6, 1, 50.00),
                                                                           (5, 1, 1, 1200.00),
                                                                           (5, 9, 1, 950.00),
                                                                           (6, 10, 2, 300.00);

SELECT
    Cliente.nombre AS Nombre_Cliente,
    Cliente.apellido AS Apellido_Cliente,
    Producto.nombre AS Producto_Comprado,
    DetallePedido.cantidad,
    DetallePedido.subtotal
FROM DetallePedido
         JOIN Pedido ON DetallePedido.id_pedido = Pedido.id_pedido
         JOIN Cliente ON Pedido.id_cliente = Cliente.id_cliente
         JOIN Producto ON DetallePedido.id_producto = Producto.id_producto
WHERE Cliente.id_cliente = 1
ORDER BY Pedido.fecha;
