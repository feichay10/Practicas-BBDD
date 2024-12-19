-- Consulta 1: Permitir al usuario alumno el poder consultar las tablas DEPARTAMENTO, AREA, ASIGNATURA, y TITULACION
GRANT SELECT 
ON DEPARTAMENTO, AREA, ASIGNATURA, TITULACION 
TO ALUMNO;

-- Consulta 2: Permitir al usuario alumno el poder insertar, modificar y borrar en las tablas DEPARTAMENTO y AREA
-- y modificar en las tablas ASIGNATURA y TITULACION.
GRANT INSERT, UPDATE, DELETE
ON DEPARTAMENTO, AREA
TO ALUMNO;

GRANT UPDATE
ON ASIGNATURA, TITULACION
TO ALUMNO;

-- Consulta 4:Listar todas las t-uplas de la tabla DEPARTAMENTO
SELECT * FROM ALU.DEPARTAMENTO; 

-- Consulta 5:Listar todas las t-uplas de la tabla PROFESOR
SELECT * FROM ALU.PROFESOR;

-- Consulta 6: Insertar la t-upla (5, 'ECONOMIA') en la tabla departamento
INSERT INTO ALU.DEPARTAMENTO
VALUES(5, 'ECONOMIA');

-- Consulta 7: Modificar el nombre del departamento con código 5 al valor 'ECONOMIA APLICADA'
UPDATE ALU.DEPARTAMENTO
SET D = 'ECONOMIA APLICADA'
WHERE CD = 5;

-- Consulta 8: Modificar en la tabla TITULACION la t-upla correspondiente a la titulación 'GII',
-- poniendo como valor de facultad 'ESIT1'
UPDATE ALU.TITULACION
SET T = 'ESIT1'
WHERE T = 'GII';

-- Consulta 9: Eliminar en la tabla TITULACION la t-upla correspondiente a la titulación 'GII'
DELETE ON ALU.TITULACION
WHERE T = 'GII';

-- Consulta 10: Deshacer los cambios
ROLLBACK;

-- Consulta 11: Crear una vista, llamada 'VISTA3', sobre la tabla 'ASIGNATURA', con los atributos A y CAR
CREATE VIEW VISTA3 AS (
  SELECT A, CAR
  FROM ALU.ASIGNATURA
);

-- Consulta 12: Eliminar la tabla ASIGNATURA
DROP TABLE ALU.ASIGNATURA;

-- Consulta 13: Listas las t-uplas de la tabla AREA
SELECT * FROM AREA;

-- Consulta 14: Borrar en la tabla AREA la t-upla asociada al departamento con código 2
DELETE FROM ALU.AREA
WHERE CD = 2;

-- Consulta 15: Borrar en la tabla AREA la t-upla asociada al departamento con código 2
DELETE FROM ALU.AREA
WHERE CD = 3;

-- Consulta 16: Insertar la t-upla (5, 'ECONOMIA APLICADA') en la tabla DEPARTAMENTO
INSERT INTO ALU.DEPARTAMENTO
VALUES(5, 'ECONOMIA APLICADA');

-- Consulta 17: Borrar las asignaturas adscritas al área con código 1
DELETE FROM ALU.ASIGNATURA
WHERE CAR = 1;

-- Consulta 18: Eliminar en la tabla TITULACION la tupla correspondiente a la titulación 'MII'
DELETE FROM ALU.TITULACION
WHERE T = 'MII';

-- Consulta 19: Hacer permanentes los cambios. 
COMMIT WORK;

-- Consulta 21: Listar las tuplas de la tabla DEPARTAMENTO
SELECT * FROM DEPARTAMENTO;

-- Consulta 22: Borrar en la tabla DEPARTAMENTO la t-upla asociada al departamento con código 2
DELETE FROM DEPARTAMENTO
WHERE CD = 2;

-- Consulta 23: Listar las tuplas de la tabla AREA
SELECT * FROM AREA;

-- Consulta 24: Listar las tuplas de la tabla PROFESOR
SELECT * FROM PROFESOR;

-- Consulta 25: Listar las tuplas de la tabla TITULACION
SELECT * FROM TITULACION;

-- Consulta 26: Quitar todos los privilegios concedidos al usuario alumno sobre la tabla DEPARTAMENTO
REVOKE SELECT, INSERT, UPDATE, DELETE
ON DEPARTAMENTO
TO ALUMNO;

-- Consulta 27:
REVOKE ALL
TO ALUMNO