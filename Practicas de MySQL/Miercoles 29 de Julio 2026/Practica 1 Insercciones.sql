-- borrar la base de datos si ya existe para evitar errores
drop database if exists practica1;
create database Practica1;

-- muestra las bases de datos
show databases;
use Practica1;

create table estudiante (
    id_estudiante int auto_increment primary key,
    nombre varchar(100) not null,
    correo varchar(100) unique,
    edad int check (edad >= 15),
    pais varchar(50) default 'El salvador'
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
-- muestra las tablas creadas
show tables;

-- muestra la estructura de las tablas
describe estudiante;
describe curso;
describe inscripcion;

-- inserta los estudiantes 
insert into estudiante(nombre, correo, edad)
values
('Pedro', 'pedro@gmail.com', 17),
('Lucia', 'lucia@gmail.com', 18),
('Carlos', 'carlos@gmail.com', 20),
('Ana', 'ana@gmail.com', 22),
('Sofia', 'sofia@gmail.com', 19),
('Diego', 'diego@gmail.com', 21);

-- insertar los cursos 
insert into curso(nombre, duracion)
values
('Base de datos', 60),
('Programacion', 80),
('Diseño web', 50),
('Inteligencia artificial', 100),
('Redes de computadoras', 70);

-- asignacion de estudiantes en cursos 
insert into inscripcion(id_estudiante, id_curso)
values
(1, 1), -- pedro en base de datos
(1, 2), -- pedro en programacion
(2, 1), -- lucia en base de datos
(3, 4), -- carlos en inteligencia artificial
(3, 5), -- carlos en redes de computadoras
(4, 1), -- ana en base de datos
(4, 3), -- ana en diseño web
(5, 2), -- sofia en programacion
(5, 3), -- sofia en diseño web
(6, 4); -- diego en inteligencia artificial

-- consulta la información
select * from estudiante;
select * from curso;
select * from inscripcion;