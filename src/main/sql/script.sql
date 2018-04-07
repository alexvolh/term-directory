-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema termsdirecorydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `termsdirecorydb` ;

-- -----------------------------------------------------
-- Schema termsdirecorydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `termsdirecorydb` ;
USE `termsdirecorydb` ;

-- -----------------------------------------------------
-- Table `termsdirecorydb`.`SUBJECT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `termsdirecorydb`.`SUBJECT` ;

CREATE TABLE IF NOT EXISTS `termsdirecorydb`.`SUBJECT` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `english` VARCHAR(128) NULL,
  `russian` VARCHAR(128) NULL,
  `ukraine` VARCHAR(128) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `termsdirecorydb`.`TERM`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `termsdirecorydb`.`TERM` ;

CREATE TABLE IF NOT EXISTS `termsdirecorydb`.`TERM` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `english` VARCHAR(45) NULL,
  `russian` VARCHAR(45) NULL,
  `ukraine` VARCHAR(45) NULL,
  `transcription` VARCHAR(45) NULL,
  `date_time_added` TIMESTAMP NULL,
  `description` LONGTEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `termsdirecorydb`.`SUBJECT_TERM`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `termsdirecorydb`.`SUBJECT_TERM` ;

CREATE TABLE IF NOT EXISTS `termsdirecorydb`.`SUBJECT_TERM` (
  `subject_id` BIGINT NOT NULL,
  `term_id` BIGINT NOT NULL,
  PRIMARY KEY (`subject_id`, `term_id`),
  INDEX `subject_term_idx` (`term_id` ASC),
  INDEX `term_subject_idx` (`subject_id` ASC),
  CONSTRAINT `fk_term_subject`
    FOREIGN KEY (`subject_id`)
    REFERENCES `termsdirecorydb`.`SUBJECT` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subject_term`
    FOREIGN KEY (`term_id`)
    REFERENCES `termsdirecorydb`.`TERM` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
