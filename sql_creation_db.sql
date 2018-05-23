-- MySQL Script generated by MySQL Workbench
-- Tue May 22 23:55:56 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema boleteria_progra
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `boleteria_progra` ;

-- -----------------------------------------------------
-- Schema boleteria_progra
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `boleteria_progra` DEFAULT CHARACTER SET utf8 ;
USE `boleteria_progra` ;

-- -----------------------------------------------------
-- Table `boleteria_progra`.`rol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `boleteria_progra`.`rol` ;

CREATE TABLE IF NOT EXISTS `boleteria_progra`.`rol` (
  `id_rol` INT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_rol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `boleteria_progra`.`persona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `boleteria_progra`.`persona` ;

CREATE TABLE IF NOT EXISTS `boleteria_progra`.`persona` (
  `id_persona` INT NOT NULL,
  `cedula` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido1` VARCHAR(45) NOT NULL,
  `apellido2` VARCHAR(45) NOT NULL,
  `correo_electronico` VARCHAR(60) NOT NULL,
  `telefono` VARCHAR(45) NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `contrasenna` BINARY(32) NOT NULL,
  `cambiar_contrasenna` TINYINT NULL DEFAULT 0,
  `id_rol` INT NULL,
  PRIMARY KEY (`id_persona`),
  INDEX `fk_persona_rol_idx` (`id_rol` ASC),
  CONSTRAINT `fk_persona_rol`
    FOREIGN KEY (`id_rol`)
    REFERENCES `boleteria_progra`.`rol` (`id_rol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `boleteria_progra`.`provincia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `boleteria_progra`.`provincia` ;

CREATE TABLE IF NOT EXISTS `boleteria_progra`.`provincia` (
  `id_provincia` INT NOT NULL,
  `descripcion` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_provincia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `boleteria_progra`.`canton`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `boleteria_progra`.`canton` ;

CREATE TABLE IF NOT EXISTS `boleteria_progra`.`canton` (
  `id_canton` INT NOT NULL,
  `descripcion` VARCHAR(50) NULL,
  `id_provincia` INT NULL,
  PRIMARY KEY (`id_canton`),
  INDEX `fk_provincia_canton_idx` (`id_provincia` ASC),
  CONSTRAINT `fk_provincia_canton`
    FOREIGN KEY (`id_provincia`)
    REFERENCES `boleteria_progra`.`provincia` (`id_provincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `boleteria_progra`.`distrito`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `boleteria_progra`.`distrito` ;

CREATE TABLE IF NOT EXISTS `boleteria_progra`.`distrito` (
  `id_distrito` INT NOT NULL,
  `descripcion` VARCHAR(50) NULL,
  `id_canton` INT NULL,
  PRIMARY KEY (`id_distrito`),
  INDEX `fk_canton_distrito_idx` (`id_canton` ASC),
  CONSTRAINT `fk_canton_distrito`
    FOREIGN KEY (`id_canton`)
    REFERENCES `boleteria_progra`.`canton` (`id_canton`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `boleteria_progra`.`direccion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `boleteria_progra`.`direccion` ;

CREATE TABLE IF NOT EXISTS `boleteria_progra`.`direccion` (
  `id_direccion` INT NOT NULL,
  `id_persona` INT NOT NULL,
  `descripcion` TEXT(500) NULL,
  `id_provincia` INT NULL,
  `id_canton` INT NULL,
  `id_distrito` INT NULL,
  PRIMARY KEY (`id_direccion`, `id_persona`),
  INDEX `fk_direccion_distrito_idx` (`id_distrito` ASC),
  INDEX `fk_direccion_canton_idx` (`id_canton` ASC),
  INDEX `fk_direccion_provincia_idx` (`id_persona` ASC),
  CONSTRAINT `fk_direccion_distrito`
    FOREIGN KEY (`id_distrito`)
    REFERENCES `boleteria_progra`.`distrito` (`id_distrito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_direccion_canton`
    FOREIGN KEY (`id_canton`)
    REFERENCES `boleteria_progra`.`canton` (`id_canton`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_direccion_provincia`
    FOREIGN KEY (`id_persona`)
    REFERENCES `boleteria_progra`.`persona` (`id_persona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `boleteria_progra`.`actividad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `boleteria_progra`.`actividad` ;

CREATE TABLE IF NOT EXISTS `boleteria_progra`.`actividad` (
  `id_actividad` INT NOT NULL,
  `titulo` VARCHAR(256) NULL,
  `participantes` VARCHAR(256) NULL,
  `descripcion` TEXT(1000) NULL,
  PRIMARY KEY (`id_actividad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `boleteria_progra`.`escenario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `boleteria_progra`.`escenario` ;

CREATE TABLE IF NOT EXISTS `boleteria_progra`.`escenario` (
  `id_escenario` INT NOT NULL,
  `nombre` VARCHAR(100) NULL,
  PRIMARY KEY (`id_escenario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `boleteria_progra`.`seccion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `boleteria_progra`.`seccion` ;

CREATE TABLE IF NOT EXISTS `boleteria_progra`.`seccion` (
  `id_seccion` INT NOT NULL,
  `nombre` VARCHAR(60) NULL,
  `cantidad_de_personas` INT NULL,
  `precio_seccion` DECIMAL(12,2) NULL,
  `seccion_con_asientos` TINYINT(1) NULL,
  `id_escenario` INT NULL,
  PRIMARY KEY (`id_seccion`),
  INDEX `fk_seccion_escenario_idx` (`id_escenario` ASC),
  CONSTRAINT `fk_seccion_escenario`
    FOREIGN KEY (`id_escenario`)
    REFERENCES `boleteria_progra`.`escenario` (`id_escenario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `boleteria_progra`.`asiento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `boleteria_progra`.`asiento` ;

CREATE TABLE IF NOT EXISTS `boleteria_progra`.`asiento` (
  `id_asiento` INT NOT NULL,
  `fila` INT NULL,
  `columna` INT NULL,
  `id_seccion` INT NULL,
  PRIMARY KEY (`id_asiento`),
  INDEX `fk_asiento_seccion_idx` (`id_seccion` ASC),
  CONSTRAINT `fk_asiento_seccion`
    FOREIGN KEY (`id_seccion`)
    REFERENCES `boleteria_progra`.`seccion` (`id_seccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `boleteria_progra`.`evento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `boleteria_progra`.`evento` ;

CREATE TABLE IF NOT EXISTS `boleteria_progra`.`evento` (
  `id_evento` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `hora` TIME(0) NOT NULL,
  `id_actividad` INT NULL,
  `id_escenario` INT NULL,
  `cant_max_entradas_persona` INT NULL,
  PRIMARY KEY (`id_evento`, `fecha`, `hora`),
  INDEX `fk_evento_actividad_idx` (`id_actividad` ASC),
  CONSTRAINT `fk_evento_actividad`
    FOREIGN KEY (`id_actividad`)
    REFERENCES `boleteria_progra`.`actividad` (`id_actividad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `boleteria_progra`.`estado_reservacion_asiento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `boleteria_progra`.`estado_reservacion_asiento` ;

CREATE TABLE IF NOT EXISTS `boleteria_progra`.`estado_reservacion_asiento` (
  `id_estado_reserva` INT NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`id_estado_reserva`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `boleteria_progra`.`asiento_reservado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `boleteria_progra`.`asiento_reservado` ;

CREATE TABLE IF NOT EXISTS `boleteria_progra`.`asiento_reservado` (
  `id_asiento_reservado` INT NOT NULL,
  `id_asiento` INT NULL,
  `id_evento` INT NULL,
  `id_estado_reserva` INT NULL,
  PRIMARY KEY (`id_asiento_reservado`),
  INDEX `fk_reservado_asiento_idx` (`id_asiento` ASC),
  INDEX `fk_reservado_evento_idx` (`id_evento` ASC),
  INDEX `fk_estado_reserva_idx` (`id_estado_reserva` ASC),
  CONSTRAINT `fk_reservado_asiento`
    FOREIGN KEY (`id_asiento`)
    REFERENCES `boleteria_progra`.`asiento` (`id_asiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservado_evento`
    FOREIGN KEY (`id_evento`)
    REFERENCES `boleteria_progra`.`evento` (`id_evento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_estado_reserva`
    FOREIGN KEY (`id_estado_reserva`)
    REFERENCES `boleteria_progra`.`estado_reservacion_asiento` (`id_estado_reserva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `boleteria_progra`.`boleto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `boleteria_progra`.`boleto` ;

CREATE TABLE IF NOT EXISTS `boleteria_progra`.`boleto` (
  `id_boleto` INT NOT NULL,
  `activo` TINYINT(1) NULL,
  `id_evento` INT NULL,
  `id_persona` INT NULL,
  `id_asiento_reservado` INT NULL,
  PRIMARY KEY (`id_boleto`),
  INDEX `fk_boleto_evento_idx` (`id_evento` ASC),
  INDEX `fk_boleto_persona_idx` (`id_persona` ASC),
  INDEX `fk_boleto_asiento_reservado_idx` (`id_asiento_reservado` ASC),
  CONSTRAINT `fk_boleto_evento`
    FOREIGN KEY (`id_evento`)
    REFERENCES `boleteria_progra`.`evento` (`id_evento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_boleto_persona`
    FOREIGN KEY (`id_persona`)
    REFERENCES `boleteria_progra`.`persona` (`id_persona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_boleto_asiento_reservado`
    FOREIGN KEY (`id_asiento_reservado`)
    REFERENCES `boleteria_progra`.`asiento_reservado` (`id_asiento_reservado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `boleteria_progra`.`eventos_por_escenario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `boleteria_progra`.`eventos_por_escenario` ;

CREATE TABLE IF NOT EXISTS `boleteria_progra`.`eventos_por_escenario` (
  `id_evento` INT NOT NULL,
  `id_escenario` INT NULL,
  INDEX `fk_evento_idx` (`id_evento` ASC),
  INDEX `fk_escenario_idx` (`id_escenario` ASC),
  CONSTRAINT `fk_evento`
    FOREIGN KEY (`id_evento`)
    REFERENCES `boleteria_progra`.`evento` (`id_evento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_escenario`
    FOREIGN KEY (`id_escenario`)
    REFERENCES `boleteria_progra`.`escenario` (`id_escenario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
