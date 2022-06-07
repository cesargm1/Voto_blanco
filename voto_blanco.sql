DROP DATABASE IF EXISTS voto_blanco ;

CREATE DATABASE voto_blanco;

USE voto_blanco;

CREATE TABLE juzgados(
    id  INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    direccion VARCHAR(50),
    descripcion VARCHAR(25)
);
INSERT INTO  juzgados (direccion,descripcion) 
VALUES("calle_sal","hola"
     
);

CREATE TABLE juezes(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    juzgado_id INT  NOT NULL ,
    num_colegiado INT NOT NULL UNIQUE,
    nombre VARCHAR(25),
    fecha DATE ,
    FOREIGN KEY(juzgado_id) REFERENCES juzgados(id)
);

CREATE TABLE partidos(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50),
    direccion VARCHAR(50),
    telefono VARCHAR(25)
);

CREATE TABLE periodicos(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    partido_id INT,
    nombre VARCHAR(50),
    direccion VARCHAR(50),
    tirada VARCHAR(25),
    FOREIGN KEY (partido_id) REFERENCES partidos(id)
);


CREATE TABLE ciudadanos(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    partido_id INT,
    dni INT,
    nombre VARCHAR(50),
    direccion VARCHAR(50),
    cargo VARCHAR(25),
    patrimonio INT,
    FOREIGN KEY(partido_id) REFERENCES partidos(id)
);


CREATE TABLE casos (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    cod_cas INT UNIQUE,
    periodico_id INT,
    juez_id INT,
    nombre VARCHAR(50),
    descripcion VARCHAR(50),
    fecha_ini DATE,
    dictmanen TEXT,
    periodico_fecha DATE,
    FOREIGN KEY(periodico_id) REFERENCES periodicos(id),
    FOREIGN KEY(juez_id) REFERENCES juezes (id)
);

CREATE TABLE caso_ciudadanos(
    caso_id INT,
    ciudadano_id INT,
    ciudadano_grado VARCHAR(25),
    FOREIGN KEY (caso_id) REFERENCES casos (id),
    FOREIGN KEY (ciudadano_id) REFERENCES ciudadanos (id)
);