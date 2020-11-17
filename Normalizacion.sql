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
    id SERIAL PRIMARY KEY,
    apellido VARCHAR(25) NOT NULL,
    nombre VARCHAR(25) NOT NULL
);

CREATE TABLE autores(
    id SERIAL PRIMARY KEY,
    apellido VARCHAR(25) NOT NULL,
    nombre VARCHAR(25) NOT NULL
);

CREATE TABLE editoriales(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE libros(
    codigo_libro INT PRIMARY KEY NOT NULL,
    titulo VARCHAR(50) NOT NULL,
    autor_id SERIAL REFERENCES autores(id),
    editorial_id SERIAL REFERENCES editoriales(id)
);

CREATE TABLE prestamos(
    libro_id INT REFERENCES libros(codigo_libro),
    lector_id SERIAL REFERENCES lectores(id),
    fecha_devolucion DATE NOT NULL
);