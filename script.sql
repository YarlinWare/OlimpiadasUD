-- Table: public.auth_group

-- DROP TABLE public.auth_group;

CREATE TABLE IF NOT EXISTS public.auth_group
(
    id integer NOT NULL DEFAULT nextval('auth_group_id_seq'::regclass),
    name character varying(150) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT auth_group_pkey PRIMARY KEY (id),
    CONSTRAINT auth_group_name_key UNIQUE (name)
)

TABLESPACE pg_default;

ALTER TABLE public.auth_group
    OWNER to postgres;
-- Index: auth_group_name_a6ea08ec_like

-- DROP INDEX public.auth_group_name_a6ea08ec_like;

CREATE INDEX auth_group_name_a6ea08ec_like
    ON public.auth_group USING btree
    (name COLLATE pg_catalog."default" varchar_pattern_ops ASC NULLS LAST)
    TABLESPACE pg_default;

-- -----------------------------------------------------


drop database olimpiadasud;
create database olimpiadasud;

-- Sede
CREATE TABLE campus_sede(
    id_complejo  CHAR(5)  NOT NULL,
    nom_complejo VARCHAR(30)  NOT NULL,
    presupuesto NUMBER(7,2)  NOT NULL,
    direccion   VARCHAR(30)  NOT NULL,
    CONSTRAINT sede_id_pk PRIMARY KEY (id_complejo),
);
-- Sede único
CREATE TABLE campus_unico(
    id_unico     VARCHAR(4)   NOT NULL,
    area_unico   NUMBER(4,2)  NOT NULL,
    id_complejo_fk CHAR(5),
    id_deporte_fk VARCHAR(4),
    CONSTRAINT unico_id_pk PRIMARY KEY (id_unico),
    CONSTRAINT 	id_complejo_fk FOREIGN KEY (id_complejo_fk) REFERENCES campus_sede (id_complejo),
    CONSTRAINT id_deporte_fk FOREIGN KEY (id_deporte_fk) REFERENCES sports_deporte(id_deporte)
);
-- Sede área
CREATE TABLE campus_area(
    id_area      VARCHAR(3)   NOT NULL,
    nom_area     VARCHAR(10)  NOT NULL,
    ubicacion   VARCHAR(30)  NOT NULL,
    id_complejo_fk	  CHAR(5),
    CONSTRAINT area_id_pk PRIMARY KEY (id_area)
    CONSTRAINT 	id_complejo_fk FOREIGN KEY (id_complejo_fk) REFERENCES campus_sede (id_complejo)
);
-- Área polideportivo
CREATE TABLE campus_polideportivo(
    id_poli         VARCHAR(4)  NOT NULL,
    id_area_fk      VARCHAR(3)   NOT NULL,
    id_deporte_fk   VARCHAR(4)    NOT NULL,
    CONSTRAINT polideportivo_id_pk PRIMARY KEY (id_poli),
    CONSTRAINT id_area_fk FOREIGN KEY (id_area_fk) REFERENCES campus_area (id_area),
    CONSTRAINT id_deporte_fk FOREIGN KEY (id_deporte_fk) REFERENCES sports_deporte(id_deporte)
);
-- Evento
CREATE TABLE campus_evento(
    consec_evento   NUMBER(5,0)  NOT NULL,
    fecha_hora      DATE NOT NULL,
    duracion        TIME NOT NULL,
    n_participante  NUMBER(3,0)  NOT NULL,
    id_complejo_fk	CHAR(5)  NOT NULL,
    id_deporte_fk   VARCHAR(3)   NOT NULL,
    id_area_fk      VARCHAR(3),
    cod_persona_fk  VARCHAR(4)  NOT NULL,
    CONSTRAINT 	evento_id_pk PRIMARY KEY (consec),
    CONSTRAINT 	id_complejo_fk FOREIGN KEY (id_complejo_fk) REFERENCES campus_sede (id_complejo),
    CONSTRAINT id_deporte_fk FOREIGN KEY (id_deporte_fk) REFERENCES sports_deporte (id_deporte),
    CONSTRAINT id_area_fk FOREIGN KEY (id_area_fk) REFERENCES campus_area (id_area),
    CONSTRAINT cod_persona_fk FOREIGN KEY (cod_persona_fk) REFERENCES users_persona (cod_persona)
);
-- Deporte
CREATE TABLE sports_deporte(
    id_deporte       VARCHAR(3)   NOT NULL,
    nom_deporte      VARCHAR(30)  NOT NULL,
    n_max_integrantes NUMBER(2,0)  NOT NULL,
    CONSTRAINT deporte_id_pk PRIMARY KEY (id_deporte)
);
-- Estado
CREATE TABLE sports_estado(
    id_estado    VARCHAR(2)  NOT NULL,
    desc_estado  VARCHAR(30) NOT NULL,
    CONSTRAINT estado_id_pk PRIMARY KEY (id_estado),
);
-- Inventario
CREATE TABLE sports_inventario(
    consec_inventario  NUMBER(4,0)  NOT NULL,
    n_piezas     NUMBER(3,0)  NOT NULL,
    id_complejo_fk  CHAR(5) NOT NULL,
    id_estado_fk    VARCHAR(2)  NOT NULL,
    id_equipo_fk    VARCHAR(3)  NOT NULL,
    CONSTRAINT inventario_id_pk PRIMARY KEY (consec_inventario),
    CONSTRAINT 	id_complejo_fk FOREIGN KEY (id_complejo_fk) REFERENCES campus_sede (id_complejo),
    CONSTRAINT 	id_estado_fk FOREIGN KEY (id_estado_fk) REFERENCES sports_estado (id_estado),
    CONSTRAINT 	id_equipo_fk FOREIGN KEY (id_equipo_fk) REFERENCES sports_equipo (id_equipo)
);
-- Deporte 2
CREATE TABLE sports_deporte2(
    id_deporte       VARCHAR(3)  NOT NULL,
    nom_deporte      VARCHAR(30)  NOT NULL,
    n_max_integrantes NUMBER(2,0)  NOT NULL,
        CONSTRAINT deporte_id_pk PRIMARY KEY (id_tipo_persona),
);
-- Equipo
CREATE TABLE sports_equipo(
    id_equipo    VARCHAR(3)  NOT NULL,
    nom_equipo   VARCHAR(30)  NOT NULL,
    n_partes     NUMBER(4,0)  NOT NULL,
        CONSTRAINT equipo_id_pk PRIMARY KEY (id_equipo),
);
-- Prestamo
CREATE TABLE sports_prestamo(
    consec_prestamo  VARCHAR(3)  NOT NULL,
    fecha_prestamo   DATE NOT NULL,
    cod_persona_fk      VARCHAR(4)  NOT NULL,
    id_estado_fk    VARCHAR(2)  NOT NULL,
    consec_inventario_fk  NUMBER(4,0)  NOT NULL,
    CONSTRAINT prestamo_id_pk PRIMARY KEY (id_equipo),
    CONSTRAINT cod_persona_fk FOREIGN KEY (cod_persona_fk) REFERENCES users_persona (cod_persona),
    CONSTRAINT id_estado_fk FOREIGN KEY (id_estado_fk) REFERENCES sports_estado (id_estado),
    CONSTRAINT consec_inventario_fk FOREIGN KEY (consec_inventario_fk) REFERENCES sports_inventario (consec_inventario)
);
-- Comisario Evento
CREATE TABLE users_comisarioevento(
    consec_comisario    NUMBER(3,0)  NOT NULL,
    fecha_hora          DATE NOT NULL,
    consec_evento_fk    NUMBER(5,0)  NOT NULL,
    cod_persona_fk      VARCHAR(4)  NOT NULL,
    id_tarea_fk         VARCHAR(3)  NOT NULL,
    CONSTRAINT consec_comisario_pk PRIMARY KEY (consec_comisario),
    CONSTRAINT consec_evento_fk FOREIGN KEY (consec_evento_fk) REFERENCES campus_evento (consec_evento),
    CONSTRAINT cod_persona_fk FOREIGN KEY (cod_persona_fk) REFERENCES users_persona (cod_persona),
    CONSTRAINT id_tarea_fk FOREIGN KEY (id_tarea_fk) REFERENCES users_tarea (id_tarea)
);
-- Persona
CREATE TABLE users_persona(
    cod_persona      VARCHAR(4)  NOT NULL,
    first_name      VARCHAR(30) NOT NULL,
    last_name      VARCHAR(30) NOT NULL,
    username         VARCHAR(6)  NOT NULL,
    email       VARCHAR(50) NOT NULL,
    password    VARCHAR(5)  NOT NULL,
    id_tipo_persona_fk   VARCHAR(3)  NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT cod_persona_pk PRIMARY KEY (cod_persona),
    CONSTRAINT id_tipo_persona_fk FOREIGN KEY (id_tipo_persona_fk) REFERENCES users_tipopersona (id_tipo_persona),
    CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES auth_user (id)
);
-- auth_user Django
-- id,first_name,last_name,username,email,password, is_superuser, is_staff, is_active, last_login, date_joined
CREATE TABLE auth_user(/*
    cod_persona      VARCHAR(4)  NOT NULL,
    first_name      VARCHAR(30) NOT NULL,
    last_name      VARCHAR(30) NOT NULL,
    username         VARCHAR(6)  NOT NULL,
    email       VARCHAR(50) NOT NULL,
    password    VARCHAR(5)  NOT NULL,
    id_tipo_persona_fk   VARCHAR(3)  NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT cod_persona_pk PRIMARY KEY (cod_persona),
    CONSTRAINT id_tipo_persona_fk FOREIGN KEY (id_tipo_persona_fk) REFERENCES users_tipopersona (id_tipo_persona),
    CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES auth_user (id)*/
);
-- Tarea
CREATE TABLE users_tarea(
    id_tarea         VARCHAR(3)  NOT NULL,
    desc_tarea       VARCHAR(20)  NOT NULL,
    CONSTRAINT tarea_id_pk PRIMARY KEY (id_tarea),
);
-- Tipo Persona
CREATE TABLE users_tipopersona(
    id_tipo_persona   VARCHAR(3)  NOT NULL,
    desc_tipo_persona VARCHAR(30)  NOT NULL,
    CONSTRAINT tipo_persona_id_pk PRIMARY KEY (id_tipo_persona),
);
-- Tablas de rompimiento

-- 1. Deporte/Equipo
CREATE TABLE sports_deporte_id_equipo_fk(
    id_deporte_fk   VARCHAR(3)  NOT NULL,
    id_equipo_fk    VARCHAR(3)  NOT NULL,
    CONSTRAINT deporte_equipo_id_pk PRIMARY KEY (id_deporte_fk, id_equipo_fk),
    CONSTRAINT id_deporte_fk FOREIGN KEY (id_deporte_fk) REFERENCES sports_deporte (id_deporte),
    CONSTRAINT 	id_equipo_fk FOREIGN KEY (id_equipo_fk) REFERENCES sports_equipo (id_equipo)
);
-- 2. Deporte/Persona
CREATE TABLE sports_deporte_cod_persona_fk(
    id_deporte_fk   VARCHAR(3)  NOT NULL,
    cod_persona_fk  VARCHAR(4)  NOT NULL,
    CONSTRAINT deporte_persona_id_pk PRIMARY KEY (id_deporte_fk, cod_persona_fk),
    CONSTRAINT id_persona_fk FOREIGN KEY (cod_persona_fk) REFERENCES users_persona (cod_persona),
    CONSTRAINT id_deporte_fk FOREIGN KEY (id_deporte_fk) REFERENCES sports_deporte (id_deporte)
);
-- 3. Persona/Deporte2
CREATE TABLE sports_deporte2_cod_persona_fk(
    cod_persona_fk  VARCHAR(4)  NOT NULL,
    id_deporte2_fk   VARCHAR(3)  NOT NULL,
    CONSTRAINT deporte_persona_id_pk PRIMARY KEY (cod_persona_fk, id_deporte2_fk),
    CONSTRAINT id_persona_fk FOREIGN KEY (cod_personaFk) REFERENCES users_persona (cod_persona),
    CONSTRAINT id_deporte_fk FOREIGN KEY (id_deporte_fk) REFERENCES sports_deporte2 (id_deporte)
);

-- Carga de datos

-- 1 Inscripcion de deportes
INSERT INTO sports_deporte (id_deporte, nom_deporte, n_max_integrantes, created, updated)
    values  ('ATH','Atletismo', 8, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
            ('BDM','Bádminton', 2, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
            ('BKB','Baloncesto', 5, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
            ('HBL','Balonmano', 7, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
            ('BSB','Béisbol Sóftbol', 9, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
            ('BTH','Biatlón', 8, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
            ('BOX','Boxeo', 1, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
            ('BMF','Ciclismo BMX Freestyle', 10, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
            ('BMX','Ciclismo BMX Racing', 10, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
            ('MTB','Ciclismo de Montaña', 50, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
            ('CTR','Ciclismo de Pista', 24, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
            ('CRD','Ciclismo de Ruta', 30, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
            ('CLB','Escalada Deportiva', 8, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
            ('FEN','Esgrima', 2, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
            ('FBL','Fútbol', 11, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
            ('FBS','Fútbol Sala', 5, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
            ('GAC','Gimnasia Acrobática', 1, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
            ('GAR','Gimnasia Artística', 1, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
            ('GTR','Gimnasia en Trampolín', 1, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
            ('GRY','Gimnasia Rítmica', 1, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
            ('GLF','Golf', 2, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
            ('HOC','Hockey sobre Césped', 11, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
            ('IHO','Hockey sobre Hielo', 6, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
            ('JUD','Judo', 1, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
            ('KTE','Karate', 1, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
            ('WRE','Lucha', 1, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
            ('SWM','Natación', 2, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
            ('OWS','Natación Aguas Abiertas', 6, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
            ('SWA','Natación Artística', 8, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
            ('FSK','Patinaje Artístico', 2, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

-- 2. Carga datos tipo persona
INSERT INTO users_tipopersona (id_tipo_persona, desc_tipo_persona, created, updated)
    values ('1','Administrador', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP), ('2','Comisario',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

-- 3. Inscribir personas
INSERT INTO auth_user (id,first_name,last_name,username,email,password, is_superuser, is_staff, is_active, last_login, date_joined)
VALUES 	('11', 'Jeff', 'Bezos', 'Jeff', 'jeff@olimpiadas.udistrital.co', '12346578', false, false,true, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
      	('2', 'Elon', 'Musk', 'Elon', 'elon@olimpiadas.udistrital.co', '12346578', false, false,true, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
      	('3', 'Bernard', 'Arnault', 'bernard', 'Bernard@olimpiadas.udistrital.co', '12346578', false, false,true, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
      	('4', 'Bill', 'Gates', 'Bill', 'bill@olimpiadas.udistrital.co', '12346578', false, false,true, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
      	('5', 'Mark', 'Zuckerberg', 'Mark', 'mark@olimpiadas.udistrital.co', '12346578', false, false,true, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
      	('6', 'Warren', 'Buffett', 'Warren', 'warren@olimpiadas.udistrital.co', '12346578', false, false,true, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
      	('7', 'Larry', 'Ellison', 'Larry', 'larry@olimpiadas.udistrital.co', '12346578', false, false,true, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
      	('8', 'Larry', 'Page', 'Larry323', 'larry@olimpiadas.udistrital.co', '12346578', false, false,true, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
      	('9', 'Sergey', 'Brin', 'Sergey', 'sergey@olimpiadas.udistrital.co', '12346578', false, false,true, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
      	('10', 'Mukesh', 'Ambani', 'Mukesh', 'mukesh@olimpiadas.udistrital.co', '12346578', false, false,true, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

INSERT INTO users_persona (cod_persona, created, updated, user_id, id_tipo_persona_fk_id)
VALUES 	('0111', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '11', '1'),
      	('0091', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '2', '2'),
      	('0121', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '3', '2'),
      	('0054', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '4', '2'),
      	('0037', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '5', '1'),
      	('0061', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '6', '2'),
      	('0087', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '7', '2'),
      	('0007', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '8', '2'),
      	('0023', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '9', '2'),
      	('0011', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '10', '2');

-- 4. Carga datos de sedes 
-- TO DO
INSERT INTO campus_sede (id_complejo, nom_complejo, presupuesto, direccion, created, updated)
values 	('00001','Soccer City', 90000, 'Sudáfrica', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('00002','Rungardo May Day', 90000, 'Corea del Norte', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('00003','Signal Iduna Park', 90000, 'Alemania', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('00004','Old Trafford', 90000, 'Inglaterra', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('00005','Estadio Nacional de Pekín', 90000, 'China', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('00006','Estadio Alberto José Armando', 90000, 'Argentina', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('00007','E. Antonio Vespucio Liberti', 90000, 'Argentina', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('00008','Estadio Azteca', 90000, 'México', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('00009','Estadio Wembley', 90000, 'Inglaterra', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('00010','Estadio Da Luz', 90000, 'Portugal', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('00012','Estadio Maracaná', 90000, 'Brasil', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('00013','Estadio Giuseppe Meazza', 90000, 'Italia', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('00014','Allianz Aren', 90000, 'Alemania', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('00015','Estadio Santiago Bernabeu', 90000, 'España', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('00016','Estadio Camp Nou', 90000, 'España', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- 5 Registrar 20 equipos deporte
INSERT INTO sports_equipo (id_equipo, nom_equipo, n_partes, created, updated)
values 	('001','BAY FC Bayern München Bayern', 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
	    ('002','AJAX', 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
	    ('003','CHELSEA', 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
	    ('004','FIORENTINA', 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
	    ('005','Los Angeles Lakers', 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
	    ('006','Chicago Bulls', 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
	    ('007','Boston Celtics', 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
	    ('008','Utah Jazz', 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
	    ('009','Vancouver Canucks', 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
	    ('010','Chicago Blackhawks', 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
	    ('011','Winnipeg Jets', 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
	    ('012','Ottawa Senators', 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
	    ('013','Sandra Sánchez', 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
	    ('014','Viviana Bottaro', 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
	    ('015','Kiyou Shimizu', 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
	    ('016','Ryo Kiyuna', 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
	    ('017','Saskia Loretta', 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
	    ('018','Inna Deriglázova', 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
	    ('019','Alexa Moreno', 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
	    ('020','Vitali Shcherbo', 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_deporte_id_equipo_fk (id_deporte_fk, id_equipo_fk, created, updated)
values 	('FBL','001', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('FBL','002', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('FBL','003', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('FBL','004', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('BKB','005', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('BKB','006', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('BKB','007', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('BKB','008', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('IHO','009', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('IHO','010', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('IHO','011', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('IHO','012', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('KTE','013', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('KTE','014', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('KTE','015', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('KTE','016', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('FEN','017', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('FEN','018', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('GAR','019', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
        ('GAR','020', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);





-- 7. Carga datos de estado
INSERT INTO sports_estado (id_estado, desc_estado, created, updated)
	values 	('1','Libre', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
			('2','Dañado', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
			('3','Perdido', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
			('4','Prestado', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
			('5','Préstamo evento', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
			('6','Préstamo práctica', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- 8. Carga datos de Tareas
INSERT INTO users_tarea (id_tarea, desc_tarea, created, updated)
	values 	('1','Juez', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
			('2','Observador', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

/*
********* Generador de Código UD (en construcción)***********
SELECT
  CONVERT(VARCHAR(4), YEAR(GETDATE())) --Año
+ (CASE WHEN MONTH(GETDATE()) < 7 THEN '01' ELSE '02' END) --Semestre
+ RIGHT(CONVERT(VARCHAR(4), E.IdCarrera) + '00', 2) --Carrera
+ RIGHT(CONVERT(VARCHAR(4), E.IdEstudia) + '000', 3) --ID Estudiante
FROM Estudiante E
*/

/*
*********** Con códigos estudiantiles ***********
INSERT INTO users_persona (cod_persona, created, updated, user_id)
VALUES 	('20171010111', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '1'),
      	('20171020091', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '2'),
      	('20181020121', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '3'),
      	('20182020054', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '4'),
      	('20191020037', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '5'),
      	('20192020061', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '6'),
      	('20201020087', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '7'),
      	('20202020007', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '8'),
      	('20211020023', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '9'),
      	('20212020011', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '10');
*/
