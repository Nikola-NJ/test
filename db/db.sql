-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema forma
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema forma
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `forma` DEFAULT CHARACTER SET utf8 ;
USE `forma` ;

-- -----------------------------------------------------
-- Table `forma`.`forma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forma`.`forma` (
  `formaID` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `opis` VARCHAR(255) NULL,
  PRIMARY KEY (`formaID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forma`.`answertype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forma`.`answertype` (
  `typeID` INT NOT NULL AUTO_INCREMENT,
  `tip` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`typeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forma`.`questions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forma`.`questions` (
  `questionsID` INT NOT NULL AUTO_INCREMENT,
  `pitanje` VARCHAR(255) NOT NULL,
  `typeID` INT NOT NULL,
  `formaID` INT NOT NULL,
  PRIMARY KEY (`questionsID`),
  INDEX `fk_questions_questiontype_idx` (`typeID` ASC) VISIBLE,
  INDEX `fk_questions_forma1_idx` (`formaID` ASC) VISIBLE,
  CONSTRAINT `fk_questions_questiontype`
    FOREIGN KEY (`typeID`)
    REFERENCES `forma`.`answertype` (`typeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_questions_forma1`
    FOREIGN KEY (`formaID`)
    REFERENCES `forma`.`forma` (`formaID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forma`.`answers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forma`.`answers` (
  `answerID` INT NOT NULL AUTO_INCREMENT,
  `odgovor` VARCHAR(45) NOT NULL,
  `questionsID` INT NOT NULL,
  PRIMARY KEY (`answerID`),
  INDEX `fk_answers_questions1_idx` (`questionsID` ASC) VISIBLE,
  CONSTRAINT `fk_answers_questions1`
    FOREIGN KEY (`questionsID`)
    REFERENCES `forma`.`questions` (`questionsID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forma`.`userRola`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forma`.`userRola` (
  `rolaID` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `opis` VARCHAR(45) NULL,
  PRIMARY KEY (`rolaID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forma`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forma`.`users` (
  `userID` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `rolaID` INT NOT NULL,
  PRIMARY KEY (`userID`),
  INDEX `fk_users_userRola1_idx` (`rolaID` ASC) VISIBLE,
  CONSTRAINT `fk_users_userRola1`
    FOREIGN KEY (`rolaID`)
    REFERENCES `forma`.`userRola` (`rolaID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forma`.`userAnswers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forma`.`userAnswers` (
  `userAnswersID` INT NOT NULL AUTO_INCREMENT,
  `userID` INT NOT NULL,
  `answerID` INT NOT NULL,
  PRIMARY KEY (`userAnswersID`),
  INDEX `fk_userAnswers_users1_idx` (`userID` ASC) VISIBLE,
  INDEX `fk_userAnswers_answers1_idx` (`answerID` ASC) VISIBLE,
  CONSTRAINT `fk_userAnswers_users1`
    FOREIGN KEY (`userID`)
    REFERENCES `forma`.`users` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_userAnswers_answers1`
    FOREIGN KEY (`answerID`)
    REFERENCES `forma`.`answers` (`answerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
