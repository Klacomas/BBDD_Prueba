USE facturacion;
-- insertar 5 clientes
INSERT INTO clientes (cli_nombre, cli_rut, cli_dv, cli_direccion)
VALUES ('Pedro Tapia', 1, '9', 'los zorzales 1022');
INSERT INTO clientes (cli_nombre, cli_rut, cli_dv, cli_direccion)
VALUES ('Guillermo Tapia', 2, '7', 'los Jazmines 1023');
INSERT INTO clientes (cli_nombre, cli_rut, cli_dv, cli_direccion)
VALUES ('Pedro Meneses', 3, '5', 'la caldera 1024');
INSERT INTO clientes (cli_nombre, cli_rut, cli_dv, cli_direccion)
VALUES ('Alfonso Labra', 4, '3', 'la ladera 1025');
INSERT INTO clientes (cli_nombre, cli_rut, cli_dv, cli_direccion)
VALUES ('Joel Jorquera', 5, '1', 'cerro negro 1026');


-- insertar 3 categorias
INSERT INTO categorias (cat_nombre, cat_descripcion)
VALUES ('aseo', 'Productos de aseo e higiene personal');
INSERT INTO categorias (cat_nombre, cat_descripcion)
VALUES ('abarrotes', 'Productos de abarrotes');
INSERT INTO categorias (cat_nombre, cat_descripcion)
VALUES ('Panaderia', 'Pan, masas frescas y congeladas');

-- Insertar 8 productos
INSERT INTO productos(cat_id, pro_nombre, pro_descripcion, pro_valor_unitario) VALUES(1,'Jabon','Jabón suavizante',500);
INSERT INTO productos(cat_id, pro_nombre, pro_descripcion, pro_valor_unitario) VALUES(1,'Shampoo','Shampoo rosa mosqueta',750);
INSERT INTO productos(cat_id, pro_nombre, pro_descripcion, pro_valor_unitario) VALUES(1,'Pasta de dientes','Para dientes brillantes',1500);
INSERT INTO productos(cat_id, pro_nombre, pro_descripcion, pro_valor_unitario) VALUES(2,'Porotos','Poroto tórtola 1 kg',2150);
INSERT INTO productos(cat_id, pro_nombre, pro_descripcion, pro_valor_unitario) VALUES(2,'Tallarines','tallarines 87 400 gr',650);
INSERT INTO productos(cat_id, pro_nombre, pro_descripcion, pro_valor_unitario) VALUES(3,'Pan pita','Pan pita granel',1900);
INSERT INTO productos(cat_id, pro_nombre, pro_descripcion, pro_valor_unitario) VALUES(3,'Marraqueta','Marraqueta granel ',1350);
INSERT INTO productos(cat_id, pro_nombre, pro_descripcion, pro_valor_unitario) VALUES(3,'pan Ciabbata','Pan Ciabbatta unidad',1000);


-- insertar 10 facturas
-- 2 para cliente 1, con 2 y 3 productos
INSERT INTO facturas(cli_id, fac_fecha, fac_subtotal, fac_iva) VALUES(1, NOW(),0,0);
INSERT INTO detallesfacturas( fac_id, pro_id, det_cantidad) VALUES(1,1,2);
INSERT INTO detallesfacturas( fac_id, pro_id, det_cantidad) VALUES(1,2,2);

-- actualiza subtotal e iva
UPDATE facturas set 
	fac_subtotal= (SELECT sum(det_cantidad * pro_valor_unitario) subtotal
		FROM detallesfacturas df join productos p on df.pro_id = p.pro_id
		where fac_id=1) , 
	fac_iva=(fac_subtotal*0.19)
WHERE fac_id=1;

INSERT INTO facturas(cli_id, fac_fecha, fac_subtotal, fac_iva) VALUES(1, NOW(),0,0);
INSERT INTO detallesfacturas( fac_id, pro_id, det_cantidad) VALUES(2,1,2);
INSERT INTO detallesfacturas( fac_id, pro_id, det_cantidad) VALUES(2,2,2);
INSERT INTO detallesfacturas( fac_id, pro_id, det_cantidad) VALUES(2,3,3);

-- actualiza subtotal e iva
UPDATE facturas set 
	fac_subtotal= (SELECT sum(det_cantidad * pro_valor_unitario) subtotal
		FROM detallesfacturas df join productos p on df.pro_id = p.pro_id
		where fac_id=2) , 
	fac_iva=(fac_subtotal*0.19)
WHERE fac_id=2;

-- 3 para el cliente 2, con 3, 2 y 3 productos
INSERT INTO facturas(cli_id, fac_fecha, fac_subtotal, fac_iva) VALUES(2, NOW(),0,0);
INSERT INTO detallesfacturas( fac_id, pro_id, det_cantidad) VALUES(3,1,2);
INSERT INTO detallesfacturas( fac_id, pro_id, det_cantidad) VALUES(3,2,2);
INSERT INTO detallesfacturas( fac_id, pro_id, det_cantidad) VALUES(3,3,3);
-- actualiza subtotal e iva
UPDATE facturas set 
	fac_subtotal= (SELECT sum(det_cantidad * pro_valor_unitario) subtotal
		FROM detallesfacturas df join productos p on df.pro_id = p.pro_id
		where fac_id=3) , 
	fac_iva=(fac_subtotal*0.19)
WHERE fac_id=3;

INSERT INTO facturas(cli_id, fac_fecha, fac_subtotal, fac_iva) VALUES(2, NOW(),0,0);
INSERT INTO detallesfacturas( fac_id, pro_id, det_cantidad) VALUES(4,1,2);
INSERT INTO detallesfacturas( fac_id, pro_id, det_cantidad) VALUES(4,2,2);
-- actualiza subtotal e iva
UPDATE facturas set 
	fac_subtotal= (SELECT sum(det_cantidad * pro_valor_unitario) subtotal
		FROM detallesfacturas df join productos p on df.pro_id = p.pro_id
		where fac_id=4) , 
	fac_iva=(fac_subtotal*0.19)
WHERE fac_id=4;

INSERT INTO facturas(cli_id, fac_fecha, fac_subtotal, fac_iva) VALUES(2, NOW(),0,0);
INSERT INTO detallesfacturas( fac_id, pro_id, det_cantidad) VALUES(5,1,2);
INSERT INTO detallesfacturas( fac_id, pro_id, det_cantidad) VALUES(5,2,2);
INSERT INTO detallesfacturas( fac_id, pro_id, det_cantidad) VALUES(5,3,3);
-- actualiza subtotal e iva
UPDATE facturas set 
	fac_subtotal= (SELECT sum(det_cantidad * pro_valor_unitario) subtotal
		FROM detallesfacturas df join productos p on df.pro_id = p.pro_id
		where fac_id=5) , 
	fac_iva=(fac_subtotal*0.19)
WHERE fac_id=5;

-- 1 para el cliente 3, con 1 producto
INSERT INTO facturas(cli_id, fac_fecha, fac_subtotal, fac_iva) VALUES(3, NOW(),0,0);
INSERT INTO detallesfacturas( fac_id, pro_id, det_cantidad) VALUES(6,1,2);
-- actualiza subtotal e iva
UPDATE facturas set 
	fac_subtotal= (SELECT sum(det_cantidad * pro_valor_unitario) subtotal
		FROM detallesfacturas df join productos p on df.pro_id = p.pro_id
		where fac_id=6) , 
	fac_iva=(fac_subtotal*0.19)
WHERE fac_id=6;

-- 4 para el cliente 4, con 2, 3, 4 y 1 producto
INSERT INTO facturas(cli_id, fac_fecha, fac_subtotal, fac_iva) VALUES(4, NOW(),0,0);
INSERT INTO detallesfacturas( fac_id, pro_id, det_cantidad) VALUES(7,1,2);
INSERT INTO detallesfacturas( fac_id, pro_id, det_cantidad) VALUES(7,2,2);
-- actualiza subtotal e iva
UPDATE facturas set 
	fac_subtotal= (SELECT sum(det_cantidad * pro_valor_unitario) subtotal
		FROM detallesfacturas df join productos p on df.pro_id = p.pro_id
		where fac_id=7) , 
	fac_iva=(fac_subtotal*0.19)
WHERE fac_id=7;

INSERT INTO facturas(cli_id, fac_fecha, fac_subtotal, fac_iva) VALUES(4, NOW(),0,0);
INSERT INTO detallesfacturas( fac_id, pro_id, det_cantidad) VALUES(8,1,2);
INSERT INTO detallesfacturas( fac_id, pro_id, det_cantidad) VALUES(8,2,2);
INSERT INTO detallesfacturas( fac_id, pro_id, det_cantidad) VALUES(8,3,5);
-- actualiza subtotal e iva
UPDATE facturas set 
	fac_subtotal= (SELECT sum(det_cantidad * pro_valor_unitario) subtotal
		FROM detallesfacturas df join productos p on df.pro_id = p.pro_id
		where fac_id=8) , 
	fac_iva=(fac_subtotal*0.19)
WHERE fac_id=8;

INSERT INTO facturas(cli_id, fac_fecha, fac_subtotal, fac_iva) VALUES(4, NOW(),0,0);
INSERT INTO detallesfacturas( fac_id, pro_id, det_cantidad) VALUES(9,1,2);
INSERT INTO detallesfacturas( fac_id, pro_id, det_cantidad) VALUES(9,2,2);
INSERT INTO detallesfacturas( fac_id, pro_id, det_cantidad) VALUES(9,6,2);
INSERT INTO detallesfacturas( fac_id, pro_id, det_cantidad) VALUES(9,3,3);
-- actualiza subtotal e iva
UPDATE facturas set 
	fac_subtotal= (SELECT sum(det_cantidad * pro_valor_unitario) subtotal
		FROM detallesfacturas df join productos p on df.pro_id = p.pro_id
		where fac_id=9) , 
	fac_iva=(fac_subtotal*0.19)
WHERE fac_id=9;

INSERT INTO facturas(cli_id, fac_fecha, fac_subtotal, fac_iva) VALUES(4, NOW(),0,0);
INSERT INTO detallesfacturas( fac_id, pro_id, det_cantidad) VALUES(10,5,10);
-- actualiza subtotal e iva
UPDATE facturas set 
	fac_subtotal= (SELECT sum(det_cantidad * pro_valor_unitario) subtotal
		FROM detallesfacturas df join productos p on df.pro_id = p.pro_id
		where fac_id=10) , 
	fac_iva=(fac_subtotal*0.19)
WHERE fac_id=10;

