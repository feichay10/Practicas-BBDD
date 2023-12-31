-- Eliminar tablas si existen
DROP TABLE IF EXISTS DEPARTAMENTO;
DROP TABLE IF EXISTS AREA;
DROP TABLE IF EXISTS PROFESOR;
DROP TABLE IF EXISTS ASIGNATURA;
DROP TABLE IF EXISTS PLAN_DOCENTE;

-- Crear tablas
CREATE TABLE DEPARTAMENTO (
  CD NUMBER(2) PRIMARY KEY,
  D VARCHAR2(60)
);

CREATE TABLE AREA (
  CAR NUMBER(3)  PRIMARY KEY, 
  AR VARCHAR2(60), 
  CD NUMBER(2)  REFERENCES DEPARTAMENTO ON DELETE CASCADE
);

CREATE TABLE PROFESOR (
  DNI NUMBER(8) PRIMARY KEY, 
  P VARCHAR2(60), 
  CAR NUMBER(3), 
  CAT VARCHAR2(5), 
  FOREIGN KEY (CAR) REFERENCES AREA ON DELETE SET NULL
);

CREATE TABLE ASIGNATURA (
  CAS NUMBER(3) PRIMARY KEY, 
  A VARCHAR2(50) NOT NULL, 
  T CHAR(4) NOT NULL,  
  CUR NUMBER(1) CHECK (CUR BETWEEN 1 AND 5),  
  CAR NUMBER(3) REFERENCES AREA ON DELETE SET NULL, 
  CT NUMBER(3,1) DEFAULT 0.0, 
  CP NUMBER(3,1) DEFAULT 0.0, 
  CL NUMBER(3,1) DEFAULT 0.0
);

CREATE TABLE PLAN_DOCENTE (
  DNI NUMBER(8), 
  CAS NUMBER(3), 
  CTA NUMBER(3,1)DEFAULT 0.0, 
  CPA NUMBER(3,1)DEFAULT 0.0, 
  CLA NUMBER(3,1)DEFAULT 0.0, 
  FI DATE DEFAULT SYSDATE, 
  FF DATE, 
  PRIMARY KEY (DNI, CAS, FI), 
  FOREIGN KEY (CAS) REFERENCES ASIGNATURA ON DELETE CASCADE, 
  FOREIGN KEY (DNI) REFERENCES PROFESOR ON DELETE CASCADE, 
  CONSTRAINT PD_CK1 CHECK (CTA + CPA + CLA > 0.0), 
  CONSTRAINT PD_CK2 CHECK (FF >= FI)
);

-- Insertar datos
-- DEPARTAMENTO
INSERT INTO DEPARTAMENTO 
  VALUES (1, 'ANALISIS MATEMATICO');

INSERT INTO DEPARTAMENTO
  VALUES (2, 'ASTROFISICA');

INSERT INTO DEPARTAMENTO 
  VALUES(3, 'ESTADISTICA, INVESTIGACION OPERATIVA Y COMPUTACION'); 

INSERT INTO DEPARTAMENTO 
  VALUES(4, 'MATEMATICA FUNDAMENTAL');

-- AREA
INSERT INTO AREA 
  VALUES(1, 'ALGEBRA', 4);

INSERT INTO AREA 
  VALUES(2, 'ANALISIS MATEMATICO', 1);

INSERT INTO AREA
  VALUES(3, 'ASTRONOMIA Y ASTROFISICA', 2);

INSERT INTO AREA
  VALUES(4, 'CIENCIAS DE LA COMPUTACION E INTELIGENCIA ARTIFICIAL', 3);

INSERT INTO AREA
  VALUES(5, 'DIDACTICA DE LA MATEMATICA', 1);

INSERT INTO AREA
  VALUES(6, 'ESTADISTICA E INVESTIGACION OPERATIVA', 3);

INSERT INTO AREA
  VALUES(7, 'LENGUAJES Y SISTEMAS INFORMATICOS', 3);

INSERT INTO AREA
  VALUES(8, 'MATEMATICA APLICADA', 1);

-- PROFESOR
INSERT INTO PROFESOR 
  VALUES(1111, 'JUAN', 6, 'CU');

INSERT INTO PROFESOR
  VALUES(2222, 'CARLOS', 7, 'TU');

INSERT INTO PROFESOR
  VALUES(3333, 'PEDRO', 4, 'TEU');

INSERT INTO PROFESOR
  VALUES(4444, 'MARIA', 7, 'TU');

INSERT INTO PROFESOR
  VALUES(5555, 'IVAN', 1, 'CEU');

INSERT INTO PROFESOR
  VALUES(6666, 'CARMEN', 3, 'CD');

INSERT INTO PROFESOR
  VALUES(7777, 'MARIO', 2, 'TU');

INSERT INTO PROFESOR
  VALUES(8888, 'FRANCISCO', 5, 'TU');

INSERT INTO PROFESOR
  VALUES(9999, 'ANGELA', 8, 'TEU');

INSERT INTO PROFESOR
  VALUES(1010, 'DAVID', 4, 'TU');

INSERT INTO PROFESOR
  VALUES(2020, 'SOLEDAD', 7, 'CU');

INSERT INTO PROFESOR
  VALUES(3030, 'JOSE MANUEL', 6, 'TEU');

-- ASIGNATURA
INSERT INTO ASIGNATURA 
  VALUES(1, 'BASES DE DATOS', 'GII', 3, 7, 3, 1.5, 1.5);

INSERT INTO ASIGNATURA
  VALUES(2, 'INTELIGENCIA ARTIFICIAL', 'GII', 3, 4, 1.5, 1.5, 3);

INSERT INTO ASIGNATURA
  VALUES(3, 'ALMACENES DE DATOS', 'MII', 1, 7, 1.5, 0, 1.5);

INSERT INTO ASIGNATURA
  VALUES(4, 'MINERIA DE DATOS', 'MII', 1, 7, 1.5, 0, 1.5);

INSERT INTO ASIGNATURA
  VALUES(5, 'INFORMATICA BASICA', 'GII', 1, 7, 3, 1.5, 1.5);

INSERT INTO ASIGNATURA
  VALUES(6, 'ALGEBRA', 'GII', 1, 1, 3, 3, 0);

INSERT INTO ASIGNATURA
  VALUES(7, 'CALCULO', 'GII', 1, 8, 3, 3, 0);

INSERT INTO ASIGNATURA
  VALUES(8, 'OPTIMIZACION', 'GII', 1, 6, 3, 1.5, 1.5);

INSERT INTO ASIGNATURA
  VALUES(9, 'GESTION DE RIESGOS', 'GII', 3, 4, 3, 0, 3);

INSERT INTO ASIGNATURA
  VALUES(10, 'ASTRONOMIA', 'GF', 2, 3, 3, 1.5, 1.5);

INSERT INTO ASIGNATURA
  VALUES(11, 'DIDACTICA DE LA MATEMATICA', 'GM', 2, 5, 6, 0, 0);

INSERT INTO ASIGNATURA
  VALUES(12, 'ANALISIS COMPLEJO', 'GM', 4, 2, 4.5, 3, 0);

-- PLAN_DOCENTE
INSERT INTO PLAN_DOCENTE 
  VALUES(4444, 1, 3, 1.5, 1.5, '01-SEP-11', NULL);

INSERT INTO PLAN_DOCENTE 
  VALUES(4444, 4, 1.5, 0, 1.5, '01-SEP-08', '31-AUG-10');

INSERT INTO PLAN_DOCENTE
  VALUES(4444, 5, 3, 0, 0, '01-SEP-10', NULL);

INSERT INTO PLAN_DOCENTE
  VALUES(1111, 8, 3, 1.5, 1.5, '01-SEP-07', '31-AUG-09');

INSERT INTO PLAN_DOCENTE
  VALUES(1111, 8, 3, 0, 0, '01-SEP-09', NULL);

INSERT INTO PLAN_DOCENTE
  VALUES(3030, 8, 0, 1.5, 1.5, '01-SEP-09', NULL);

INSERT INTO PLAN_DOCENTE
  VALUES(2222, 4, 1.5, 0, 1.5, '01-SEP-09', NULL);

INSERT INTO PLAN_DOCENTE
  VALUES(2222, 3, 1.5, 0, 1.5, '01-SEP-06', '31-AUG-07');

INSERT INTO PLAN_DOCENTE
  VALUES(1010, 2, 1.5, 1.5, 3, '01-SEP-05', '31-AUG-08');

INSERT INTO PLAN_DOCENTE
  VALUES(3333, 2, 1.5, 1.5, 3, '01-SEP-08', NULL);

INSERT INTO PLAN_DOCENTE
  VALUES(1010, 9, 3, 0, 3, '01-SEP-08', '31-AUG-09');

INSERT INTO PLAN_DOCENTE
  VALUES(1010, 9, 1.5, 0, 1.5, '01-SEP-09', NULL);

INSERT INTO PLAN_DOCENTE
  VALUES(9999, 7, 3, 3, 0, '01-SEP-10', NULL);

INSERT INTO PLAN_DOCENTE
  VALUES(5555, 6, 3, 3, 0, '31-MAR-10', NULL);

INSERT INTO PLAN_DOCENTE
  VALUES(6666, 10, 3, 1.5, 1.5, '01-SEP-08', '31-AUG-11');

INSERT INTO PLAN_DOCENTE
  VALUES(8888, 11, 6, 0, 0, '01-SEP-09', NULL);

INSERT INTO PLAN_DOCENTE
  VALUES(2020, 3, 1.5, 0, 1.5, '01-SEP-08', NULL);

INSERT INTO PLAN_DOCENTE
  VALUES(7777, 12, 4.5, 3, 0, '01-SEP-10', NULL);

INSERT INTO PLAN_DOCENTE
  VALUES(3333, 9, 1.5, 0, 1.5, '01-SEP-09', NULL);