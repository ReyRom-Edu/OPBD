-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lab_work7
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab_work7
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab_work7` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `lab_work7` ;

-- -----------------------------------------------------
-- Table `lab_work7`.`university`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_work7`.`university` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `rating` SMALLINT NOT NULL,
  `city` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_work7`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_work7`.`student` (
  `id` INT NOT NULL,
  `surname` VARCHAR(100) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `stipend` DECIMAL(7,2) NOT NULL,
  `kurs` TINYINT NOT NULL,
  `city` VARCHAR(100) NULL DEFAULT NULL,
  `birthday` DATE NULL DEFAULT NULL,
  `university_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_student_university1_idx` (`university_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_university1`
    FOREIGN KEY (`university_id`)
    REFERENCES `lab_work7`.`university` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lab_work7`.`lecturer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_work7`.`lecturer` (
  `id` INT NOT NULL,
  `surname` VARCHAR(100) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `city` VARCHAR(100) NOT NULL,
  `university_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_lecturer_university1_idx` (`university_id` ASC) VISIBLE,
  CONSTRAINT `fk_lecturer_university1`
    FOREIGN KEY (`university_id`)
    REFERENCES `lab_work7`.`university` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_work7`.`subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_work7`.`subject` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `hour` SMALLINT NOT NULL,
  `semester` TINYINT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_work7`.`exam_mark`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_work7`.`exam_mark` (
  `id` INT NOT NULL,
  `mark` TINYINT NULL,
  `exam_date` DATE NOT NULL,
  `subject_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_exam_mark_subject1_idx` (`subject_id` ASC) VISIBLE,
  INDEX `fk_exam_mark_student1_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `fk_exam_mark_subject1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `lab_work7`.`subject` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exam_mark_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `lab_work7`.`student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_work7`.`lecturer_has_subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_work7`.`lecturer_has_subject` (
  `lecturer_id` INT NOT NULL,
  `subject_id` INT NOT NULL,
  PRIMARY KEY (`lecturer_id`, `subject_id`),
  INDEX `fk_lecturer_has_subject_subject1_idx` (`subject_id` ASC) VISIBLE,
  INDEX `fk_lecturer_has_subject_lecturer_idx` (`lecturer_id` ASC) VISIBLE,
  CONSTRAINT `fk_lecturer_has_subject_lecturer`
    FOREIGN KEY (`lecturer_id`)
    REFERENCES `lab_work7`.`lecturer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lecturer_has_subject_subject1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `lab_work7`.`subject` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
