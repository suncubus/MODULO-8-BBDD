-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Social
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Social
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Social` DEFAULT CHARACTER SET utf8 ;
USE `Social` ;

-- -----------------------------------------------------
-- Table `Social`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Social`.`User` (
  `IdUser` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Password` BINARY(20) NOT NULL,
  PRIMARY KEY (`IdUser`),
  UNIQUE INDEX `IdUser_UNIQUE` (`IdUser` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Social`.`Friends`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Social`.`Friends` (
  `IdFriends` INT NOT NULL AUTO_INCREMENT,
  `Description` MEDIUMTEXT NOT NULL,
  `IdFriendUser` INT NOT NULL,
  UNIQUE INDEX `IdFriends_UNIQUE` (`IdFriends` ASC),
  INDEX `UserId_idx` (`IdFriendUser` ASC),
  PRIMARY KEY (`IdFriends`),
  CONSTRAINT `IdFriendUser`
    FOREIGN KEY (`IdFriendUser`)
    REFERENCES `Social`.`User` (`IdUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Social`.`photo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Social`.`photo` (
  `Idphoto` INT NOT NULL AUTO_INCREMENT,
  `Adress` VARCHAR(100) NOT NULL,
  `url` MEDIUMTEXT NOT NULL,
  `UserId` INT NOT NULL,
  UNIQUE INDEX `Idphoto_UNIQUE` (`Idphoto` ASC),
  PRIMARY KEY (`Idphoto`),
  INDEX `UserId_idx` (`UserId` ASC),
  CONSTRAINT `UserId`
    FOREIGN KEY (`UserId`)
    REFERENCES `Social`.`User` (`IdUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
