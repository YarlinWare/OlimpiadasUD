drop database olimpiadasud;
create database olimpiadasud;

-- Sede
CREATE TABLE sede(
    idComplejo  CHAR(5)  NOT NULL,
    nomComplejo VARCHAR(30)  NOT NULL,
    presupuesto NUMBER(7,2)  NOT NULL,
    direccion   VARCHAR(30)  NOT NULL,
        CONSTRAINT sede_id_pk PRIMARY KEY (idComplejo),
)

-- Sede único
CREATE TABLE unico(
    idUnico     VARCHAR(4)   NOT NULL,
    areaUnico   NUMBER(4,2)  NOT NULL,
        CONSTRAINT unico_id_pk PRIMARY KEY (idUnico),
)
-- Sede área
CREATE TABLE area(
    idArea      VARCHAR(3)   NOT NULL,
    nomArea     VARCHAR(10)  NOT NULL,
    ubicacion   VARCHAR(30)  NOT NULL,
        CONSTRAINT area_id_pk PRIMARY KEY (idArea),
)
-- Área polideportivo
CREATE TABLE polideportivo(
    idPoli      VARCHAR(4)  NOT NULL,
        CONSTRAINT polideportivo_id_pk PRIMARY KEY (idPoli),
)
-- Deporte
CREATE TABLE deporte(
    idDeporte       VARCHAR(3)   NOT NULL,
    nomDeporte      VARCHAR(30)  NOT NULL,
    nMaxIntegrantes NUMBER(2,0)  NOT NULL,
        CONSTRAINT deporte_id_pk PRIMARY KEY (idDeporte),
)
-- Estado
CREATE TABLE estado(
    idEstado    VARCHAR(2)  NOT NULL,
    descEstado  VARCHAR(30) NOT NULL,
        CONSTRAINT estado_id_pk PRIMARY KEY (idEstado),
)
-- Inventario
CREATE TABLE inventario(
    consecInve  NUMBER(4,0)  NOT NULL,
    nPiezas     NUMBER(3,0)  NOT NULL,
        CONSTRAINT inventario_id_pk PRIMARY KEY (consecInve),
)


-- Evento
CREATE TABLE evento(
    consec          NUMBER(5,0)  NOT NULL,
    fechaHora       DATE NOT NULL,
    duracion        TIME NOT NULL,
    nParticipante   NUMBER(3,0)  NOT NULL,
        CONSTRAINT evento_id_pk PRIMARY KEY (consec),
)

-- Comisario Evento
CREATE TABLE comisario_evento(
    consecComisario NUMBER(3,0)  NOT NULL,
    fechaHora       DATE NOT NULL,
        CONSTRAINT consec_comisario_pk PRIMARY KEY (consecComisario),
)

-- Persona
CREATE TABLE persona(
    codPersona      VARCHAR(4)  NOT NULL,
    nomPersona      VARCHAR(30) NOT NULL,
    apePersona      VARCHAR(30) NOT NULL,
    userPer         VARCHAR(6)  NOT NULL,
    correoPer       VARCHAR(50) NOT NULL,
    constrasenia    VARCHAR(5)  NOT NULL,
        CONSTRAINT cod_persona_pk PRIMARY KEY (codPersona),
)

-- Tarea
CREATE TABLE tarea(
    idTarea         VARCHAR(3)  NOT NULL,
    descTarea       VARCHAR(20)  NOT NULL,
        CONSTRAINT tarea_id_pk PRIMARY KEY (idTarea),
)

-- Tipo Persona
CREATE TABLE tipo_persona(
    idTipoPersona   VARCHAR(3)  NOT NULL,
    descTipoPersona VARCHAR(30)  NOT NULL,
        CONSTRAINT tipo_persona_id_pk PRIMARY KEY (idTipoPersona),
)

-- Deporte 2
CREATE TABLE deporte2(
    idDeporte       VARCHAR(3)  NOT NULL,
    nomDeporte      VARCHAR(30)  NOT NULL,
    nMaxIntegrantes NUMBER(2,0)  NOT NULL,
        CONSTRAINT deporte_id_pk PRIMARY KEY (idTipoPersona),
)

-- Equipo
CREATE TABLE equipo(
    idEquipo    VARCHAR(3)  NOT NULL,
    nomEquipo   VARCHAR(30)  NOT NULL,
    npartes     NUMBER(4,0)  NOT NULL,
        CONSTRAINT equipo_id_pk PRIMARY KEY (idEquipo),
)

-- Prestamo
CREATE TABLE prestamo(
    consecPrestamo  VARCHAR(3)  NOT NULL,
    fechaPrestamo   DATE NOT NULL,
        CONSTRAINT prestamo_id_pk PRIMARY KEY (idEquipo),
)

-- Tablas de rompimiento

-- 1. Deporte/Equipo

CREATE TABLE deporte_equipo(
    idDeporte   VARCHAR(3)  NOT NULL,
    idEquipo    VARCHAR(3)  NOT NULL,
        CONSTRAINT deporte_persona_id_pk PRIMARY KEY (idDeporte, idEquipo),
)

-- 2. Deporte/Persona

CREATE TABLE deporte_equipo(
    idDeporte   VARCHAR(3)  NOT NULL,
    codPersona  VARCHAR(4)  NOT NULL,
        CONSTRAINT deporte_persona_id_pk PRIMARY KEY (idDeporte, codPersona),
)

-- 3. Persona/Deporte2

CREATE TABLE persona_deporte2(
    codPersona  VARCHAR(4)  NOT NULL,
    idDeporte   VARCHAR(3)  NOT NULL,
        CONSTRAINT deporte_persona_id_pk PRIMARY KEY (codPersona, idDeporte),
)

-- Carga de datos

INSERT INTO <table> (<columnas>) VALUES (),(),(),(),()
();