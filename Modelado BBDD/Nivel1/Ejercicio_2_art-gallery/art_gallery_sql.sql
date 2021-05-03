-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema art-gallery
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema art-gallery
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `art-gallery` DEFAULT CHARACTER SET utf8mb4 ;
USE `art-gallery` ;

-- -----------------------------------------------------
-- Table `art-gallery`.`Author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `art-gallery`.`Author` (
  `idAuthor` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT 'anonymous',
  PRIMARY KEY (`idAuthor`),
  UNIQUE INDEX `idAuthor_UNIQUE` (`idAuthor` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `art-gallery`.`Picture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `art-gallery`.`Picture` (
  `IdPicture` INT NOT NULL AUTO_INCREMENT,
  `Price` DECIMAL(19,4) NOT NULL,
  `Stock` INT NOT NULL,
  `AuthorId` INT NOT NULL,
  PRIMARY KEY (`IdPicture`),
  UNIQUE INDEX `IdPicture_UNIQUE` (`IdPicture` ASC),
  INDEX `AuthorId_idx` (`AuthorId` ASC),
  CONSTRAINT `AuthorId`
    FOREIGN KEY (`AuthorId`)
    REFERENCES `art-gallery`.`Author` (`idAuthor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `art-gallery`.`Buyer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `art-gallery`.`Buyer` (
  `IdBuyer` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Surname` VARCHAR(45) NOT NULL,
  `Nie` VARCHAR(8) NOT NULL,
  `PictureId` INT NOT NULL,
  PRIMARY KEY (`IdBuyer`),
  INDEX `PictureId_idx` (`PictureId` ASC),
  UNIQUE INDEX `IdBuyer_UNIQUE` (`IdBuyer` ASC),
  CONSTRAINT `PictureIdFk`
    FOREIGN KEY (`PictureId`)
    REFERENCES `art-gallery`.`Picture` (`IdPicture`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
