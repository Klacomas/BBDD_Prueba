-- Crea la base de datos
CREATE SCHEMA IF NOT EXISTS `facturacion` DEFAULT CHARACTER SET utf8mb4 ;

-- Crea la tabla de clientes
CREATE TABLE `facturacion`.`clientes` (
  `cli_id` INT NOT NULL AUTO_INCREMENT,
  `cli_nombre` VARCHAR(45) NOT NULL,
  `cli_rut` VARCHAR(8) NOT NULL,
  `cli_dv` VARCHAR(1) NOT NULL,
  `cli_direccion` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`cli_id`));

-- Crea tabla facturas
CREATE TABLE `facturacion`.`facturas` (
  `fac_id` INT NOT NULL AUTO_INCREMENT,
  `cli_id` INT NOT NULL,
  `fac_fecha` DATE NOT NULL,
  `fac_subtotal` INT NOT NULL,
  `fac_iva` INT NOT NULL,
  PRIMARY KEY (`fac_id`),
  UNIQUE INDEX `fac_id_UNIQUE` (`fac_id` ASC) VISIBLE,
  INDEX `cli_id_idx` (`cli_id` ASC) VISIBLE,
  CONSTRAINT `cli_id`
    FOREIGN KEY (`cli_id`)
    REFERENCES `facturacion`.`clientes` (`cli_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- Crea tabla categorias
CREATE TABLE `facturacion`.`categorias` (
  `cat_id` INT NOT NULL AUTO_INCREMENT,
  `cat_nombre` VARCHAR(45) NOT NULL,
  `cat_descripcion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`cat_id`));

-- Crea tabla productos
CREATE TABLE `facturacion`.`productos` (
  `pro_id` INT NOT NULL AUTO_INCREMENT,
  `cat_id` INT NOT NULL,
  `pro_nombre` VARCHAR(100) NOT NULL,
  `pro_descripcion` VARCHAR(200) NULL,
  `pro_valor_unitario` INT NOT NULL,
  PRIMARY KEY (`pro_id`),
  UNIQUE INDEX `pro_id_UNIQUE` (`pro_id` ASC) VISIBLE,
  INDEX `FK_cat_id_idx` (`cat_id` ASC) VISIBLE,
  CONSTRAINT `FK_cat_id`
    FOREIGN KEY (`cat_id`)
    REFERENCES `facturacion`.`categorias` (`cat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    -- Crea tabla detallefacturas
CREATE TABLE `facturacion`.`detallesfacturas` (
  `det_id` INT NOT NULL AUTO_INCREMENT,
  `fac_id` INT NOT NULL,
  `pro_id` INT NOT NULL,
  `det_cantidad` DECIMAL(2) NOT NULL,
  PRIMARY KEY (`det_id`),
  UNIQUE INDEX `det_id_UNIQUE` (`det_id` ASC) VISIBLE,
  INDEX `FK_fac_id_idx` (`fac_id` ASC) VISIBLE,
  CONSTRAINT `FK_fac_id`
    FOREIGN KEY (`fac_id`)
    REFERENCES `facturacion`.`facturas` (`fac_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
