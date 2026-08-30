-- crear y usar la base de datos
create database tiendaropaonline;
use tiendaropaonline;

-- tabla 1: clientes
create table clientes (
    id_cliente int auto_increment primary key,
    nombre varchar(100) not null,
    email varchar(100) unique not null,
    telefono varchar(15),
    direccion varchar(255)
);

-- tabla 2: productos
create table productos (
    id_producto int auto_increment primary key,
    nombre_producto varchar(100) not null,
    talla varchar(10) not null,
    precio decimal(10, 2) not null,
    stock int not null
);

-- tabla 3: pedidos
create table pedidos (
    id_pedido int auto_increment primary key,
    fecha_pedido date not null,
    id_cliente int,
    estado varchar(50) default 'pendiente',
    foreign key (id_cliente) references clientes(id_cliente) on delete cascade
);

-- tabla 4: detalle_pedidos
create table detalle_pedidos (
    id_detalle int auto_increment primary key,
    id_pedido int,
    id_producto int,
    cantidad int not null,
    precio_unitario decimal(10, 2) not null,
    foreign key (id_pedido) references pedidos(id_pedido) on delete cascade,
    foreign key (id_producto) references productos(id_producto) on delete cascade
);
-- insertar 5 clientes
insert into clientes (nombre, email, telefono, direccion) values
('ana silva', 'ana.silva@email.com', '7000-1111', 'colonia escalón, san salvador'),
('carlos mendoza', 'carlos.m@email.com', '7000-2222', 'santa tecla, la libertad'),
('maría lópez', 'maria.l@email.com', '7000-3333', 'san miguel, san miguel'),
('jorge torres', 'jorge.t@email.com', '7000-4444', 'soyapango, san salvador'),
('lucía ramírez', 'lucia.r@email.com', '7000-5555', 'antiguo cuscatlán, la libertad');

-- insertar 5 productos de ropa
insert into productos (nombre_producto, talla, precio, stock) values
('camiseta básica blanca', 'm', 15.99, 50),
('pantalón denim clásico', '32', 35.50, 30),
('chaqueta de cuero', 'l', 89.99, 15),
('vestido de verano floral', 's', 28.00, 25),
('sudadera con capucha negra', 'xl', 40.00, 40);

-- insertar 5 pedidos
insert into pedidos (fecha_pedido, id_cliente, estado) values
('2026-08-20', 1, 'entregado'),
('2026-08-22', 2, 'en camino'),
('2026-08-25', 3, 'pendiente'),
('2026-08-26', 1, 'pendiente'),
('2026-08-27', 4, 'procesando');

-- insertar 5 detalles de pedidos
insert into detalle_pedidos (id_pedido, id_producto, cantidad, precio_unitario) values
(1, 1, 2, 15.99), 
(1, 2, 1, 35.50), 
(2, 4, 1, 28.00), 
(3, 3, 1, 89.99), 
(4, 5, 2, 40.00);
-- mostrar todos los clientes
select * from clientes;
-- mostrar todos los productos
select * from productos;
-- mostrar todos los pedidos
select * from pedidos;
-- mostrar el detalle de los pedidos
select * from detalle_pedidos;