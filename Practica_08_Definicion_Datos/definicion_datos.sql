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

-- Consulta 7: Añadir una condición de integridad referencial entre el atributo T de la tabla ASIGNATUAS y el atributo T
-- de la tabla TITULACION con borrado en cascada.
ALTER TABLE ASIGNATURA
ADD FOREIGN KEY(T)
REFERENCES TITULACION(T)
ON DELETE CASCADE;

-- Consulta 8: Incrementar en dos caracteres la longitud del campo T en la tabla TITULACION
ALTER TABLE TITULACION
MODIFY T CHAR(6);

-- Consula 9: Crear una vista, llamada 'VISTA1', sobre la tabla ASIGNATURAS, con los campos (CAS, A, T, CUR, CAR).
CREATE VIEW VISTA1 AS (
  SELECT CAS, A, T, CUR, CAR
  FROM ASIGNATURAS;
)

-- Consulta 10: Listar todas las t-uplas de la vista 'VISTA1'
SELECT * FROM VISTA1;

-- Consulta 11: Insertar la t-upla (13, 'ESTADISTICA', 'GII', 3, 7) en la VISTA1
INSERT INTO VISTA1
VALUES(13, 'ESTADISTICA', 'GII', 3, 7);

-- Consulta 12: Listar todas las t-uplas de la vista 'VISTA1'
SELECT * FROM VISTA1;

-- Consulta 13: Listar todas las t-uplas de la vista 'ASIGNATURAS'
SELECT * FROM ASIGNATUAS

-- Consulta 14: Modificar el campo CAR en 'VISTA1' de la t-upla con CAS 13. El nuevo valor es 6.
UPDATE VISTA1
SET CAR = 6;
WHERE CAS = 13;

-- Consulta 15: Listar todas las t-uplas de vista 'VISTA1'
SELECT * FROM VISTA1;

-- Consulta 17: Crear uns vista llamada 'VISTA2', sobre la tabla 'PLAN_DOCENTE' y la vista 'VISTA1' que contenga
-- los datos (DNI, A, T, CUR, CAR) relativos a las asignaturas impartidas por un profesor especificado por su DNI.
CREATE VIEW VISTA2 AS (
  SELECT DNI, A, T, CUR, CAR
  FROM PLAN_DOCENTE NATURAL JOIN VISTA1
  WHERE DNI = 1111;
)

-- Consulta 18: Listar todas las t-uplas de la vista 'VISTA2'
SELECT * FROM VISTA2;

-- Consulta 19: Modifica el campo A de alguna t-upla específica de 'VISTA2'.
UPDATE VISTA2
SET A = 'OPTIMIZACION Y GRAFOS'
WHERE A = 'OPTIMIZACION';

-- Consulta 20: Obtener el esquema de la vista 'VISTA2'
DESCRIBE VISTA2;

-- Consulta 21: Eliminar la vista 'VISTA1'
DROP VIEW VISTA1;

-- Consula 22: Listar todas las t-uplas de la vista 'VISTA2'
SELECT * FROM VISTA2;

-- Consula 23: Deshacer los cambios
ROLLBACK;

-- Consulta 24: Crear un índice, llamado 'INDICE1', sobre el atributo P de la tabla 'PROFESOR'. Listar los DNI
-- de los profesores con nombre 'JUAN'.
CREATE INDEX INDICE1
ON PROFESOR(P);

SELECT DNI
FROM PROFESOR
WHERE P = 'JUAN';

-- Consulta 25: Eliminar el índice 'INDICE1'
DROP INDEX INDICE1;

-- Consulta 26: Crear un índice, llamado 'INDICE2', sobre el atributo CAR de la vista 'VISTA1'.
CREATE INDEX INDICE2
ON VISTA1(CAR);