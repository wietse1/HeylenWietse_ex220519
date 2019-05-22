-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`genes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`genes` (
  `idgenes` INT NOT NULL,
  `gene_name` VARCHAR(45) NULL,
  `start` INT NULL,
  `end` INT NULL,
  `chromosome` INT NULL,
  `desc` MEDIUMTEXT NULL,
  PRIMARY KEY (`idgenes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`syndrome` (
  `syndrome_name` VARCHAR(45) NULL,
  `desc_synd` MEDIUMTEXT NULL,
  `syndrome_ID` INT NOT NULL,
  UNIQUE INDEX `syndrome_ID_UNIQUE` (`syndrome_ID` ASC) VISIBLE,
  PRIMARY KEY (`syndrome_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`patients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`patients` (
  `patients_ID` INT NOT NULL,
  `patient_name` VARCHAR(45) NULL,
  `gender` ENUM("male", "female") NULL,
  `age` INT NULL,
  `fk_gene` INT NOT NULL,
  `fk_syndrome` INT NOT NULL,
  UNIQUE INDEX `patients_ID_UNIQUE` (`patients_ID` ASC) VISIBLE,
  PRIMARY KEY (`patients_ID`),
  UNIQUE INDEX `fk_gene_UNIQUE` (`fk_gene` ASC) VISIBLE,
  UNIQUE INDEX `fk_syndrome_UNIQUE` (`fk_syndrome` ASC) VISIBLE,
  CONSTRAINT `fk_gene`
    FOREIGN KEY (`fk_gene`)
    REFERENCES `mydb`.`genes` (`idgenes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_syndrome`
    FOREIGN KEY (`fk_syndrome`)
    REFERENCES `mydb`.`syndrome` (`syndrome_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
