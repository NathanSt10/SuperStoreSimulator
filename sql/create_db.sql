-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema super_store_sim_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema super_store_sim_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `super_store_sim_db` DEFAULT CHARACTER SET utf8mb3 ;
USE `super_store_sim_db` ;

-- -----------------------------------------------------
-- Table `super_store_sim_db`.`membership`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_store_sim_db`.`membership` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `membership_tier` VARCHAR(45) NOT NULL,
  `yearly_fee` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `membership_tier_UNIQUE` (`membership_tier` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `super_store_sim_db`.`members`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_store_sim_db`.`members` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `full_name` VARCHAR(100) GENERATED ALWAYS AS (concat(`first_name`,_utf8mb3' ',`last_name`)) VIRTUAL,
  `email` VARCHAR(320) NOT NULL,
  `phone_number` VARCHAR(45) NULL DEFAULT NULL,
  `membership` INT NOT NULL DEFAULT '0',
  `points` INT NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `ship-mem-idfk_idx` (`membership` ASC) VISIBLE,
  CONSTRAINT `ship-mem-idfk`
    FOREIGN KEY (`membership`)
    REFERENCES `super_store_sim_db`.`membership` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `super_store_sim_db`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_store_sim_db`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `super_store_sim_db`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_store_sim_db`.`department` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `super_store_sim_db`.`supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_store_sim_db`.`supplier` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `website` VARCHAR(2083) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `super_store_sim_db`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_store_sim_db`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `category_id` INT NOT NULL,
  `department_id` INT NOT NULL,
  `price` DECIMAL(10,2) NOT NULL DEFAULT '0.00',
  `quantity` INT NOT NULL DEFAULT '0',
  `supplier_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `dep-pro-idfk_idx` (`department_id` ASC) VISIBLE,
  INDEX `cat_pro_idfk_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `cat_pro_idfk`
    FOREIGN KEY (`category_id`)
    REFERENCES `super_store_sim_db`.`category` (`id`)
    ON DELETE RESTRICT,
  CONSTRAINT `dep_pro_idfk`
    FOREIGN KEY (`department_id`)
    REFERENCES `super_store_sim_db`.`department` (`id`)
    ON DELETE RESTRICT,
  CONSTRAINT `sup_pro_idfk`
    FOREIGN KEY (`category_id`)
    REFERENCES `super_store_sim_db`.`supplier` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `super_store_sim_db`.`bagcontents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_store_sim_db`.`bagcontents` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `member_id` INT NULL DEFAULT NULL,
  `product_id` INT NOT NULL,
  `product_quantity` INT NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `mem_bag_idfk_idx` (`member_id` ASC) VISIBLE,
  INDEX `pro_bag_idfk_idx` (`product_id` ASC) VISIBLE,
  UNIQUE INDEX `product_id_UNIQUE` (`product_id` ASC) VISIBLE,
  CONSTRAINT `mem_bag_idfk`
    FOREIGN KEY (`member_id`)
    REFERENCES `super_store_sim_db`.`members` (`id`),
  CONSTRAINT `pro_bag_idfk`
    FOREIGN KEY (`product_id`)
    REFERENCES `super_store_sim_db`.`product` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `super_store_sim_db`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_store_sim_db`.`employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `full_name` VARCHAR(45) GENERATED ALWAYS AS (concat(`first_name`,_utf8mb3' ',`last_name`)) VIRTUAL,
  `department_id` INT NULL DEFAULT NULL,
  `email` VARCHAR(320) NOT NULL,
  `phone_number` VARCHAR(45) NULL DEFAULT NULL,
  `wage` DECIMAL(10,2) NOT NULL DEFAULT '10.00',
  `years_worked` INT NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idemployee_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `dep-emp-idfk_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `dep-emp-idfk`
    FOREIGN KEY (`department_id`)
    REFERENCES `super_store_sim_db`.`department` (`id`)
    ON DELETE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `super_store_sim_db`.`manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_store_sim_db`.`manager` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `employee_id` INT NULL DEFAULT NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `department_id_UNIQUE` (`department_id` ASC) VISIBLE,
  UNIQUE INDEX `employee_id_UNIQUE` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `dep-man-idfk`
    FOREIGN KEY (`department_id`)
    REFERENCES `super_store_sim_db`.`department` (`id`)
    ON DELETE RESTRICT,
  CONSTRAINT `emp-man-idfk`
    FOREIGN KEY (`employee_id`)
    REFERENCES `super_store_sim_db`.`employee` (`id`)
    ON DELETE SET NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `super_store_sim_db`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_store_sim_db`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `member_id` INT NULL DEFAULT NULL,
  `cost` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `mem-ord-idfk_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `mem-ord-idfk`
    FOREIGN KEY (`member_id`)
    REFERENCES `super_store_sim_db`.`members` (`id`)
    ON DELETE SET NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `super_store_sim_db`.`orderdetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_store_sim_db`.`orderdetails` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` INT NULL DEFAULT NULL,
  `price` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `ord_det_idfk_idx` (`order_id` ASC) VISIBLE,
  INDEX `pro-det-idfk_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `ord_det_idfk`
    FOREIGN KEY (`order_id`)
    REFERENCES `super_store_sim_db`.`orders` (`id`),
  CONSTRAINT `pro-det-idfk`
    FOREIGN KEY (`product_id`)
    REFERENCES `super_store_sim_db`.`product` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `super_store_sim_db`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_store_sim_db`.`payment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `member_id` INT NULL DEFAULT NULL,
  `type` ENUM('Card', 'Check', 'Cash') NOT NULL DEFAULT 'Card',
  `payment_date` DATE NOT NULL,
  `total` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `mem_pay_idfk_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `mem_pay_idfk`
    FOREIGN KEY (`member_id`)
    REFERENCES `super_store_sim_db`.`members` (`id`)
    ON DELETE SET NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `super_store_sim_db`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_store_sim_db`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(20) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `member_id` INT NULL,
  `admin_rights` TINYINT(1) NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `member_id_UNIQUE` (`member_id` ASC) VISIBLE,
  CONSTRAINT `mem_user_idfk`
    FOREIGN KEY (`member_id`)
    REFERENCES `super_store_sim_db`.`members` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

