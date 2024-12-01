-- === TABLE CREATION === --
-- INIT LIBROS --
CREATE TABLE libros ( 
	nombre VARCHAR(255),
	autor VARCHAR(255),
	isbn VARCHAR(55),
	editorial VARCHAR(255),
	anio_publicacion INT
);

SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'libros';


-- PRIMARY KEY
ALTER TABLE libros
ADD id_libro SERIAL;

ALTER TABLE libros
ADD PRIMARY KEY (id_libro);

SELECT * from libros;
-- END LIBROS -- 

-- LECTORES
CREATE TABLE lectores (
	nombre VARCHAR(50),
	apellido VARCHAR(50),
	email VARCHAR(256),
	--DD/MM/AAAA
	fecha_nacimiento VARCHAR(10)
);

SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'lectores';

-- PRIMARY KEY
ALTER TABLE lectores
ADD id_lector SERIAL;

ALTER TABLE lectores
ADD PRIMARY KEY (id_lector);

SELECT * from lectores;
-- END LECTORES

-- PRESTAMOS --
-- Tabla de intermedia entre libros y lectores
CREATE TABLE Prestamos (
    id_prestamo SERIAL PRIMARY KEY,
    id_lector INT REFERENCES Lectores(id_lector),
    id_libro INT REFERENCES Libros(id_libro),
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    estado VARCHAR(20)
);
-- END PRESTAMOS
-- === END TABLE CREATION === --


-- === INIT INSERTS === --
-- LIBROS --
INSERT INTO libros (nombre, editorial, autor, isbn, anio_publicacion)
VALUES
	('Cementerio de animales', 'Ediciones de Mente', 'Stephen King', '4568874', 1983),
    ('En el nombre de la rosa', 'Editorial España', 'Umberto Eco', '44558877', 1980),
    ('Cien años de soledad', 'Sudamericana', 'Gabriel García Márquez', '7788845', 1967),
    ('El diario de Ellen Rimbauer', 'Editorial Maine', 'Stephen King', '45699874', 2001),
    ('La hojarasca', 'Sudamericana', 'Gabriel García Márquez', '7787898', 1955),
    ('El amor en los tiempos del cólera', 'Sudamericana', 'Gabriel García Márquez', '2564111', 1985),
    ('La casa de los espíritus', 'Ediciones Chile', 'Isabel Allende', '5544781', 1982),
    ('Paula', 'Ediciones Chile', 'Isabel Allende', '22545447', 1994),
    ('La tregua', 'Alfa', 'Mario Benedetti', '2225412', 1960),
    ('Gracias por el fuego', 'Alfa', 'Mario Benedetti', '88541254', 1965);
-- END LIBROS --

-- LECTORES --
INSERT INTO lectores (nombre, apellido, email, fecha_nacimiento)
VALUES
    ('Juan Alberto', 'Cortéz', 'juancortez@gmail.com', '20/06/1983'),
    ('Antonia', 'de los Ríos', 'antoniarios_23@yahoo.com', '24/11/1978'),
    ('Nicolás', 'Martin', 'nico_martin23@gmail.com', '11/07/1986'),
    ('Néstor', 'Casco', 'nestor_casco2331@hotmail.com', '11/02/1981'),
    ('Lisa', 'Pérez', 'lisperez@hotmail.com', '11/08/1994'),
    ('Ana Rosa', 'Estagnolli', 'anros@abcdatos.com', '15/10/1974'),
    ('Milagros', 'Pastoruti', 'mili_2231@gmail.com', '22/01/2001'),
    ('Pedro', 'Alonso', 'alonso.pedro@impermebilizantesrosario.com', '05/09/1983'),
    ('Arturo Ezequiel', 'Ramírez', 'artu.rama@outlook.com', '29/03/1998'),
    ('Juan Ignacio', 'Altarez', 'juanaltarez.223@yahoo.com', '24/08/1975');
-- END LECTORES --

-- PRESTAMOS
INSERT INTO prestamos (id_lector, id_libro, fecha_prestamo, fecha_devolucion, estado)
VALUES
    (1, 3, '2024-01-15', '2024-02-15', 'Devuelto'),
    (2, 5, '2024-02-01', '2024-03-01', 'Devuelto'),
    (3, 1, '2024-01-20', '2024-02-20', 'Devuelto'),
    (4, 7, '2024-03-10', '2024-04-10', 'Devuelto'),
    (5, 2, '2024-01-25', '2024-02-25', 'Devuelto'),
    (6, 4, '2024-02-15', '2024-03-15', 'Devuelto'),
    (7, 8, '2024-03-05', '2024-04-05', 'Devuelto'),
    (8, 6, '2024-02-10', '2024-03-10', 'Devuelto'),
    (9, 10, '2024-03-01', '2024-04-01', 'Devuelto'),
    (10, 9, '2024-01-30', '2024-02-28', 'Devuelto');
-- END PRESTAMOS --
-- === END INSERTS === --