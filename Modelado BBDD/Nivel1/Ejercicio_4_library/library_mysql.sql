-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema library
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema library
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `library` DEFAULT CHARACTER SET utf8 ;
USE `library` ;

-- -----------------------------------------------------
-- Table `library`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`Autor` (
  `IdAutor` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Surname` VARCHAR(45) NOT NULL,
  `Adress` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`IdAutor`),
  UNIQUE INDEX `IdAutor_UNIQUE` (`IdAutor` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library`.`Stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`Stock` (
  `IdStock` INT NOT NULL AUTO_INCREMENT,
  `Stock` TINYINT NOT NULL,
  UNIQUE INDEX `IdStock_UNIQUE` (`IdStock` ASC) VISIBLE,
  PRIMARY KEY (`IdStock`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library`.`Books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`Books` (
  `IdBook` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(45) NOT NULL,
  `price` DECIMAL(7,3) NOT NULL,
  `AutorId` INT NOT NULL,
  `StockId` INT NOT NULL,
  PRIMARY KEY (`IdBook`),
  UNIQUE INDEX `IdBook_UNIQUE` (`IdBook` ASC) VISIBLE,
  INDEX `AutorId_idx` (`AutorId` ASC) VISIBLE,
  INDEX `StockId_idx` (`StockId` ASC) VISIBLE,
  CONSTRAINT `AutorId`
    FOREIGN KEY (`AutorId`)
    REFERENCES `library`.`Autor` (`IdAutor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `StockId`
    FOREIGN KEY (`StockId`)
    REFERENCES `library`.`Stock` (`IdStock`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library`.`Invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`Invoice` (
  `IdInvoice` INT NOT NULL AUTO_INCREMENT,
  `BookId` INT NOT NULL,
  PRIMARY KEY (`IdInvoice`),
  UNIQUE INDEX `IdInvoice_UNIQUE` (`IdInvoice` ASC) VISIBLE,
  INDEX `BookId_idx` (`BookId` ASC) VISIBLE,
  CONSTRAINT `BookId`
    FOREIGN KEY (`BookId`)
    REFERENCES `library`.`Books` (`IdBook`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`User` (
  `IdUser` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Surname` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Password` BINARY(20) NOT NULL,
  `InvoiceId` INT NOT NULL,
  UNIQUE INDEX `IdUser_UNIQUE` (`IdUser` ASC) VISIBLE,
  PRIMARY KEY (`IdUser`),
  INDEX `InvoiceId_idx` (`InvoiceId` ASC) VISIBLE,
  CONSTRAINT `InvoiceId`
    FOREIGN KEY (`InvoiceId`)
    REFERENCES `library`.`Invoice` (`IdInvoice`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
