-- En esta vista podemos observar las provincias y localidades donde han sido realizados los pedidos(TABLA "pedidos" y "clientes")
create view Pedido_Localidad as
select p.Pedido_id, p.pedido_fecha, c.Provincia, c.localidad
from pedidos p
join clientes c on p.pedido_fecha = c.Fecha;

select * from Pedido_Localidad;

-- Esta vista fue creada para poder ver el estado de todos los productos vendidos.(TABLA "inventario" y "entregas")
Create view Entrega_producto as
select  i.Cepa_ID, i.Nombre, i.Tipo, e.Estado
from inventario i 
join entregas e on i.Cepa_ID = e.Entregas_ID;

select * from Entrega_Producto;

-- Esta vista se encarga de mostrear todos aquello que todavia no han sido entregados(TABLAS "inventario" y "entregas")
create view producto_no_entregado as
select  i.Cepa_ID, i.Nombre, i.Tipo, e.Estado
from inventario i 
join entregas e on i.Cepa_ID = e.Entregas_ID
where Estado = 'Pendiente'; 

select * from producto_no_entregado;

-- Esta vista muestra los pagos recibidos a cambio de los productos(TABLAS "inventario" y "pedidos")
create view Pagos_Producto as
select i.Cepa_ID, i.Nombre, i.THC, i.CBD, p.pago
from inventario i
join pedidos p on i.Cepa_ID = p.Pedido_id;

select * from Pagos_Producto;

-- Vista diseñada para observar el mayor ingreso proveniente de una venta.(TABLAS "inventario" y "pedidos")
create view Pago_Max as
SELECT i.Cepa_ID, i.Nombre, i.THC, i.CBD, p.pago
FROM inventario i
JOIN pedidos p ON i.Cepa_ID = p.Pedido_id
WHERE p.pago = (SELECT MAX(pago) FROM pedidos);

select * from Pago_Max;

-- FUNCIONES 
DELIMITER $$

CREATE FUNCTION calcular_total_pedido(pedido_id INT) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    
   
    SELECT SUM(p.pago) INTO total
    FROM inventario i
    JOIN pedidos p ON i.Cepa_ID = p.Pedido_ID
    WHERE p.Pedido_ID = pedido_id;  
    
   
    RETURN total;
END$$

select calcular_total_pedido(1);
DELIMITER $$;

DELIMITER $$

CREATE FUNCTION calcular_promedio_thc_pedido(pedido_id INT) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE promedio_thc DECIMAL(10,2);

    SELECT AVG(i.THC) INTO promedio_thc
    FROM inventario i
    JOIN pedidos p ON i.Cepa_ID = p.Pedido_ID
    WHERE p.Pedido_ID = pedido_id;

    RETURN promedio_thc;
END$$

DELIMITER ;


SELECT calcular_promedio_thc_pedido(1) AS promedio_thc;


DELIMITER $$
CREATE FUNCTION obtener_fecha_entrega(pedido_id INT) 
RETURNS DATETIME
DETERMINISTIC
BEGIN
    DECLARE fecha_entrega DATETIME;
    
 
    SELECT entrega_fecha INTO fecha_entrega
    FROM entregas
    WHERE Pedido_ID = pedido_id
    LIMIT 1;  
    
    RETURN fecha_entrega;
END $$

DELIMITER $$ ;

SELECT obtener_fecha_entrega(2) AS fecha_de_entrega;


-- Que onda profes! deje estas lineas para que puedan verificar que pueden borrar las funciones y ver cuantas funciones existen el la BD
DROP FUNCTION IF EXISTS obtener_fecha_entrega; -- dejé estas lineas 
SHOW FUNCTION STATUS WHERE Db = 'always_high';

-- STORED PROCEDURES
delimiter $$
create procedure registrar_pedido (In Pedido_id int, in pedido_fecha date, in pago float)
begin 
	insert into pedidos (Pedido_id, pedido_fecha, pago)
    values (Pedido_id, pedido_fecha, pago);
    
    select '¡Pedido registrado con éxito!' as mensaje;
end $$
delimiter $$
 
call registrar_pedido(10, '2024-03-10', 150);

DELIMITER $$

CREATE PROCEDURE Estado_entrega(IN p_Entregas_ID INT)
BEGIN
    SELECT estado 
    FROM entregas 
    WHERE Entregas_ID = p_Entregas_ID  
    ORDER BY entrega_fecha
    LIMIT 1; 
END $$

DELIMITER ;

CALL Estado_entrega(3);
DELIMITER $$
create procedure obtener_info_cliente (in p_Customer_ID int) 
begin
	select c.Customer_ID, c.Fecha, c.Provincia, c.Localidad, i.nombre, i.thc
    from clientes c
    join inventario i on c.Customer_ID = i.Cepa_ID
    where Customer_ID = p_Customer_ID;
end $$
DELIMITER $$

CALL obtener_info_cliente(1);

-- lo mismo que en las funciones, usen estas lineas para probar lo que quieran. Saludos!
DROP PROCEDURE IF EXISTS Estado_entrega;
SHOW PROCEDURE STATUS WHERE db = 'always_high';

DELIMITER $$

CREATE TRIGGER Actualizar_estado_entrega
BEFORE UPDATE ON entregas
FOR EACH ROW 
BEGIN
    IF NEW.estado = 'Entregado' THEN
        SET NEW.entrega_fecha = NOW(); 
    END IF;
END $$

DELIMITER ;

update entregas
set estado = "entregado"
where Entregas_ID = 3;

select * from inventario;


DELIMITER $$

CREATE TRIGGER eliminar_cliente
AFTER DELETE ON clientes
FOR EACH ROW
BEGIN
    
END $$

DELIMITER ;

delete from clientes 
where Customer_ID = 8;

select * from clientes;




