-- Consulta 1: Crear una tabla llamada TITULACION con los atributos T (nombre de titulacion) 
-- y FAC (nombre de facultad). La clave primaria es T. Especifica los tipos de datos 
-- que creas convenientes y razona tu elección.
CREATE TABLE TITULACION (
  T CHAR(4) NOT NULL,
  FAC VARCHAR(60),
  PRIMARY KEY(T)
);

-- Consulta 2: Insertar, mediante una única instruccion, en la tabla TITULACION, los nombres
-- de las TITULACION obtenidos a partir de la tabla ASIGNATURA
INSERT INTO TITULACION(T)
SELECT DISTINCT T
FROM ASIGNATURA;

-- Consulta 3: Listar todos los registros de la tabla TITULACION
SELECT * FROM TITULACION;

-- Consulta 4: Rellenar convenientemente el campo FAC de la tabla TITULACION
UPDATE TITULACION
SET FAC = 'MATEMATICAS Y FISICA'
WHERE T = 'GF';

UPDATE TITULACION
SET FAC = 'MATEMATICAS Y FISICA'
WHERE T = 'GM';

UPDATE TITULACION
SET FAC = 'ESIT'
WHERE T = 'GII';

UPDATE TITULACION
SET FAC = 'ESIT'
WHERE T = 'MII';

UPDATE TITULACION
SET FAC = CASE 
      WHEN T = 'GF' THEN 'MATEMATICAS Y FISICA'
      WHEN T = 'GM' THEN 'MATEMATICAS Y FISICA'
      WHEN T = 'GII' THEN 'ESIT'
      WHEN T = 'MII' THEN 'ESIT'
      END
WHERE T IN ('GF', 'GM', 'GII', 'MII');

-- Consulta 5: Crear un sinónimo denominado TIT para la tabla TITULACION
CREATE SYNONYM TIT
FROM TITULACION;

-- Consulta 6: Listar todos los registros de TIT.
SELECT * FROM TIT;

-- Consulta 7: 