create database Coder_Lauty;
use Coder_lauty;


create table AlwaysHigh(
Id_transacción INT auto_increment primary key,
Cliente_ID INT,
Encargo_ID int,
Envio_ID int,
Plazo date,
Monto float, 
Strain_ID int);

CREATE TABLE Clientes(
Customer_ID INT auto_increment primary key,
Fecha DATE,
Provincia varchar(100),
localidad varchar(100),
cod_postal int);

Create table Pedidos (
Pedido_id INT auto_increment primary key,
pedido_fecha DATE,
pago float);

create table Fecha(
Fecha_ID int auto_increment primary key,
Fecha date,
Horario Time);

create table Entregas(
Entregas_ID int auto_increment primary key,
Estado varchar(100),
entrega_fecha date);

Create table Inventario(
Cepa_ID int auto_increment primary key,
Nombre varchar(100),
Descripción varchar(100),
Tipo varchar(100),
THC INT,
CBD INT);
select * from inventario;
Insert into fecha (Fecha_ID, Fecha, Horario)
values 
	(1,'2024-03-01', '10:30:00'),
    (2,'2024-03-02', '15:45:00'),
    (3,'2024-03-03', '18:00:00'),
    (4,'2024-03-04', '09:00:00'),
    (5,'2024-03-05', '12:30:00'),
    (6,'2024-03-06', '14:00:00'),
    (7,'2024-03-07', '16:45:00'),
    (8,'2024-03-08', '17:20:00');

select * from fecha;

insert into Inventario (Cepa_ID, Nombre, Descripción, Tipo, THC, CBD)
values
	(1, 'White Widow', 'Variedad clásica de cannabis', 'Sativa', 18.5, 0.5),
    (2, 'OG Kush', 'Popular entre los usuarios recreativos', 'Indica', 20.0, 1.0),
    (3, 'Northern Lights', 'Variedad con efecto relajante', 'Híbrida', 15.0, 1.5),
    (4, 'Purple Haze', 'Efecto energético, ideal para el día', 'Sativa', 19.0, 0.3),
    (5, 'Amnesia Haze', 'Variedad con sabor cítrico', 'Sativa', 21.0, 0.2),
    (6, 'Blueberry', 'Sabor dulce con efectos relajantes', 'Indica', 17.5, 1.2),
    (7, 'Cheese', 'Variedad con aroma fuerte y sabor único', 'Híbrida', 18.0, 0.8),
    (8, 'Granddaddy Purple', 'Ideal para aliviar el dolor', 'Indica', 16.5, 1.0);
    
Select * from inventario;

Insert into clientes (Customer_ID, Fecha, Provincia, localidad, cod_postal)
values
	(1, '2024-03-01', 'Buenos Aires', 'CABA', 1001),
    (2, '2024-03-02', 'Santa Fe', 'Rosario', 2000),
    (3, '2024-03-03', 'Córdoba', 'Córdoba Capital', 5000),
    (4, '2024-03-04', 'Mendoza', 'Mendoza Capital', 5500),
    (5, '2024-03-05', 'Buenos Aires', 'La Plata', 1900),
    (6, '2024-03-06', 'Chaco', 'Resistencia', 3500),
    (7, '2024-03-07', 'Tucumán', 'San Miguel de Tucumán', 4000),
    (8, '2024-03-08', 'Misiones', 'Posadas', 3300);
    
select * from clientes;

Insert into pedidos (Pedido_id, pedido_fecha, pago)
values
	(1, '2024-03-01', 100),
    (2, '2024-03-02', 50),
    (3, '2024-03-03', 30.95),
    (4, '2024-03-04', 122.99),
    (5, '2024-03-05', 95),
    (6, '2024-03-06', 88.30),
    (7, '2024-03-07', 70),
    (8, '2024-03-08', 110.50);
    
select * from pedidos;

insert into entregas (Entregas_ID, Estado, entrega_fecha)
values
    (1, 'Entregado', '2024-03-02'),
    (2, 'En tránsito', '2024-03-03'),
    (3, 'Pendiente', NULL),
    (4, 'Entregado', '2024-03-04'),
    (5, 'En tránsito', '2024-03-05'),
    (6, 'Pendiente', NULL),
    (7, 'Entregado', '2024-03-07'),
    (8, 'En tránsito', '2024-03-08');

select * from entregas;


insert into alwayshigh (Id_transacción,Cliente_ID ,Encargo_ID , Envio_ID, Plazo, Monto, Strain_ID)
values
	(1, 1, 1, 1, '2024-03-01', 5000, 1),
    (2, 2, 2, 2, '2024-03-02', 12000, 2),
    (3, 3, 3, 3, '2024-03-03', 15000, 3),
    (4, 4, 4, 4, '2024-03-04', 9000, 4),
    (5, 5, 5, 5, '2024-03-05', 14000, 5),
    (6, 6, 6, 6, '2024-03-06', 11000, 6),
    (7, 7, 7, 7, '2024-03-07', 13000, 7),
    (8, 8, 8, 8, '2024-03-08', 16000, 8);

