DROP DATABASE IF EXISTS libros_db;
CREATE DATABASE libros_db;
USE libros_db;

-- Create the tables
CREATE TABLE AUTOR (
    idAutor INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Nacionalidad VARCHAR(50)
);

CREATE TABLE LIBRO (

    idLibro INT PRIMARY KEY,
    Titulo VARCHAR(200) NOT NULL,
    Editorial VARCHAR(100),
    Area VARCHAR(100)
);

CREATE TABLE LIBROAUTOR (
    idAutor INT,
    idLibro INT,
    PRIMARY KEY (idAutor, idLibro),
    FOREIGN KEY (idAutor) REFERENCES AUTOR(idAutor),
    FOREIGN KEY (idLibro) REFERENCES LIBRO(idLibro)
);

CREATE TABLE ESTUDIANTE (
    idLector INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100),
    Direccion VARCHAR(200),
    Carrera VARCHAR(50),
    Edad INT
);

CREATE TABLE PRESTAMO (
    idLector INT,
    idLibro INT,
    FechaPrestamo DATE,
    FechaDevolucion DATE,
    Devuelto BOOLEAN,
    PRIMARY KEY (idLector, idLibro, FechaPrestamo),
    FOREIGN KEY (idLector) REFERENCES ESTUDIANTE(idLector),
    FOREIGN KEY (idLibro) REFERENCES LIBRO(idLibro)
);

-- Populate the tables with sample data
-- AUTOR
INSERT INTO AUTOR (idAutor, Nombre, Nacionalidad) VALUES
(1, 'Gabriel García Marquez', 'Colombiana'),
(2, 'Isabel Allende', 'Chilena'),
(3, 'J.K. Rowling', 'Britanica'),
(4, 'Mario Vargas Llosa', 'Peruana'),
(5, 'J.R.R. Tolkien', 'Britanica'),
(6, 'Agatha Christie', 'Britanica'),
(7, 'Jane Austen', 'Britanica'),
(8, 'George Orwell', 'Britanica'),
(9, 'Carlos Fuentes', 'Mexicana'),
(10, 'Mark Twain', 'Estadounidense');

-- LIBRO
INSERT INTO LIBRO (idLibro, Titulo, Editorial, Area) VALUES
(1, 'Cien Años de Soledad', 'Editorial Sudamericana', 'Literatura'),
(2, 'La Casa de los Espíritus', 'Editorial Plaza & Janés', 'Literatura'),
(3, 'Harry Potter y la Piedra Filosofal', 'Bloomsbury', 'Fantasía'),
(4, 'La Ciudad y los Perros', 'Seix Barral', 'Literatura'),
(5, 'El Señor de los Anillos', 'Allen & Unwin', 'Fantasía'),
(6, 'Asesinato en el Orient Express', 'Collins Crime Club', 'Misterio'),
(7, 'Orgullo y Prejuicio', 'T. Egerton', 'Literatura'),
(8, '1984', 'Secker & Warburg', 'Distopía'),
(9, 'La Muerte de Artemio Cruz', 'Fondo de Cultura Económica', 'Literatura'),
(10, 'Las Aventuras de Tom Sawyer', 'American Publishing Company', 'Infantil');

-- LIBROAUTOR
INSERT INTO LIBROAUTOR (idAutor, idLibro) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(1, 9),  -- Author with multiple books
(5, 5);

-- ESTUDIANTE
INSERT INTO ESTUDIANTE (idLector, Nombre, Apellido, Dirección, Carrera, Edad) VALUES
(1, 'Juan', 'Pérez', 'Calle 123', 'Ingeniería', 21),
(2, 'Ana', 'García', 'Avenida 456', 'Arquitectura', 23),
(3, 'Luis', 'Martínez', 'Boulevard 789', 'Derecho', 22),
(4, 'Carlos', 'López', 'Calle Central 101', 'Economía', 24),
(5, 'María', 'Santos', 'Pasaje Norte 305', 'Medicina', 22),
(6, 'Elena', 'Ramírez', 'Calle Luna 212', 'Psicología', 25),
(7, 'Jorge', 'Herrera', 'Avenida del Sol 501', 'Computación', 21),
(8, 'Lucía', 'Morales', 'Calle Verde 410', 'Arte', 23),
(9, 'Fernando', 'Gómez', 'Carrera Sur 811', 'Historia', 26),
(10, 'Patricia', 'Rivera', 'Boulevard Azul 609', 'Filosofía', 20);

-- PRESTAMO
INSERT INTO PRESTAMO (idLector, idLibro, FechaPrestamo, FechaDevolucion, Devuelto) VALUES
(1, 1, '2024-12-01', '2024-12-15', TRUE),
(2, 2, '2024-12-05', '2024-12-20', FALSE),
(3, 3, '2024-12-10', NULL, FALSE),
(4, 4, '2024-11-01', '2024-11-15', TRUE),
(5, 5, '2024-11-05', '2024-11-20', TRUE),
(6, 6, '2024-11-10', NULL, FALSE),
(7, 7, '2024-11-15', NULL, FALSE),
(8, 8, '2024-11-20', NULL, FALSE),
(9, 9, '2024-12-01', '2024-12-10', TRUE),
(10, 10, '2024-12-05', NULL, FALSE),
(1, 4, '2024-12-10', '2024-12-20', TRUE),
(2, 5, '2024-12-15', NULL, FALSE),
(3, 6, '2024-12-20', NULL, FALSE);


