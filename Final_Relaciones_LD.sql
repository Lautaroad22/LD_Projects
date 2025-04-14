ALTER TABLE AlwaysHigh
ADD CONSTRAINT fk_alwayshigh_cliente
FOREIGN KEY (Cliente_ID) REFERENCES Clientes(Customer_ID);

ALTER TABLE AlwaysHigh
ADD CONSTRAINT fk_alwayshigh_pedido
FOREIGN KEY (Encargo_ID) REFERENCES Pedidos(Pedido_id);

ALTER TABLE AlwaysHigh
ADD CONSTRAINT fk_alwayshigh_entrega
FOREIGN KEY (Envio_ID) REFERENCES Entregas(Entregas_ID);

ALTER TABLE AlwaysHigh
ADD CONSTRAINT fk_alwayshigh_inventario
FOREIGN KEY (Strain_ID) REFERENCES Inventario(Cepa_ID);

ALTER TABLE alwayshigh
ADD CONSTRAINT fk_alwayshigh_fecha
FOREIGN KEY (Plazo) REFERENCES  fecha(Fecha);
