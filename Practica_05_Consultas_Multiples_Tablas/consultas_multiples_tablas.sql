-- Consulta 1: Listar los nombres de asignaturas adscritas a áreas cuyo nombre 
-- empiece por 'A'
SELECT A 
FROM ASIGNATURA
WHERE CAR IN (SELECT CAR FROM AREA
              WHERE AR LIKE 'A%');

-- Consulta 2: Listar los nombres de asignaturas adscritas a áreas cuyo nombre
-- termine por 'A'
SELECT A
FROM ASIGNATURA
WHERE CAR IN (SELECT CAR
              FROM AREA
              WHERE AR LIKE '%A');

-- Consulta 3: Listar los nombres de asignaturas que lleven la palabra 'DATOS'
SELECT A 
FROM ASIGNATURA
WHERE A LIKE '%DATOS%';

-- Consulta 4: Listar los DNI de los profesores en cuyo nombre el tercer carácter sea 'R'
SELECT DNI
FROM PROFESOR
WHERE P LIKE '__R%';

-- Consulta 5: Listar, sin contar duplicados, los DNI de los profesores con nombres de,
-- a lo sumo, 5 caracteres de longitud
SELECT DISTINCT DNI
FROM PROFESOR 
WHERE LENGTH(P) <= 5;

-- Consulta 6: Listar, sin contar duplicados, los DNI de los profesores con nombres de,
-- al menos, 5 caracteres de longitud
SELECT DISTINCT DNI 
FROM PROFESOR
WHERE LENGTH(P) >= 5;

-- Consulta 7: Listar los nombres de los profesores que actualmente imparten alguna asignatura
SELECT P
FROM PROFESOR NATURAL JOIN PLAN_DOCENTE
WHERE (FF IS NULL) AND (FI < SYSDATE());

-- Consulta 8: Nombre de los profesores que han impartido la asignatura con código 8.
SELECT P
FROM PROFESOR NATURAL JOIN PLAN_DOCENTE
WHERE CAS = 8;

-- Consulta 9: Listar las t-uplas de la tabla PLAN_DOCENTE ordenadas de forma ascendente, según el campo FF
SELECT *
FROM PLAN_DOCENTE
ORDER BY FF ASC;

-- Consulta 10: Listar las t-uplas de la tabla PLAN_DOCENTE ordenadas de forma descendente, según el campo FF
SELECT *
FROM PLAN_DOCENTE
ORDER BY FF DESC;

-- Consulta 11: Nombres de los profesores que han impartido las asignatura 'OPTIMIZACION' en la titulación
-- GII. Ordena los nombres ascendentemente.
SELECT P
FROM PROFESOR NATURAL JOIN AREA NATURAL JOIN PLAN_DOCENTE
WHERE (A = 'OPTIMIZACION') AND (T = 'GII')
ORDER BY P ASC;

-- Consulta 12: Listar los nombres de los profesores del departamento 'MATEMATICA FUNDAMENTAL'. 
-- Ordena los nombres descendentemente.
SELECT P 
FROM PROFESOR NATURAL JOIN AREA NATURAL JOIN DEPARTAMENTO
WHERE D = 'MATEMATICA FUNDAMENTAL'
ORDER BY P DESC;

-- Consulta 13: Listar los nombres de las asignaturas impartidas por el profesor con DNI 1010.
SELECT UNIQUE A
FROM ASIGNATURA NATURAL JOIN PLAN_DOCENTE
WHERE DNI = 1010;

-- Consulta 14: Listar los nombres de las asignaturas impartidas por el profesor con nombre 'DAVID'
SELECT UNIQUE A
FROM ASIGNATURA NATURAL JOIN PLAN_DOCENTE NATURAL JOIN PROFESOR
WHERE P = 'DAVID';

-- Consulta 15: Listar los nombre de las áreas adscritas al departamento 'ESTADISTICA, INVESTIGACIÓN OPERATIVA Y COMPUTACIÓN'
SELECT AR
FROM AREA NATURAL JOIN DEPARTAMENTO
WHERE D = 'ESTADISTICA, INVESTIGACIÓN OPERATIVA Y COMPUTACIÓN';

-- Consulta 16: Listar los nombres de las asignaturas impartidas actualmente por catedráticas de universidad (categoría CU).
SELECT A 
FROM ASIGNATURA NATURAL JOIN PLAN_DOCENTE NATURAL JOIN PROFESOR
WHERE (CAT = 'CU') AND FF IS NULL;

-- Consulta 17: Listar los nombres de las asignaturas que siempre han sido impartidas por catedráticos de universidad (categoria CU).
SELECT A
FROM ASIGNATURA NATURAL JOIN PLAN_DOCENTE NATURAL JOIN PROFESOR
WHERE CAT = 'CU'
MINUS
SELECT A
FROM ASIGNATURA NATURAL JOIN PLAN_DOCENTE NATURAL JOIN PROFESOR
WHERE CAT != 'CU';

-- Consulta 18: Listar los nombres de asignaturas adscritas a 'LENGUAJE Y  SISTEMAS INFORMÁTICOS'
-- o a ' CIENCIAS DE LA COMPUTACIÓN E INTELIGENCIA ARTIFICIAL'.
SELECT A
FROM ASIGNATURA NATURAL JOIN AREA
WHERE AR = 'LENGUAJE Y SISTEMAS INFORMATICOS'
UNION
SELECT A
FROM ASIGNATURA NATURAL JOIN AREA
WHERE AR = 'CIENCIAS DE LA COMPUTACION E INTELIGENCIA ARTIFICIAL';

-- Consulta 19: Listar los nombres de profesores que actualmente dan clases en las titulaciones 'GII' o en 'MII'
SELECT P
FROM PROFESOR NATURAL JOIN ASIGNATURA NATURAL JOIN PLAN_DOCENTE
WHERE T = 'GII' AND FF IS NULL
UNION
SELECT P
FROM PROFESOR NATURAL JOIN ASIGNATURA NATURAL JOIN PLAN_DOCENTE
WHERE T = 'MII' AND FF IS NULL;

-- Consulta 20: Listar los nombres de profesores que actualmente dan clases en las titulaciones 'GII' 
-- y en 'MII' simultáneamente.
SELECT P
FROM PROFESOR NATURAL JOIN ASIGNATURA NATURAL JOIN PLAN_DOCENTE
WHERE T = 'GII' AND FF IS NULL
INTERSECT
SELECT P
FROM PROFESOR NATURAL JOIN ASIGNATURA NATURAL JOIN PLAN_DOCENTE
WHERE T = 'MII' AND FF IS NULL;

-- Consulta 21: Listar los nombres de profesores que actualmente no imparten ninguna asignatura
SELECT P
FROM PROFESOR
MINUS
SELECT P
FROM PROFESOR NATURAL JOIN PLAN_DOCENTE
WHERE FF IS NULL;

SELECT P 
FROM PROFESOR
WHERE DNI NOT IN (SELECT DNI 
                  FROM PLAN_DOCENTE
                  WHERE FF IS NULL);

-- Consulta 22: Listar los nombres de asignaturas impartidas en la titulacion GII.
SELECT A
FROM ASIGNATURA
WHERE T = 'GII'

-- Consulta 23: Listar los nombres de las áreas de conocimiento y los nombres de las asignaturas que pertenecen a ellos.
SELECT AR, A
FROM AREA NATURAL JOIN ASIGNATURA;

-- Consulta 24: Listar los nombres de departamentos y los nombres de las áreas adscritas a ellos.
-- Ambos campos deben estar ordenados de forma alfabética.
SELECT D, AR
FROM DEPARTAMENTO NATURAL JOIN AREA
ORDER BY D, AR;

-- Consulta 25: Listar los nombres de departamentos y los profesores de cada uno de ellos. Ambos campos deben estar 
-- ordenados de forma alfabética.
SELECT D, P
FROM DEPARTAMENTO NATURAL JOIN PROFESOR NATURAL JOIN AREA
ORDER BY D, P;