-- borrar la base de datos si ya existe para evitar errores
drop database if exists Practica1;
create database Practica1;
show databases;
use Practica1;

create table estudiante (
    id_estudiante int auto_increment primary key,
    nombre varchar(100) not null,
    correo varchar(100) unique,
    edad int check (edad >= 15),
    pais varchar(50) default 'el salvador'
);

create table curso (
    id_curso int auto_increment primary key,
    nombre varchar(100) not null unique,
    duracion int default 40 check (duracion > 0)
);

create table inscripcion (
    id_estudiante int,
    id_curso int,
    primary key(id_estudiante, id_curso),
    foreign key(id_estudiante)
	references estudiante(id_estudiante),
    foreign key(id_curso)
	references curso(id_curso)
);
show tables;

-- muestra la estructura de las tablas
describe estudiante;
describe curso;
describe inscripcion;

-- insertar estudiantes
insert into estudiante(nombre, correo, edad)
values
('Pedro', 'pedro@gmail.com', 17),
('Lucía', 'lucia@gmail.com', 18);

-- insertar cursos
insert into curso(nombre, duracion)
values
('base de datos', 60),
('programación', 80);

-- inscribir estudiantes en cursos
insert into inscripcion(id_estudiante, id_curso)
values
(1, 1),
(1, 2),
(2, 1);

-- consultar la información
select * from estudiante;
select * from curso;
select * from inscripcion;