-- Normalizacion
-- 
-- +--------------+--------------------+-------------+-----------+------------+------------------+
-- | codigo_libro |        titulo      |    autor    | editorial |   lector   | fecha_devolucion |
-- +--------------+--------------------+-------------+-----------+------------+------------------+ 
-- |              | Ecuaciones         | Lambe, C.   |           | Pérez      |                  |
-- |   515        | diferenciales para | G y         |  UTHEA    | Gómez,     |     15/09/19     |
-- |              | ingenieros y       | Tranter, C. |           | Juan       |                  |
-- |              | cientificos        | J.          |           |            |                  |
-- +--------------+--------------------+-------------+-----------+------------+------------------+
-- |              |                    | Christen,   |           | Ortega     |                  |
-- |   540        | Química            | Hans        |  Reverté  | Pereira,   |     23/08/19     |
-- |              |                    | Rudolf      |           | Margarita  |                  |
-- +--------------+--------------------+-------------+-----------+------------+------------------+
-- |              |                    | Serway,     |  McGraw-  | García     |                  |
-- |   530        | Física             | Raymond     |  Hill     | Contreras, |     24/09/19     |
-- |              |                    | A           |           | Rosa       |                  |
-- +--------------+--------------------+-------------+-----------+------------+------------------+
-- |              |                    | Murray      |  McGraw-  | López      |                  |
-- |   519        | Estadística        | Spiegel     |  Hill     | Molina,    |     18/09/19     |
-- |              |                    |             |           | Ana        |                  |
-- +--------------+--------------------+-------------+-----------+------------+------------------+
-- |              |                    | Voevodin,   |           | Pérez      |                  |
-- |   512        | Algebra Lineal     | Valentin V  |  MIR      | Gómez,     |     17/09/19     |
-- |              |                    |             |           | Juan       |                  |
-- +--------------+--------------------+-------------+-----------+------------+------------------+

-- Creacion de Base de Datos
CREATE DATABASE biblioteca;

-- Creacion de Entidades
CREATE TABLE lectores(
    id INT PRIMARY KEY,
    apellido VARCHAR(25),
    nombre VARCHAR(25)
);

CREATE TABLE autores(
    id INT PRIMARY KEY,
    apellido VARCHAR(25),
    nombre VARCHAR(25)
);

CREATE TABLE editoriales(
    id INT PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE libros(
    id INT PRIMARY KEY,
    codigo_libro INT,
    titulo VARCHAR(50),
    editorial_id INT REFERENCES editoriales(id)
);

-- Relaciones N:N
CREATE TABLE autor_libro(
    id INT PRIMARY KEY,
    libro_id INT REFERENCES libros(id),
    autor_id INT REFERENCES autores(id)
);

CREATE TABLE devoluciones(
    id INT PRIMARY KEY,
    libro_id INT REFERENCES libros(id),
    lector_id INT REFERENCES lectores(id),
    fecha_devolucion DATE
);