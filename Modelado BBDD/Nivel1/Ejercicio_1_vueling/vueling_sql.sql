-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema vueling
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema vueling
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vueling` DEFAULT CHARACTER SET utf8mb4 ;
USE `vueling` ;

-- -----------------------------------------------------
-- Table `vueling`.`Plane`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vueling`.`Plane` (
  `IdPlane` INT(4) NOT NULL AUTO_INCREMENT,
  `Capacity` INT(2) NOT NULL,
  `Model` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`IdPlane`),
  UNIQUE INDEX `id_plane` (`IdPlane` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `vueling`.`Seating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vueling`.`Seating` (
  `IdSeating` INT(4) NOT NULL AUTO_INCREMENT,
  `PlaneId` INT(4) NOT NULL,
  PRIMARY KEY (`IdSeating`),
  UNIQUE INDEX `id_seating` (`IdSeating` ASC),
  INDEX `planeId_idx` (`PlaneId` ASC),
  CONSTRAINT `PlaneId`
    FOREIGN KEY (`PlaneId`)
    REFERENCES `vueling`.`Plane` (`IdPlane`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
