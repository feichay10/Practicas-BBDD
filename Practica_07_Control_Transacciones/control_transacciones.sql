-- Consulta 1: Listar todas las t-uplas de la tabla PROFESOR
SELECT * FROM PROFESOR;

-- Consulta 2: Añadir la siguiente t-upla a la tabla PROFESOR: (4040, 'CARMELO', 7, TU)
INSERT INTO PROFESOR
VALUES(4040, 'CARMELO', 7, 'TU');

-- Consulta 3: Listar todas las t-uplas de la tabla PROFESOR
SELECT * FROM PROFESOR;

-- Consulta 4: Deshacer los cambios
ROLLBACK WORK;

-- Consulta 5: Listar todas las t-uplas de la tabla PROFESOR
SELECT * FROM PROFESOR;

-- Consulta 6: Añadir la siguiente t-upla a la tabla PROFESOR: (4040, 'CARMELO', 7, TU)
INSERT INTO PROFESOR
VALUES(4040, 'CARMELO', 7, 'TU');

-- Consulta 7: Hacer permanentemente los cambios
COMMIT WORK;

-- Consulta 8: Añadir la siguiente t-upla a la tabla PROFESOR: (5050, 'CARINA', 9, CEU). Explica que ocurre
INSERT INTO PROFESOR
VALUES(5050, 'CARINA', 9, 'CEU');

-- Consulta 9: Añadir la siguiente t-upla a la tabla PROFESOR: (5050, 'CARINA', 8, CEU). Explica que ocurre
INSERT INTO PROFESOR
VALUES(5050, 'CARINA', 8, 'CEU');

-- Consulta 17: Eliminar de la tabla 'PLAN_DOCENTE' todas las t-uplas correspondientes al profesor con DNI 4444.
DELETE FROM PLAN_DOCENTE
WHERE DNI = 4444;

-- Consulta 18: Listar las t-uplas de la tabla 'PLAN_DOCENTE' correspondientes al profesor con DNI 4444.
SELECT *
FROM PLAN_DOCENTE
WHERE DNI = 4444;

-- Consulta 19: Establecer un punto de control con el nombre 'P1'
SAVEPOINT P1;

-- Consulta 20: Eliminar de la tabla 'PLAN_DOCENTE' todas las t-uplas correspondientes al profesor con DNI 1010.
DELETE FROM PLAN_DOCENTE
WHERE DNI = 1010;

-- Consulta 21: Establecer un punto de control con el nombre 'P2'
SAVEPOINT P2;

-- Consulta 22: Eliminar de la tabla 'PLAN_DOCENTE' todas las tuplas correspondientes al profesor con DNI 2222.
DELETE FROM PLAN_DOCENTE
WHERE DNI = 2222;

-- Consulta 23: Listar todas las t-uplas de la tabla 'PLAN_DOCENTE'
SELECT * FROM PLAN_DOCENTE;

-- Consulta 24: A ̃nadir a la tabla ‘PLAN DOCENTE’ la t-upla (1010, 9, 1.5, 0, 1.5, ‘01-SEP-09’, NULL). 
INSERT INTO PLAN_DOCENTE
VALUES(1010, 9, 1.5, 0, 1.5, ‘01-SEP-09’, NULL);

-- Consulta 25: Listar todas las t-uplas de la tabla 'PLAN_DOCENTE'
SELECT * FROM PLAN_DOCENTE;

-- Consulta 26: Deshacer los cambios hasta el punto de control P2.
ROLLBACK TO P2;

-- Consulta 27: Listar todas las t-uplas de la tabla 'PLAN_DOCENTE'
SELECT * FROM PLAN_DOCENTE;

-- Consulta 28: Deshacer los cambios hasta el punto de control P1.
ROLLBACK TO P1;

-- Consulta 29: Listar todas las t-uplas de la tabla 'PLAN_DOCENTE'
SELECT * FROM PLAN_DOCENTE;

-- Consulta 30: Deshacer los cambios hasta el inicio de la transacción
ROLLBACK;

-- Consulta 30: Listar todas las t-uplas de la tabla 'PLAN_DOCENTE'
SELECT * FROM PLAN_DOCENTE;