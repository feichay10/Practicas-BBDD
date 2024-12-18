-- Consulta 1: Obtener la fecha del sistema
SELECT SYSDATE
FROM DUAL;

-- Consulta 2: Obtener la hora del sistema
SELECT TO_CHAR(SYSDATE, 'HH-MI-SS')
FROM DUAL;

-- Consulta 3: Dar la fecha del sistema con el formato día de la semana, día del mes, mes y año
SELECT TO_CHAR(SYSDATE, 'DAY DD-MM-YYYY')
FROM DUAL;

-- Consulta 4: Dar la hora del sistema en formato de reloj de 25 horas.
SELECT TO_CHAR(SYSDATE, 'HH24:MM')
FROM DUAL;

-- Consulta 5: Obtener el número de días que lleva impartiendo la asignatura con código 11 el profesor con DNI 8888
SELECT SYSDATE - (SELECT FI
                  FROM PLAN_DOCENTE
                  WHERE (CAS = 11) AND (DNI = 8888)) AS DIAS_IMPARTIDOS
FROM DUAL;

-- Consulta 6: Listar los nombres de profesores que han impartido una asignatura más de 365 días.
SELECT P
FROM PROFESOR
WHERE DNI IN (SELECT DNI
              FROM PLAN_DOCENTE
              WHERE (FF - FI) >= 365);

-- Consulta 7: Hallar el número de profesores del departamento 'ASTROFISICA'
SELECT COUNT(P)
FROM PROFESOR NATURAL JOIN DEPARTAMENTO NATURAL JOIN AREA
WHERE D = 'ASTROFISICA';

-- Consulta 8: Hallar para cada departamento el número de profesores que tiene. Ordena la salida alfabéticamente.
SELECT D, COUNT(P)
FROM DEPARTAMENTO NATURAL JOIN AREA NATURAL JOIN PROFESOR
GROUP BY D
ORDER BY D;

-- Consulta 9: Hallar en cuantas titulaciones imparte el departamento de ‘ESTADISTICA, INVESTIGACION OPERATIVA Y COMPUTACION'
SELECT COUNT(T)
FROM ASIGNATURA NATURAL JOIN DEPARTAMENTO NATURAL JOIN AREA
WHERE D = 'ESTADISTICA, INVESTIGACION OPERATIVA Y COMPUTACION';

-- Consulta 10: Hallar el número de profesores adscritos a áreas cuyo nombre (el de las áreas) empiece por 'A'
SELECT COUNT(P)
FROM PROFESOR NATURAL JOIN AREA
WHERE AR LIKE 'A%';

-- Consulta 11: Hallar para cada titulación el número de asignatuas que tiene. Ordena la salida alfabéticamente.
SELECT T, COUNT(A)
FROM ASIGNATURA
GROUP BY T
ORDER BY T;

-- Consulta 12: Listar el nombre de la asignatura con más créditos teóricos.
SELECT A
FROM ASIGNATURA
WHERE CT IN (SELECT MAX(CT)
             FROM ASIGNATURA);

-- Consulta 13: Listar el nombre de la asignatura con menos créditos teóricos.
SELECT A
FROM ASIGNATURA
WHERE CT IN (SELECT MIN(CT)
             FROM ASIGNATURA);

-- Consulta 14: Listar para cada asignatura el número total de créditos que tiene.
SELECT A, CT+CP+CL AS "CREDITOS TOTALES"
FROM ASIGNATURA;

-- Consulta 15: Listar el nombre de las asignatura con más créditos.
SELECT A
FROM ASIGNATURA
WHERE CT+CP+CL IN (SELECT MAX(CT+CP+CL)
                   FROM ASIGNATURA);

-- Consulta 16: Listar el nombre de la asignatura con menos créditos.
SELECT A
FROM ASIGNATURA
WHERE CT+CP+CL IN (SELECT MIN(CT+CP+CL)
                   FROM ASIGNATURA);

-- Consulta 17: Listar el nombre del área a la que está adscrita la asignatura con más créditos.
SELECT AR
FROM AREA NATURAL JOIN ASIGNATURA
WHERE CP+CT+CL IN (SELECT MAX(CP+CT+CL)
                   FROM ASIGNATURA);

-- Consulta 18: Hallar el número de asignaturas impartidas por el profesor con DNI 1111
SELECT COUNT(A)
FROM ASIGNATURA NATURAL JOIN PROFESOR
WHERE DNI = 1111
GROUP BY A;

-- Consulta 19: Hallar el número de créditos impartidos por el profesor con DNI 1111
SELECT SUM(CTA+CPA+CLA) AS CREDITOS_1111
FROM PLAN_DOCENTE
WHERE DNI = 1111;

-- Consulta 20: Hallar el nombre del profesor que más créditos imparte actualmente.
SELECT P
FROM PROFESOR NATURAL JOIN PLAN_DOCENTE
WHERE CTA+CPA+CLA IN (SELECT MAX(CTA+CPA+CLA)
                      FROM PLAN_DOCENTE
                      WHERE FF IS NULL);

-- Consulta 21: Hallar el número medio de asignaturas adscritas a cada área.
SELECT AVG(COUNT(A)) AS MEDIA_AREA
FROM AREA NATURAL JOIN ASIGNATURA
GROUP BY AR;

-- Consulta 22: Hallar el número medio de profesores de cada departamento.
SELECT AVG(COUNT(P)) AS MEDIA_PROFE
FROM PROFESOR NATURAL JOIN AREA NATURAL JOIN DEPARTAMENTO
GROUP BY D;

-- Consulta 23: Hallar los nombres de las áreas que tengan más de 3 asignaturas.
SELECT AR
FROM AREA NATURAL JOIN ASIGNATURA
GROUP BY AR
HAVING COUNT(A) > 3;

-- Consulta 24: Hallar los nombres de las áreas que tengan más de 6 asignaturas.
SELECT AR
FROM AREA NATURAL JOIN ASIGNATURA
GROUP BY AR
HAVING COUNT(A) > 6;

-- Consulta 25: Hallar el nombre del departamento con menos profesores.
SELECT D
FROM DEPARTAMENTO NATURAL JOIN AREA NATURAL JOIN PROFESOR
GROUP BY P
HAVING COUNT(P) IN (SELECT MIN(COUNT(P))
                   FROM DEPARTAMENTO NATURAL JOIN AREA NATURAL JOIN PROFESOR
                   GROUP BY D);