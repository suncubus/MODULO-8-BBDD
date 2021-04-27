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
-- Table `stube`.`PlayList`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stube`.`PlayList` (
  `Idlist` INT NOT NULL AUTO_INCREMENT,
  `VideoId` INT NOT NULL,
  PRIMARY KEY (`Idlist`),
  UNIQUE INDEX `idlist_UNIQUE` (`Idlist` ASC),
  INDEX `videoId_idx` (`VideoId` ASC),
  CONSTRAINT `VideoId`
    FOREIGN KEY (`VideoId`)
    REFERENCES `stube`.`Video` (`Idvideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stube`.`UserVideo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stube`.`UserVideo` (
  `UserId` INT NOT NULL,
  `ListId` INT NOT NULL,
  INDEX `userId_idx` (`UserId` ASC),
  INDEX `listId_idx` (`ListId` ASC),
  CONSTRAINT `UserId`
    FOREIGN KEY (`UserId`)
    REFERENCES `stube`.`User` (`IdUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ListId`
    FOREIGN KEY (`ListId`)
    REFERENCES `stube`.`PlayList` (`Idlist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
