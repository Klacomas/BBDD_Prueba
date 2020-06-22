USE facturacion;
-- ¿Que cliente realizó la compra más cara?
SELECT c.cli_rut,c.cli_dv, c.cli_nombre 
from clientes c join (
	SELECT cli_id
	  FROM facturas
	ORDER BY fac_subtotal DESC) a on c.cli_id=a.cli_id
LIMIT 1;

-- ¿Que cliente pagó sobre 100 de monto?
SELECT c.cli_rut, c.cli_dv, c.cli_nombre
  FROM clientes c JOIN (
	   SELECT cli_id
		 FROM facturas
         WHERE fac_subtotal > 100) a
WHERE c.cli_id=a.cli_id;

-- ¿Cuantos clientes han comprado el producto 6?

SELECT count(1)
  FROM clientes c join (
						SELECT f.cli_id
						  FROM facturas f join detallesfacturas df on f.fac_id = df.fac_id
						 WHERE df.pro_id = 6
						) a on c.cli_id=a.cli_id;