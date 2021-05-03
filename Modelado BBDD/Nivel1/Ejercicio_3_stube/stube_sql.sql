-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema stube
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema stube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `stube` DEFAULT CHARACTER SET utf8 ;
USE `stube` ;

-- -----------------------------------------------------
-- Table `stube`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stube`.`User` (
  `IdUser` INT NOT NULL AUTO_INCREMENT,
  `Email` VARCHAR(45) NOT NULL,
  `Password` BINARY(20) NOT NULL,
  PRIMARY KEY (`IdUser`),
  UNIQUE INDEX `iduser_UNIQUE` (`IdUser` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stube`.`Video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stube`.`Video` (
  `Idvideo` INT NOT NULL AUTO_INCREMENT,
  `Ttitle` VARCHAR(45) NOT NULL,
  `Description` MEDIUMTEXT NOT NULL,
  `Url` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`Idvideo`),
  UNIQUE INDEX `idvideo_UNIQUE` (`Idvideo` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stube`.`Stube`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stube`.`Stube` (
  `VideoId` INT NOT NULL,
  `UserId` INT NOT NULL,
  INDEX `UserId_idx` (`UserId` ASC),
  INDEX `VideoId_idx` (`VideoId` ASC),
  CONSTRAINT `UserIdFk`
    FOREIGN KEY (`UserId`)
    REFERENCES `stube`.`User` (`IdUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `VideoIdFk`
    FOREIGN KEY (`VideoId`)
    REFERENCES `stube`.`Video` (`Idvideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
