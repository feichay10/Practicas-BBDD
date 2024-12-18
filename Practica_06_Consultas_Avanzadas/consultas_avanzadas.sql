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

